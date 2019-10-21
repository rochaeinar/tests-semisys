# Tests Semisys

## Running Test System
[https://semisys.herokuapp.com](https://semisys.herokuapp.com)


## Execute System
- Prerequisites: Mongo DB
```npm install
bower install
grunt default
npm install
npm run start_server
```

## Execute Unit Test
```npm install
bower install
grunt default
npm install
npm run test
```
> Unit Test Execution.
![](https://github.com/rochaeinar/tests-semisys/blob/master/backend_unit_test.jpg)


## Execute Integration Test
- Prerequisites: Have the app running

```
grunt integration-tests
```

> Integration Test Execution.
![](https://github.com/rochaeinar/tests-semisys/blob/master/integration_tests.jpg)
