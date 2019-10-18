class BackupService
  'use strict'
  constructor: () ->
    @service = new Service 'backup', 'backup', 'backupService';

new BackupService()
