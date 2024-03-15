const express = require("express")
const bodyParser = require("body-parser")
const UserRouter = require("./routers/user.router")

const app = express();
app.use(bodyParser.json()) //to check the data that comes from our routes
app.use("/", UserRouter)

module.exports =app;