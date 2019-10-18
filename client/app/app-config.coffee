class AppConfig
  'use strict'

  constructor: () ->
    angular
    .module 'semi'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      'RestangularProvider'
      '$compileProvider'
      @AppConfiguration
    ]

  onRequestIntercepted: (element, operation, route, url, headers, params, httpConfig) =>
    onRetrieveCookies = (cookies) =>
      user = cookies.getObject 'user'
      if user? & angular.isDefined user
        headers['token'] = user.token
      request =
        element: element
        params: params
        headers: headers
        httpConfig: httpConfig
      request

    angular.injector ['ngCookies']
    .invoke ['$cookies', onRetrieveCookies]

  AppConfiguration: ($urlRouterProvider, $stateProvider, RestangularProvider, $compileProvider) =>
    RestangularProvider.setFullRequestInterceptor @onRequestIntercepted
    $compileProvider.preAssignBindingsEnabled(true);
    $urlRouterProvider.otherwise '/login'
    $stateProvider
    .state 'semisysapp', {
      url: '/semisysapp'
      templateUrl: 'app/main-navigation-template.html'
      controller: 'mainNavigationController'
      controllerAs: 'mainNavigationController'
    }
    .state 'login', {
      url: '/login'
      templateUrl: 'app/login/login.html'
      controller: 'loginController'
      controllerAs: 'loginController'
    }

new AppConfig();
