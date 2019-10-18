class StudentEditSpiritualConfig
  'use strict'

  constructor: () ->
    angular
    .module 'student'
    .config [
      '$urlRouterProvider'
      '$stateProvider'
      @StudentEditSpiritualConfig
    ]

  StudentEditSpiritualConfig: ($urlRouterProvider, $stateProvider) ->
    $stateProvider
    .state 'semisysapp.student-edit-spiritual', {
      url: '/estudiante-datos-espirituales-editar'
      templateUrl: 'app/student/student-edit-spiritual/student-edit-spiritual-template.html'
      controller: 'StudentEditSpiritualController'
      controllerAs: 'StudentEditSpiritualController'
      params: {
        student: null
      }
    }

new StudentEditSpiritualConfig();
