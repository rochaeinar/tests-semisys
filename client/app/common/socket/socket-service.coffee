class SocketService
  'use strict'
  constructor: () ->
    angular
    .module 'common'
    .service 'socketService', [
      '$rootScope'
      'SOCKET_PATH'
      @socketService
    ]

  deleteStudent: (id) =>
    @socket.emit 'delete-student', id

  deleteDocent: (id) =>
    @socket.emit 'delete-docent', id

  deleteProgram: (id) =>
    @socket.emit 'delete-program', id

  deleteSubject: (id) =>
    @socket.emit 'delete-subject', id

  deleteChurch: (id) =>
    @socket.emit 'delete-church', id

  deleteRol: (id) =>
    @socket.emit 'delete-rol', id

  deleteBackup: (id) =>
    @socket.emit 'delete-backup', id

  deleteManagement: (id) =>
    @socket.emit 'delete-management', id

  liveDeleteStudent: (id) =>
    @$rootScope.$broadcast 'liveDeleteStudent', id

  liveDeleteDocent: (id) =>
    @$rootScope.$broadcast 'liveDeleteDocent', id

  liveDeleteProgram: (id) =>
    @$rootScope.$broadcast 'liveDeleteProgram', id

  liveDeleteSubject: (id) =>
    @$rootScope.$broadcast 'liveDeleteSubject', id

  liveDeleteChurch: (id) =>
    @$rootScope.$broadcast 'liveDeleteChurch', id

  liveDeleteRol: (id) =>
    @$rootScope.$broadcast 'rol.delete', id

  liveDeleteBackup: (id) =>
    @$rootScope.$broadcast 'backup.delete', id

  liveDeleteManagement: (id) =>
    @$rootScope.$broadcast 'liveDeleteManagement', id

  socketService: ($rootScope, SOCKET_PATH) =>
    @$rootScope = $rootScope
    @socket = io.connect SOCKET_PATH

    @socket.on 'liveDeleteStudent', @liveDeleteStudent
    @socket.on 'liveDeleteDocent', @liveDeleteDocent
    @socket.on 'liveDeleteProgram', @liveDeleteProgram
    @socket.on 'liveDeleteSubject', @liveDeleteSubject
    @socket.on 'liveDeleteChurch', @liveDeleteChurch
    @socket.on 'liveDeleteRol', @liveDeleteRol
    @socket.on 'liveDeleteBackup', @liveDeleteBackup
    @socket.on 'liveDeleteManagement', @liveDeleteManagement

    appServices = {}
    appServices.deleteStudent = @deleteStudent
    appServices.deleteDocent = @deleteDocent
    appServices.deleteProgram = @deleteProgram
    appServices.deleteSubject = @deleteSubject
    appServices.deleteChurch = @deleteChurch
    appServices.deleteRol = @deleteRol
    appServices.deleteBackup = @deleteBackup
    appServices.deleteManagement = @deleteManagement
    appServices

new SocketService();
