var express = require("express");
bodyParser= require("body-parser");
let cors=require("cors");
var news=require("./routes/news");
var addBuyer=require("./routes/addBuyer")
var deleteAccount=require("./routes/deleteAccount")

var addaccount=require("./routes/addaccount")
var addseller=require("./routes/addseller")
var addsubscription=require("./routes/addsubscription")
var login=require("./routes/login")

var app=express();
var router=express.Router();
app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());

router.all("/",function (req,res){
	res.send({message: "welcome to our upload menu"})
});
router.all("/news",cors(),news.display);
router.all("/addBuyer",cors(),addBuyer.display);
router.all("/addaccount",cors(),addaccount.display);
router.all("/addseller",cors(),addseller.display);
router.all("/addsubscription",cors(),addsubscription.display);
router.all("/deleteBuyer",cors(),deleteAccount.display);
router.all("/login",cors(),login.display);
app.use("/runtime",router);
app.listen(4000);
console.log("server is listening");