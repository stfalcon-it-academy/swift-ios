// server.js

// BASE SETUP
// =============================================================================

// call the packages we need
var express = require('express')
  , debug = require('debug')('api_v1:server')
  , logger = require('morgan')
  , http = require('http')
  , ip = require("ip")
  , Routes = require('./routes/routes')
  , Config = require('./config')
  , app = express();

// Config logger -------------------------------
app.use(logger('dev'));

// Added fullUrl field to req
app.use(function (req, res, next) {
  req.fullUrl = req.protocol + '://' + req.get('host') + req.path;
  next();
});

// REGISTER OUR ROUTES -------------------------------
// all of our routes will be prefixed with /api
app.use(Config.prefix, Routes);

// catch 404 and forward to error handler
app.use(function (req, res, next) {
  var err = new Error('Not Found');
  err.status = 404;
  next(err);
});

// development error handler
// will print stacktrace
if (app.get('env') === 'development') {
  app.use(function (err, req, res, next) {
    res
      .status(err.status || 500)
      .json({
        'error': {
          message: err.message,
          error: err
        }
      });
  });
}

// production error handler
// no stacktraces leaked to user
app.use(function (err, req, res, next) {
  res
    .status(err.status || 500)
    .json({
      'error': {
        message: err.message,
        error: {}
      }
    });
});


// START THE SERVER
// =============================================================================
var port = normalizePort(process.env.PORT || Config.port);
app.set('port', port);

var server = http.createServer(app);
server.listen(port);
server.on('error', onError);
server.on('listening', onListening);

console.log('Server started! At your localhost:\nhttp://localhost:' + Config.port + Config.prefix);
console.log('and probably (if nothing blocked it) at:\nhttp://' + ip.address() + ":" + Config.port + Config.prefix);
console.log('\nYou can change server configuration in config.js file.\n');

// Event listener for HTTP server "error" event.
function onError(error) {
  if (error.syscall !== 'listen') {
    throw error;
  }

  var bind = typeof port === 'string'
    ? 'Pipe ' + port
    : 'Port ' + port;

  // handle specific listen errors with friendly messages
  switch (error.code) {
    case 'EACCES':
      console.error(bind + ' requires elevated privileges');
      process.exit(1);
      break;
    case 'EADDRINUSE':
      console.error(bind + ' is already in use');
      process.exit(1);
      break;
    default:
      throw error;
  }
}

// Event listener for HTTP server "listening" event.
function onListening() {
  var addr = server.address();
  var bind = typeof addr === 'string'
    ? 'pipe ' + addr
    : 'port ' + addr.port;
  debug('Listening on ' + bind);
}

// Normalize a port into a number, string, or false.
function normalizePort(val) {
  var port = parseInt(val, 10);

  if (isNaN(port)) {
    // named pipe
    return val;
  }

  if (port >= 0) {
    // port number
    return port;
  }

  return false;
}


