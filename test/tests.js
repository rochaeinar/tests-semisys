(function () {
    var request = require('supertest');
    var expect = require('chai').expect;
    var mongoose = require('mongoose');

    describe('Models', function () {
        var User;

        beforeEach(function (done) {
            mongoose.connect('mongodb://localhost/test_mongo_semisys');
            mongoose.connection.once('connected', () => {
                mongoose.connection.db.dropDatabase();

                User = require('../build/entities/users');
                // This is the right model because ^registerModels set it up for us.
                //User = mongoose.model('Users');
                done();
            });
        });

        afterEach(function (done) {
            mongoose.disconnect();
            done();
        });

        it('should not save without password', function (done) {
            var user = new User({
                userName: 'test'
            });
            user.save(function (err) {
                expect(err).to.exist
                    .and.be.instanceof(Error)
                    .and.have.property('message', 'Users validation failed: password: Path `password` is required.');
                done();
            });
        });

        it('should save successfully a user', function (done) {
            var user = new User({
                userName: 'test2',
                password: 'psw123'
            });

            user.save(function (err, result) {
                expect(result).to.exist
                    .and.have.property('_id');
                done();
            });
        });
    });

    describe('Responses', function () {

        var Responses;

        beforeEach(function (done) {
            Responses = require('../build/routes/responses');
            done();
        });

        afterEach(function (done) {
            done();
        });

        it('Success should be wrapped in an object an contains status, message and data properties ', function (done) {
            var response = {
                send: function (payload) {
                    expect(payload).to.exist.and.have.property('status');
                    expect(payload).to.exist.and.have.property('message');
                    expect(payload).to.exist.and.have.property('data');
                    done();
                }
            };
            new Responses().ok(response, {});
        });

        it('Unauthorized should create a message if parameters are empty or undefined ', function (done) {
            var response = {
                send: function (payload) {
                    expect(payload).to.exist.and.have.property('message', 'ERROR: Unauthorized: The server requires authorization to fulfill the request.');
                    done();
                }
            };
            new Responses().unauthorized(response);
        });

        it('Error should return a status 500 and message should be "Internal error" ', function (done) {
            var response = {
                send: function (payload) {
                    expect(payload).to.exist.and.have.property('message', 'ERROR: Internal error');
                    expect(payload).to.exist.and.have.property('status', 500);
                    done();
                }
            };
            new Responses().error(response);
        });

    });

})();