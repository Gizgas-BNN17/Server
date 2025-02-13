//import Prisma 
const prisma = require('../config/prisma')
exports.changeOrderStatus = async (req, res) => {
    try {
        const { orderId, orderStatus } = req.body;
        console.log(orderId, orderStatus)
        const orderUpdate = await prisma.order.update({
            where: {
                id: orderId
            },
            data: {
                orderStatus: orderStatus
            }
        })
        console.log(orderUpdate)
        res.send(orderUpdate)
    }
    catch (err) {
        console.error(err);
        res.status(500).send({ message: 'Error changing order status' });
    }
}
//test

exports.getOrderAdmin = async (req, res) => {
    try {
        const orders = await prisma.order.findMany({
            include: {
                products: {
                    include: {
                        product: true
                    }
                },
                orderedBy: {
                    select: {
                        id: true,
                        email: true,
                        address: true
                    }
                }
            }
        })
        res.send(orders)
    }
    catch (err) {
        console.error(err);
        res.status(500).send({ message: 'Error changing order status' });
    }
}