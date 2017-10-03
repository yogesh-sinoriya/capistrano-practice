var app = require('express')();

app.get('/', function(req, res){
	res.status(200).send('Hi Guru');
});

app.listen('5000');
