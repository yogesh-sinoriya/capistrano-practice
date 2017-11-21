var app = require('express')();

app.get('/', function(req, res){
	//res.status(200).sendFile(__dirname+'/index.html');
	res.status(200).end('Hi Guru');
});

app.listen('5000');
