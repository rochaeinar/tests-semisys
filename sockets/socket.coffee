class Socket

  io = require 'socket.io'
  socket = null

  constructor: (http) ->
    socket = io.listen http
    console.log 'socket is listening'
    socket.on 'connection', @socketEvents

  socketEvents: (socket) =>
    console.log 'a socket client is connected'
    socket.on 'delete-student', @deleteStudent
    socket.on 'delete-docent', @deleteDocent
    socket.on 'delete-program', @deleteProgram
    socket.on 'delete-subject', @deleteSubject
    socket.on 'delete-church', @deleteChurch
    socket.on 'delete-management', @deleteManagement

  deleteStudent: (id) =>
    socket.emit 'liveDeleteStudent', id

  deleteDocent: (id) =>
    socket.emit 'liveDeleteDocent', id

  deleteProgram: (id) =>
    socket.emit 'liveDeleteProgram', id

  deleteSubject: (id) =>
    socket.emit 'liveDeleteSubject', id

  deleteChurch: (id) =>
    socket.emit 'liveDeleteChurch', id

  deleteManagement: (id) =>
    socket.emit 'liveDeleteManagement', id

module.exports = Socket
