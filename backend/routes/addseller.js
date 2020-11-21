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
	let name=req.body.name
	let subs_id=req.body.subs_id
	let phone=req.body.phone
	let discount=req.body.discount
	let account_id=req.body.account_id
	console.log(name);
	console.log(subs_id);
	console.log(phone);
	console.log(discount);
	console.log(account_id);
	connection.query("INSERT INTO seller(name,subs_id,phone,discount,account_id) values(?,?,?,?,?)",[name,subs_id,phone,discount,account_id] ,async function (error,results,fields){
	if (error){
		res.send({
			'code':404,
			'message':'Servor error',
			'success':false
		});
	}
	else{
		res.send({
			'code':202,
			'message':'Successful!',
			'success':true
		});
	}
	});
};