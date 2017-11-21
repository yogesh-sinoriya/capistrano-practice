var expect  = require('chai').expect;
var request = require('request');

// it('Main page content', function(done) {
//     request('http://localhost:5000' , function(error, response, body) {
//     		console.log(body);
//         expect(body).to.equal('This is a great test by guru Node.JS Rocks!');
//         done();
//     });
// });

describe('Status and content', function() {
    describe ('Main page', function(done) {
        it('status', function(){
            request('http://localhost:5000/', function(error, response, body) {
                expect(response.statusCode).to.equal(200);
                done();
            });
        });

        // it('content', function(done) {
        //     request('http://localhost:5000/' , function(error, response, body) {
        //     		//console.log(body);
        //         expect(body).not.equal('This is a great test by guru Node.JS Rocks');
        //         done();
        //     });
        // });
    });

    describe ('About page', function() {
        it('status', function(done){
            request('http://localhost:5000/about', function(error, response, body) {
                expect(response.statusCode).to.equal(404);
                done();
            });
        });

    });
});