class Constants
  constructor: () ->
    angular
    .module 'semi'
    .constant('SOCKET_PATH', 'https://127.0.0.1:4000')


new Constants()
