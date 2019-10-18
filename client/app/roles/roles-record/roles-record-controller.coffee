class RolesRecordController
  'use strict'
  constructor: () ->
    angular
    .module 'roles'
    .controller 'RolesRecordController', [
      'rolesService'
      'rolTemplateService'
      '$state'
      @Controller
    ]

  onCheckboxClick: (item, column) =>
    if item[column] != undefined
      item[column] = !item[column]

      if column == 'view' && !item[column]
        item.edit = false
        item.delete = false

      if (column == 'edit' || column == 'delete') && item[column]
        item.view = true

    else
      if @isIndeterminate(item) || !@isAllSelected(item)
        @setValues(item, true)
      else
        if @isAllSelected(item)
          @setValues(item, false)

  setValues: (item, value) =>
    item.view = value
    item.add = value
    item.edit = value
    item.delete = value

  isIndeterminate: (item) =>
    !@isAllSelected(item) && (item.view || item.add || item.edit || item.delete)

  isAllSelected: (item) =>
    item.view && item.add && item.edit && item.delete

  onUpdate: (item) =>
    @rolesService.setAddingRol false
    @rolesService.setCurrent undefined
    @$state.go 'semisysapp.roles'

  onGetTemplate: (response) =>
    @rol = response.data

  save: () =>
    if @rolesService.isAdding()
      @rolesService.add(@rol)
      .then @onUpdate
    else
      @rolesService.update(@rol)
      .then @onUpdate

  Controller: (rolesService, rolTemplateService, $state) =>
    vm = this
    @vm = vm
    @rolesService = rolesService
    @$state = $state

    @rol = rolesService.getCurrent()

    if rolesService.isAdding()
      rolTemplateService.getTemplate()
      .then @onGetTemplate
    else if @rol == undefined
      @$state.go 'semisysapp.roles'

    @vm.isIndeterminate = @isIndeterminate
    @vm.onCheckboxClick = @onCheckboxClick
    @vm.save = @save

    @vm

new RolesRecordController()
