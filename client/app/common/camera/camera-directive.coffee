class Camera
  'use strict'
  constructor: () ->
    angular
    .module 'common'
    .directive 'camera', [
      @camera
    ]

  onError: (err) =>
    @scope.webcamError = true
    return

  onSuccess: () =>
    @scope._video = @scope.channel.video
    return

  getVideoData: (x, y, w, h) =>
    hiddenCanvas = document.createElement('canvas')
    hiddenCanvas.width = w
    hiddenCanvas.height = h
    ctx = hiddenCanvas.getContext('2d')
    ctx.drawImage @scope._video, 0, 0, w, h
    ctx.getImageData x, y, w, h

  makeSnapshot: () =>
    if @scope._video
      patCanvas = document.querySelector('#snapshot')
      if !patCanvas
        return
      patCanvas.width = @scope._video.height
      patCanvas.height = @scope._video.height
      ctxPat = patCanvas.getContext('2d')
      idata = @getVideoData(0, 0, 240, 240)
      ctxPat.putImageData idata, 0, 0
      @scope.photo = patCanvas.toDataURL()
      patData = idata
    return


  linkFunc: (scope) =>
    @scope = scope
    @scope.webcamError = false
    @scope.channel = {}
    @vm = this
    @scope.onError = @onError
    @scope.onSuccess = @onSuccess
    @scope.makeSnapshot = @makeSnapshot
    @scope.getVideoData = @getVideoData
    return

  camera: ()=>
    directive =
      restrict: 'EA'
      templateUrl: 'app/common/camera/camera-template.html'
      link: @linkFunc
      scope:
        photo: '='

    directive

new Camera()
