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
	let username= req.body.username
	let password= req.body.password

	connection.query('SELECT * FROM account WHERE email = ?',[username] ,async function (error,results,fields){
	if (error){
		res.send({
			'code':404,
			'message':'Servor error'
		});
	}
	if (results && results.length==1)
	{
	
		if (results[0].password==password)
		{
			connection.query('SELECT * FROM ?? WHERE account_id = ?',[results[0].type,results[0].account_id] ,async function (error,results2,fields){
			if (error){
				res.send({
				'code':404,
				'message':'Servor error'
			});
			}
			else{
				res.send({
				'success': true,
				'username':results2[0].name,
				'type':results[0].type

			});

			}

		});
		}
		else
		{
			res.send({
				'success':false,
				'msg':'Incorrect password. Please try again.'
			});

		}
	}
	else
	{
		res.send({
				'success':false,
				'msg':'No user exists with this email address.'
			});
	}

	});
};