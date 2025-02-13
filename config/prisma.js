const { PrismaClient } = require('@prisma/client')
const prisma = new PrismaClient()

// use prisma client to interact with the database
module.exports = prisma