class App

  constructor: () ->
    @loadApp()

  requestServerHttp: (request, response) =>
    response.sendfile "./client/index.html"

  httpServer: ()=>
    host = @serverHttp.address().address
    port = @serverHttp.address().port
    console.log 'listening at http://%s:%s', host, port

  configure: (http, client) =>
    http.use @express.static __dirname + client
    http.use @express.Router()
    #http.use @bodyParser.urlencoded extended: false
    #http.use @bodyParser.json()
    http.use @bodyParser.json limit: '50mb'
    http.use @bodyParser.urlencoded limit: '50mb', extended: true
    http.use @logger 'dev'
    http.get '/', @requestServerHttp

  httpServer: =>
    console.log "server is running in the port: #{@config.server.port}"

  functionInterceptor: (req, res, next) =>
    next()

  responseDB: (error, response) =>
    if error
      console.log 'ERROR: connecting to DataBase, ' + error
    else
      console.log 'Connected to DataBase.'
      @initializeDefaultUser()


  httpConfigure: =>
    @appHttp.use @express.Router()
    @appHttp.use @bodyParser.json limit: '50mb'
    @appHttp.use @bodyParser.urlencoded limit: '50mb', extended: true
    @appHttp.use @logger 'dev'
    @appHttp.use @functionInterceptor

  initializeDefaultUser: =>
    users = require './entities/users'
    onGetResult = (error, items) =>
      if error
        console.log error
      else
        if items.length == 0
          defaultUser = {
            "name": 'Admin',
            "userName": 'admin',
            "password": '5a38afb1a18d408e6cd367f9db91e2ab9bce834cdad3da24183cc174956c20ce35dd39c2bd36aae907111ae3d6ada353f7697a5f1a8fc567aae9e4ca41a9d19d',
            "rol": 'Administrador',
            "email": 'admin@admin.com'
          }
          onUserCreated = (error, items) =>
          if error
            console.log error
          else
            roles = require './entities/rol'
            defaultAdminRol = {
              "name": "Administrador",
              "permissions": [{
                "key": "STUDENTS",
                "name": "Estudiantes",
                "view": true,
                "add": true,
                "edit": true,
                "delete": true
              },
                {
                  "key": "TEACHER",
                  "name": "Docentes",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "AUTHORITIES",
                  "name": "Autoridades",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "SCHEDULES",
                  "name": "Horarios",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "KARDEX",
                  "name": "Kardex",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "INSCRIPTIONS",
                  "name": "Inscripciones",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "CREDITS",
                  "name": "Creditos",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "SUBJECT_ASSIGNMENT",
                  "name": "Signacion de Materias",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "NOTE_RECORDS",
                  "name": "Registro de Notas",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "SUBJECTS",
                  "name": "Materias",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "PENSUMS",
                  "name": "Pensums",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "CHURCHES",
                  "name": "Iglesias",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "GESTIONS",
                  "name": "Gestiones",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "ROLES",
                  "name": "Roles",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "CREDITS_REPORT",
                  "name": "Reportes de Creditos",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "STUDENTS_REPORT",
                  "name": "Reportes de Estudiantes",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "TEACHERS_MISSING_GRADES",
                  "name": "Docentes Sin Notas",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "DEBTORS",
                  "name": "Deudores",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "LOGS",
                  "name": "Logs",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "BACKUP",
                  "name": "Copias de Seguridad",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "NOTIFICATIONS",
                  "name": "Notificaciones",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                },
                {
                  "key": "BACKUPS_SETTINGS",
                  "name": "Configuracion de Copias seguridad",
                  "view": true,
                  "add": true,
                  "edit": true,
                  "delete": true
                }]
            }
            roles.create defaultAdminRol, onUserCreated

        users.create defaultUser, onUserCreated

    users.find {}, onGetResult

  loadApp: () ->
    @config = require './config.json'
    @helmet = require 'helmet'
    @express = require "express"
    @bodyParser = require 'body-parser'
    @logger = require 'morgan'
    @socket = require './sockets/socket'
    @LoginRoute = require './routes/login-router'
    @UserRoute = require './routes/user-route'
    @ChurchRoute = require './routes/church-route'
    @StudentRoute = require './routes/student-route'
    @DocentRoute = require './routes/docent-route'
    @ProgramRoute = require './routes/program-route'
    @SubjectRoute = require './routes/subject-route'
    @RolRoute = require './routes/rol-route'
    @RolTemplateRoute = require './routes/roltemplate-route'
    @BackupRoute = require './routes/backup-route'
    @GestionRoute = require './routes/gestion-route'
    @AuthoritieRoute = require './routes/authoritie-route'
    @fs = require 'fs'
    @appHttp = @express()

    @http = require "http"
    @configure @appHttp, "/client"

    @ONE_YEAR = 31536000000
    @appHttp.use @helmet.hsts
      maxAge: @ONE_YEAR
      includeSubdomains: true
      force: true

    @httpConfigure()
    @serverHttp = @http.createServer @appHttp
    @serverHttp._maxListeners = Infinity

    new @LoginRoute @appHttp
    new @UserRoute @appHttp
    new @StudentRoute @appHttp
    new @ChurchRoute @appHttp
    new @DocentRoute @appHttp
    new @ProgramRoute @appHttp
    new @SubjectRoute @appHttp
    new @RolRoute @appHttp
    new @RolTemplateRoute @appHttp
    new @BackupRoute @appHttp
    new @GestionRoute @appHttp
    new @AuthoritieRoute @appHttp
    @serverHttp.listen @config.server.portSSL, @config.server.ip, @httpServer

    #database
    @mongoClient = require 'mongodb'
    @mongoose = require 'mongoose'
    @dbConf = @config.mongodb
    @mongoose.connect "mongodb://#{@dbConf.host}/#{@dbConf.database}", @responseDB

    @serverHttp = @http.createServer @appHttp
    @serverHttp._maxListeners = Infinity


    #socket
    new @socket @serverHttp

new App()
