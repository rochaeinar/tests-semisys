var defineSupportCode = require('cucumber').defineSupportCode;
var requester = require('./requester');
var {When} = require('cucumber');
defineSupportCode(function ({When}) {
    When('I call to the create subject Resource', function () {
        return requester.post(
            '/api/subject',
            {
                name: 'Test',
                code: '001'
            }
        );
    });
});
