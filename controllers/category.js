//import Prisma 
const prisma = require('../config/prisma')

exports.create = async (req, res) => {
    try {;
        //code
        const { name } = req.body
        const add = await prisma.category.create({
            data : {
                name: name
            }
        })
        res.send(add)
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}

exports.list = async (req, res) => {
    try {
        //code
        const list = await prisma.category.findMany()
        res.send(list)
    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })

    }
}

exports.remove = async (req, res) => {
    try {
        //code
        const { id } = req.params
        const remove = await prisma.category.delete({
            where : {
                id  : Number(id)
            }
        })
        console.log(id)
        res.send(remove)
        // console.log(req.params)
        // console.log(req.params.id)


    } catch (err) {
        //code
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}
