class TimetableController
  'use strict'
  constructor: () ->
    angular
    .module 'timetable'
    .controller 'timetableController', [
      '$state'
      '$scope'
      '$mdDialog'
      @timetableController
    ]

  timetableController: ($state, $scope, $mdDialog) =>
    @$state = $state
    @$scope = $scope
    @$mdDialog = $mdDialog
    @vm = this
    @vm

new TimetableController();
