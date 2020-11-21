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
	
	let account_id=req.body.account_id
	connection.query("DELETE from account where account_id=?",[account_id] ,async function (error,results,fields){
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