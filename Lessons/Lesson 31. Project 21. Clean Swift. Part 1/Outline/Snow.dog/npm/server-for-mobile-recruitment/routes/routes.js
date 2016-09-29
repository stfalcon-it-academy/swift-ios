// ROUTES FOR OUR API
// =============================================================================
var express = require('express')
  , router = express.Router()
  , PNG = require('../helpers/png')
  , Dataset = require('../helpers/dataset');

var API_ENDPOINT = '/'
  , ITEMS_ENDPOINT = '/items'
  , activeEndpoints = [
  API_ENDPOINT,
  ITEMS_ENDPOINT
];

router.get(API_ENDPOINT, function (req, res, next) {
  var activeEndpointsFullUrl = []
    , currentUrl = removePathParamsFromUrl(req.fullUrl);
  for (var i = 0; i < activeEndpoints.length; i++) {
    activeEndpointsFullUrl.push(currentUrl + activeEndpoints[i]);
  }
  res.status(200).json({
    "active_endpoints": activeEndpointsFullUrl
  });
});

router.get(ITEMS_ENDPOINT, function (req, res, next) {
  var timestamp = req.query.timestamp || 0
    , currentUrl = removePathParamsFromUrl(req.fullUrl);
  var items = Dataset.getItems(currentUrl, timestamp, true);
  if (items == null) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
    return;
  }
  res.status(200).json(items);
});

router.get(ITEMS_ENDPOINT + '/:id', function (req, res, next) {
  var currentUrl = removePathParamsFromUrl(req.fullUrl)
    , id = req.params.id;
  var item = Dataset.getItemById(currentUrl, id);
  if (item == null) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
    return;
  }
  res.status(200).json(item);
});

router.get(ITEMS_ENDPOINT + '/:id/icon.png', function (req, res, next) {
  var currentUrl = removePathParamsFromUrl(req.fullUrl)
    , id = req.params.id;
  var item = Dataset.getItemById(currentUrl, id);
  if (item == null) {
    var err = new Error('Not Found');
    err.status = 404;
    next(err);
    return;
  }
  res.setHeader('Content-Type', 'image/png');
  PNG(id, res);
});


function removePathParamsFromUrl(fullUrl) {
  if (fullUrl.lastIndexOf("/") == fullUrl.length - 1) {
    fullUrl = fullUrl.slice(0, fullUrl.lastIndexOf("/"));
  }
  if (fullUrl.indexOf(ITEMS_ENDPOINT) > -1) {
    return fullUrl.slice(0, fullUrl.indexOf(ITEMS_ENDPOINT) + ITEMS_ENDPOINT.length);
  }
  return fullUrl;
}
module.exports = router;