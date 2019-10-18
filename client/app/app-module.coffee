class AppModule
  'use strict'
  constructor: () ->
    angular.module 'common', []
    angular.module 'church', []
    angular.module 'docent', []
    angular.module 'timetable', []
    angular.module 'subject', []
    angular.module 'program', []
    angular.module 'student', []
    angular.module 'mainNavigation', []
    angular.module 'login', []
    angular.module 'roles', []
    angular.module 'gestion', []
    angular.module 'backup', []
    angular.module 'authoritie', []

    angular.module 'semi', [
      'ui.router'
      'webcam'
      'restangular'
      'ngCookies'
      'common'
      'church'
      'student'
      'docent'
      'timetable'
      'subject'
      'program'
      'login'
      'ngMask'
      'toaster'
      'ngMaterial'
      'ngMessages'
      'mdSteppers'
      'mainNavigation'
      'roles'
      'gestion'
      'backup'
      'authoritie'
    ]

new AppModule()
