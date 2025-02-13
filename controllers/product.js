const prisma = require('../config/prisma')
const cloudinary = require('cloudinary').v2;

exports.create = async (req, res) => {
    try {
        const { title, description, price, quantity, categoryId, images } = req.body
        console.log(title, description, price, quantity, categoryId, images)
        const add = await prisma.product.create({
            data: {
                title: title,
                description: description,
                price: parseFloat(price),
                quantity: parseInt(quantity),
                categoryId: parseInt(categoryId),
                images: {
                    create: images.map((item) => ({
                        asset_id: item.asset_id,
                        public_id: item.public_id,
                        url: item.url,
                        secure_url: item.secure_url
                    })
                    )
                }

            }
        })
        res.send(add)
        //res.send("Create Product in controllers")
    } catch (err) {
        console.log(err)
        // res.status(500).send({ message: err.message })
        res.status(500).json({ message: "Server Error" })

    }
}

exports.read = async (req, res) => {
    try {
        //code
        const { id } = req.params
        //console.log(id)
        // console.log(typeof count)
        const read = await prisma.product.findFirst(
            {
                where: {
                    id: Number(id)
                },
                include: {
                    category: true,
                    images: true
                }
            }
        )
        res.send(read)
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

exports.list = async (req, res) => {
    try {
        //code
        const { count } = req.params
        console.log(count)
        console.log(typeof count)
        const list = await prisma.product.findMany(
            {
                take: parseInt(count),
                orderBy: { createdAt: 'asc' },
                include: {
                    category: true,
                    images: true
                }
            }
        )
        res.send(list)
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

exports.update = async (req, res) => {
    try {
        const { title, description, price, quantity, categoryId, images } = req.body
        //clear images
        await prisma.image.deleteMany({
            where: {
                productId: Number(req.params.id)
            }
        })
        // console.log(title, description, price, quantity, categoryId, images)
        const update = await prisma.product.update({
            where: {
                id: Number(req.params.id)
            },
            data: {
                title: title,
                description: description,
                price: parseFloat(price),
                quantity: parseInt(quantity),
                categoryId: parseInt(categoryId),
                images: {
                    create: images.map((item) => ({
                        asset_id: item.asset_id,
                        public_id: item.public_id,
                        url: item.url,
                        secure_url: item.secure_url
                    })
                    )
                }

            }
        })
        res.send(update)
        //res.send("Create Product in controllers")
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

exports.remove = async (req, res) => {
    try {
        //code
        const { id } = req.params
        const remove = await prisma.product.delete({
            where: {
                id: Number(id)
            }
        })
        res.send(remove)
    }
    catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

exports.listby = async (req, res) => {
    try {
        const { sort, order, limit } = req.body
        console.log(sort, order, limit)
        const listby = await prisma.product.findMany({
            take: limit,
            orderBy: { [sort]: order },
            include: {
                category: true,
            }

        })
        res.send(listby)
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

const handleQuery = async (req, res, query) => {
    try {
        //code
        const result = await prisma.product.findMany({
            where: {
                title: {
                    contains: query,
                }
            },
            include: {
                category: true,
                images: true
            }
        })
        res.send(result)
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Search Error" })

    }
}

const handlePrice = async (req, res, priceRange) => {
    try {
        //code
        const result = await prisma.product.findMany({
            where: {
                price: {
                    gte: priceRange[0],
                    lte: priceRange[1]
                }
            },
            include: {
                category: true,
                images: true
            }
        })
        res.send(result)
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Search Error" })
    }
}

const handleCategory = async (req, res, categoryId) => {
    try {
        //code
        const result = await prisma.product.findMany({
            where: {
                categoryId: {
                    in: categoryId.map((id) => Number(id))
                }
            },
            include: {
                category: true,
                images: true
            }
        })
        res.send(result)
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Search Error" })
    }
}

exports.search = async (req, res) => {
    try {
        //code
        const { query, category, price } = req.body
        if (query) {
            console.log('query-->', query)
            await handleQuery(req, res, query)
        }
        if (category) {
            console.log('category-->', category)
            await handleCategory(req, res, category)
        } if (price) {
            console.log('price-->', price)
            await handlePrice(req, res, price)
        }
        // res.send("Search Product in controllers")
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

 // Configuration
 cloudinary.config({ 
    cloud_name: process.env.CLOUDINARY_CLOUD_NAME, 
    api_key: process.env.CLOUDINARY_API_KEY, 
    api_secret: process.env.CLOUDINARY_API_SECRET // Click 'View API Keys' above to copy your API secret
});

exports.createImages = async (req, res) => {
    try {
        //code
         console.log(req.body)
        const result = await cloudinary.uploader.upload(req.body.images, {
            public_id: `Dessert-${Date.now()}`,
            resource_type: 'auto',
            folder: 'Dessert2025'
        })
        res.send(result)
    } catch (err) {
        //err
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}
exports.removeImages = async (req, res) => {
    try {
        //code
        const { public_id } = req.body
        // console.log(public_id)
        cloudinary.uploader.destroy(public_id, (result) => {
            res.send('Remove Image Success!!!')
        })

    } catch (err) {
        //err
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}