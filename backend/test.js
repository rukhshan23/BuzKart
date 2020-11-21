var express = require("express");
bodyParser= require("body-parser");
let cors=require("cors");
var app=express();
var router=express.Router()
app.use(bodyParser.urlencoded({extended: true}))
app.use(bodyParser.json())

router.all("/",function (req,res){
	res.send({message: "welcome to our upload menu"})
});

app.use("/runtime",router)
app.listen(4000)
console.log("server is listening")