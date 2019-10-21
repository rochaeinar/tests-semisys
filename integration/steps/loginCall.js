var defineSupportCode = require('cucumber').defineSupportCode;
var requester = require('./requester');
defineSupportCode(function ({When}) {
    When('I call to the login Resource', function () {
        return requester.authenticate('admin', 'admin');
    });
});