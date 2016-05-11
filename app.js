// wrapper for coffee-script file

require('coffee-script/register');

module.exports = hashhole = require('./main');

var runningAsScript = (require.main == module);
if (runningAsScript) {
  var data = process.argv.slice(2); // first 2 command line args are [node, app.js]
  console.log(hashhole(data));
}
