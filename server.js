//Step 1 import ....
const express = require('express')
const app = express()
const morgan = require('morgan')
const authRouter = require('./routes/auth')
const categoryRouter = require('./routes/category')
const { readdirSync } = require('fs')
const cors = require('cors')

//use group {
//middleware
app.use(morgan('dev'))
//--
app.use(express.json({
    limit: '20mb'
}))
app.use(cors())
//}

// Step 3 Router
//{
// app.use('/api',authRouter)
// app.use('/api',categoryRouter)

// app.get('/api',(req,res)=>{
//     //code
//     const { email } = req.body
//     console.log("Start")
//     console.log(email)
//     console.log(req.body.email)
//     res.send('Jukkru 55')
// })
//}
//console
console.log(readdirSync('./routes'))
//--
readdirSync('./routes')
    .map((c) => app.use('/api', require('./routes/' + c)))
//Step 2 Start Server
app.listen(5000, () => console.log(`Server is running on port 5000`))