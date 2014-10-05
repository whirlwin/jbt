#!/usr/bin/env node

var path = require('path');
var fs   = require('fs');

var appPath = path.join(path.dirname(fs.realpathSync(__filename)), '../lib/jbt-app');
require(appPath).start();