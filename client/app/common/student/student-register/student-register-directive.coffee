class StudentRegister
  'use strict'
  constructor: () ->
    angular
    .module 'student'
    .directive 'studentRegister', [
      'studentService'
      '$state'
      '$mdStepper'
      @studentRegister
    ]

  onSuccessAdding: (response) =>
    @$state.go 'semisysapp.student'
    return

  add: () =>
    @scope.student.password = sha3_512 @scope.student.ci
    @studentService.add @scope.student
    .then @onSuccessAdding
    return

  addNameToList: () =>
    @scope.student.sons.push @scope.nameTemp
    @scope.nameTemp=
      firstName: '',
      lastName: ''
    return

  deleteNameFromList: (index) =>
    @scope.student.sons.splice index, 1
    return

  next: () =>
    @$mdStepper('stepper-register').next()
    return

  cancel: () =>
    @$state.go 'semisysapp.student'
    return

  linkFunc: (scope) =>
    @scope = scope

    @vm = this

    @scope.nameTemp=
      firstNameSon: '',
      secondNameSon: ''

    @scope.student =
      photo: '',
      firstName: '',
      lastName: '',
      mail: '',
      phone: null,
      movile: null,
      ci: '',
      civilState: false,
      parnert:
        firstNameParnert:'',
        secondNameParnert: ''
      birthDate: null,
      birtCity: '',
      church:
        churchId: ''
        minister: ''
        city: ''
        date: ''
        charges: []
      academicGrade: '',
      sons: [],
      password: ''

    @scope.add = @add
    @scope.next = @next
    @scope.cancel = @cancel

    return

  studentRegister: (studentService, $state, $mdStepper)=>
    @studentService = studentService
    @$state = $state
    @$mdStepper = $mdStepper

    directive =
      restrict: 'EA'
      templateUrl: 'app/common/student/student-register/student-register-template.html'
      link: @linkFunc

    directive

new StudentRegister()
