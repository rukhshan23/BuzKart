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
	connection.query("SELECT * FROM buyer",async function (error,results,fields){
	if (error){
		res.send({
			'code':404,
			'message':'Servor error'
		});
	}
	else{
		results=JSON.parse(JSON.stringify(results));
		res.send(results);
	}
	});
};