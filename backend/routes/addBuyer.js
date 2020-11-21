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
	let mailing_address=req.body.mailing_address
	let phone=req.body.phone
	let credit=req.body.credit
	let account_id=req.body.account_id
	connection.query("INSERT INTO buyer(name,mailing_address,phone,credit,account_id) values(?,?,?,?,?)",[name,mailing_address,phone,credit,account_id] ,async function (error,results,fields){
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
			'message':'Successfull',
			'success':true
		});
		
	}
	});
};