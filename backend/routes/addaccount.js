const mysql=require('mysql');

const connection = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'password',
	port:'3306',
	database: 'newschema_runtime'
});

connection.connect((err) => {
	if (err) throw err;
	console.log('Connected');
});

exports.display= async function(req,res){
	let email= req.body.email
	let password= req.body.password
	let sec_ques=req.body.sec_ques
	let sec_ans=req.body.sec_ans
	let type=req.body.type

	console.log(email);
	console.log(password);
	console.log(sec_ques);
	console.log(sec_ans);
	console.log(type);
	
	connection.query("insert into account (email,password,sec_ques,sec_ans,type) values(?,?,?,?,?)",[email,password,sec_ques,sec_ans,type] ,async function (error,results,fields){
	if (error){
		res.send({
			'code':404,
			'message':'Servor error. Try again',
			'success':false
		});
	}
	else{
		connection.query("SELECT* from account where email=?",[email] ,async function (error,results1,fields){
		if (error){
		res.send({
			'code':404,
			'message':'Servor error. Try again',
			'success':false
		});
		}
		else{
			res.send({
			'code':201,
			'message':"Successfull",
			'success':true,
			'account_id':results1[0].account_id,
			'type':results1[0].type

		});

		}
	});
	}
		
	});
};