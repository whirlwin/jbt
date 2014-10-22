async   = require 'async'
fs      = require 'fs'
q       = require 'q'
request = require 'request'

class DependencyRetriever

  DEFAULT_MVN_REPOSITORY  = 'http://central.maven.org/maven2'
  DEFAULT_GROUP_ID_PARENT = 'org'
  DEFAULT_PACKAGING       = 'jar'

  retrieveDependencies: ->
    if packageFile.dependencies
      downloadDependencies packageFile.dependencies
    else
      abort 'No field "dependencies" specified'

  downloadDependencies = (dependencies) ->
    dependenciesArray = (id: k, version: v for k, v of dependencies)
    async.forEach dependenciesArray, downloadDependency, (err) ->
      abort err if err
      logger.info 'fin'

  downloadDependency = (dependency, cb) ->
    dependencyUrl = getDependencyUrl dependency
    logger.info 'Downloading: ' + dependencyUrl
    downloadStream = request dependencyUrl
    saveDependency downloadStream, dependency
    downloadStream.on 'end', -> cb()

  getDependencyUrl = (dependency) ->
    [groupId, artifactId, packaging] = dependency.id.split ':'
    groupIdPath = getGroupIdPath(groupId)
    packaging ||= DEFAULT_PACKAGING
    version = dependency.version
    artifactIdAndVersion = [artifactId, version].join '-'
    dependencyPath = [groupIdPath, artifactId, version, artifactIdAndVersion].join('/') + ".#{packaging}"
    [DEFAULT_MVN_REPOSITORY, dependencyPath].join '/'

  getGroupIdPath = (groupId) ->
    groupIdPath = groupId.replace '.', '/'
    missingGroupIdParent = groupId.indexOf('.') == -1
    if missingGroupIdParent
      groupIdPath = [DEFAULT_GROUP_ID_PARENT, groupIdPath].join('/') if missingGroupIdParent
    groupIdPath

  saveDependency = (downloadStream, dependency) ->
    localDependencyFileStream = fs.createWriteStream(dependency.id)
    cacheDependencyFileStream = fs.createWriteStream("/home/whirlwin/.jbt/#{dependency.id}")
    downloadStream.on 'data', (chunk) ->
      localDependencyFileStream.write chunk
      cacheDependencyFileStream.write chunk

module.exports = new DependencyRetriever()