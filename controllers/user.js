//import Prisma 
const prisma = require('../config/prisma')

exports.list = async (req, res) => {
    try {
        //code
        const list = await prisma.user.findMany({
            select: {
                id: true,
                email: true,
                role: true,
                enabled: true,
                address: true
            }
        })
        res.send(list)
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.changeStatus = async (req, res) => {
    try {
        //code 
        const { id, enabled } = req.body
        console.log(id, enabled)
        const user = await prisma.user.update({
            where: {
                id: Number(id)
            },
            data: {
                enabled: enabled
            }
        })
        res.send("Update Status Success")
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.changeRole = async (req, res) => {
    try {
        //code 
        const { id, role } = req.body
        console.log(id, role)
        const user = await prisma.user.update({
            where: {
                id: Number(id)
            },
            data: {
                role: role
            }
        })
        res.send("Update Role Success")
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.userCart = async (req, res) => {
    try {
        //code
        console.log("-------------userCart-------------")
        const { card } = req.body
        console.log('Server card : ',card)
        console.log(req.user.id)

        const user = await prisma.user.findFirst({
            where: {
                id: Number(req.user.id)
            }
        })
        console.log(user)
        // Delete old card item
        await prisma.productOnCard.deleteMany({
            where: {
                card: {
                    orderById: user.id
                }
            }
        })
        //Delete old card
        await prisma.card.deleteMany({
            where: {
                orderById: user.id
            }
        })
        //เตรียมสินค้า  จาก  const { card } = req.body
        let product = card.map((item) => ({
            productId: item.id,
            count: item.count,
            price: item.price
        }))
        console.log(product)
        //หาผลรวม
        let cardTotal = product.reduce((sum, item) => sum + item.price * item.count, 0)
        console.log(cardTotal)
        //New card
        const newCard = await prisma.card.create({
            data: {
                products: {
                    create: product
                },
                cardTotal: cardTotal,
                orderById: user.id
            }
        })
        res.send("userCart success")
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.getUserCart = async (req, res) => {
    try {
        //code
        const card = await prisma.card.findFirst({
            where: {
                orderById: Number(req.user.id)
            },
            include: {
                products: {
                    include: {
                        product: true
                    }
                }
            }
        })
        if (!card) {
            return res.status(400).json({ message: " No card" })
        }
        console.log(req.user.id)
        console.log(card)
        res.json({
            product: card.products,
            cardTotal: card.cardTotal
        })
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.emtyCart = async (req, res) => {
    try {
        //code
        const card = await prisma.card.findFirst({
            where: {
                orderById: Number(req.user.id)
            }
        })
        if (!card) {
            return res.status(400).json({ message: " No card" })
        }
        await prisma.productOnCard.deleteMany({
            where: {
                cardId: card.id
            }
        })
        const result = await prisma.card.deleteMany({
            where: {
                orderById: Number(req.user.id)
            }
        })
        console.log(result)
        res.json({
            message: "Cart is empty",
            deletedCount: result.count
        })
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.saveAddress = async (req, res) => {
    try {
        //code
        const { address } = req.body
        console.log(address)
        const saveAddress = await prisma.user.update({
            where: {
                id: Number(req.user.id)
            },
            data: {
                address: address
            }
        })
        res.json({
            ok: true,
            message: "Address saved success"
        })
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.saveOrder = async (req, res) => {
    try {
        //code
        //Step 1 Get User Card
        console.log("Step 1 Get User Card")
        const userCard = await prisma.card.findFirst({
            where: {
                orderedBy: {
                    id: Number(req.user.id)
                }
            },
            include: {
                products: true
            }
        })

        //Check quantity
        console.log("Check quantity")
        if (!userCard || userCard.products.length === 0) {
            return res.status(400).json({ ok: false, message: "Card is found" })
        }
        //Check empty
        console.log("Check empty")
        for (const item of userCard.products) {
            console.log(item)
            const product = await prisma.product.findUnique({
                where: { id: item.productId },
                select: { quantity: true, title: true }
            })
            // console.log(item)
            // console.log(product)
            if (!product || item.count > product.quantity) {
                return res.status(400).json({
                    ok: false,
                    message: `ขออภัย , สินค้า ${product?.title ||
                        'product'} มีจำนวนไม่เพียงพอ`
                })
            }
        }
        //Create a new Order
        console.log("Create a new Order")
        const order = await prisma.order.create({
            data: {
                products: {
                    create: userCard.products.map((item) => ({
                        productId: item.productId,
                        count: item.count,
                        price: item.price

                    }))
                }
                ,
                orderedBy: {
                    connect: { id: req.user.id }
                },
                cardTotal: userCard.cardTotal,
            }
        })
        console.log(order)
        //Update Product
        const update = userCard.products.map((item) => ({
            where: { id: item.id },
            data: {
                quantity: {
                    decrement: item.count
                },
                sold: {
                    increment: item.count
                }
            }
        }))
        console.log(update)

        await Promise.all(
            update.map((updated) => prisma.product.update(updated))
        )

        await prisma.card.deleteMany({
            where: {
                orderById: Number(req.user.id)
            }
        })

        res.json({
            message: "Check ok"
        })

    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}
exports.getOrder = async (req, res) => {
    try {
        //code
        const list = await prisma.order.findManynpm({
            where: {
                orderedById: Number(req.user.id)
            },
            include: {
                products: {
                    include: {
                        product: true
                    }
                }
            }
        })
        console.log(list)
        if(list.length === 0){
            res.json({message: "No orders found"})
        }
        res.send(list)
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}