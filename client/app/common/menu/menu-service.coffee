class MenuService
  'use strict'
  constructor: () ->
    angular
    .module 'common'
    .service 'menuService', [
      'rolesHelperService'
      'ROLES'
      @menuService
    ]

  mainMenu: () =>

    menu = []
    acctions = []

    if @rolesHelperService.hasAnyPermission(@ROLES.STUDENTS)
      acctions.push
        link: 'semisysapp.student'
        title: 'Estudiantes'
        icon: '../../assets/img/ic_group_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.TEACHER)
      acctions.push
        link: 'semisysapp.docent'
        title: 'Docentes'
        icon: '../../assets/img/ic_group_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.AUTHORITIES)
      acctions.push
        link: 'semisysapp.authoritie'
        title: 'Autoridades'
        icon: '../../assets/img/ic_group_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.PENSUMS)
      acctions.push
        link: 'semisysapp.program'
        title: 'Programas'
        icon: '../../assets/img/ic_school_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.SUBJECTS)
      acctions.push
        link: 'semisysapp.subject'
        title: 'Materias'
        icon: '../../assets/img/ic_book_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.CHURCHES)
      acctions.push
        link: 'semisysapp.church'
        title: 'Iglesias'
        icon: '../../assets/img/ic_location_city_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.ROLES)
      acctions.push
        link: 'semisysapp.roles'
        title: 'Roles'
        icon: '../../assets/img/ic_supervisor_account_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.GESTIONS)
      acctions.push
        link: 'semisysapp.gestion-init'
        title: 'Gestion'
        icon: '../../assets/img/ic_dashboard_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.BACKUP)
      acctions.push
        link: 'semisysapp.backup'
        title: 'Copias de seguridad'
        icon: '../../assets/img/ic_restore_black_24px.svg'

    list =
      title: 'Gestion'
      acctions: acctions

    menu.push list

    acctions = []

    if @rolesHelperService.hasAnyPermission(@ROLES.LOGS)
      acctions.push
        link: 'semisysapp.logs'
        title: 'Historial'
        icon: '../../assets/img/ic_description_black_24px.svg'

    if @rolesHelperService.hasAnyPermission(@ROLES.KARDEX)
      acctions.push
        link: ''
        title: 'Notas'

    list =
      title: 'Reportes'
      acctions: acctions

    menu.push list

    menu

  menuService: (rolesHelperService, ROLES) =>
    @rolesHelperService = rolesHelperService
    @ROLES = ROLES
    menuServices = {}
    menuServices.mainMenu = @mainMenu
    menuServices.reportMenu = @reportMenu
    menuServices

new MenuService
