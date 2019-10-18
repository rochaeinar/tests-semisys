class TimetableConfig
  'use strict'

  constructor: () ->
    angular
    .module 'timetable'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      'RestangularProvider'
      @TimetableConfiguration
    ]

  TimetableConfiguration: ($urlRouterProvider, $stateProvider, RestangularProvider) ->
    $stateProvider
    .state 'tab.timetable', {
      url: '/horarios'
      templateUrl: 'app/common/timetable/timetable-template.html'
      controller: 'timetableController'
      controllerAs: 'timetableController'
    }

new TimetableConfig();
