const jwt = require('jsonwebtoken');
const prisma = require('../config/prisma');
const e = require('cors');


exports.authCheck = async (req, res, next) => {
    try {
        //code
        const handleToken = req.headers.authorization
        if (!handleToken) { return res.status(401).json({ message: "Unauthorized" }) }
        
        console.log(handleToken)
        const token = handleToken.split(" ")[1]
        console.log(token)
        const decode =  jwt.verify(token, process.env.SECRET)
        console.log(decode)
        req.user = decode
        console.log(req.user)
        const userValid = await prisma.user.findFirst({
            where : {
                email : req.user.email
            }
        })
        console.log(userValid)
        if(!userValid.enabled){
            return res.status(401).json({ message: "This account is not enabled" })
        }

        next()
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Token Invalid" })
    }
}

exports.adminCheck = async (req,res,next) => {
    try {
        const { email } = req.user
        console.log(email)
        const admin = await prisma.user.findFirst({
            where : {
                email : email
            }
        })
        if(!admin || admin.role !== 'admin'){
            return res.status(401).json({ message: "You are not an admin" })
        }
        next()
    }catch(err){
        console.log(err)
        res.status(500).json({message : "Admin access denied"})
    }
}