const mongoose = require("mongoose");

//connection to database
const connection = mongoose.createConnection("mongodb+srv://demo_user:A123456789s@cluster0.mhzvhez.mongodb.net/")
.on("open",()=>{
    console.log("Connected to database Successfully")
}).on("error",(err)=>{
    console.log("there was an error in your connection", err)
})

module.exports = connection;

