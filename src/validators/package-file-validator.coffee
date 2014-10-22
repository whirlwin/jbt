class PackageFileValidator

  PACKAGE_FILE_NAME = 'jbt.json'

  ERROR_MESSAGES =
    MODULE_NOT_FOUND: 'Could not find ' + PACKAGE_FILE_NAME

  validatePackageFile: ->
    try
      GLOBAL.packageFile = require "#{process.cwd()}/#{PACKAGE_FILE_NAME}"
    catch e
      abort ERROR_MESSAGES[e.code] || e.toString()

module.exports = new PackageFileValidator()