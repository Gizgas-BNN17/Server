//import Prisma 
const prisma = require('../config/prisma')
const bcrypt = require('bcryptjs')
const jwt = require('jsonwebtoken');
const { token } = require('morgan');

exports.register = async (req, res) => {
    //code ถ้า code error ใน try จะเด้ง เข้า catch
    //code
    try {
        const { email, password } = req.body;
        //Step 1 : Validate
        if (!email) {
            return res.status(400).json({ message: "Email is required" });
        }
        if (!password) {
            return res.status(400).json({ message: "Password is required" })
        }
        //Step 2 : Check Email in DB already ?
        const user = await prisma.user.findFirst({ where: { email: email } });
        if (user) {
            ///code
            return res.status(400).json({ message: "Email already exist !!" })
        }
        //Step 3 : Hash Password
        const hashedPassword = await bcrypt.hash(password, 10) //10 คือ เกลือ
        console.log(hashedPassword)
        //console.log("Email : " + email, "/ Password : " + password)
        //Step 4 Register
        await prisma.user.create({
            data: {
                email: email,
                password: hashedPassword
            }
        })

        res.send("Register Success");
    } catch (err) {
        console.log(err)
        res.status(500).json({ message: "Server Error" })
    }
}

exports.login = async (req, res) => {
    //code
    try {
        //code
        const { email, password } = req.body;
        console.log(email, password)
        //Step 1 Check Email in DB
        const user = await prisma.user.findFirst({
            where: {
                email: email
            }
        })
        //ถ้า ไม่มี email 
        if (!user || !user.enabled) {
            return res.status(400).json({
                message: "User Not found or not Enabled"
            })
        }
        //Step 2 Check Password in DB
        const isValidPassword = await bcrypt.compare(password, user.password)
        if (!isValidPassword) {
            return res.status(400).json({ message: "Password Invalid" })
        }
        //Step 3 Creat Payload
        const payload = {
            id: user.id,
            email: user.email,
            role: user.role
        }
        console.log(payload)
        //Step 4 Genarete Token
        jwt.sign(payload, process.env.SECRET,
            {
                expiresIn: '1d'
            },
            (err, token) => {
                if (err) {
                    return res.status(500).json({
                        message: "Login Error"
                    })
                }
                res.json({
                    payload, token
                })
            }
        )
        // res.send("Login Success");
    } catch (err) {
        console.log(err)
        res.status(500).json({
            message: "Server Error"
        })
    }
}

exports.currentUser = async (req, res) => {
    //code
    try {
        const user = await prisma.user.findFirst({
            where: {
                email: req.user.email
            },
            select : {
                id: true,
                email: true,
                name:true,
                role:true
            }
        })
        res.send(user)
    } catch (err) {
        console.log(err)
        res.status(500).json({
            message: "Server Error"
        })
    }
}
