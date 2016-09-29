var Item = require('../models/item')
  , Config = require('../config')
  , items = [];

var generateRandomItems = function () {
  var timestamp = new Date().getTime();
  var generatedRandoms = generateUniqueRandoms();
  items = [];
  for (var i = 0; i < generatedRandoms.length; i++) {
    items.push(new Item(generatedRandoms[i], timestamp))
  }
};

var generateItems = function (itemsCount) {
  var timestamp = new Date().getTime();
  for (var i = 0; i < itemsCount; i++) {
    var id = items.length;
    items.push(new Item(id, timestamp));
  }
};
var generate = function (isList) {
  if (Config.random) {
    generateRandomItems()
  }
  else if (items.length == 0) {
    generateItems(Config.itemsCount);
  }
  else if (Config.incrementItems && isList) {
    console.log("incrementItems");
    generateItems(1);
  }
};

var getItems = function (url, timestamp, isList) {
  generate(isList);
  if (Config.sortRandom) {
    items = randomSortItems(items);
  }
  return items
    .map(function (item) {
      // Added current url to icon and url fields
      var newItem = Object.assign({}, item);
      newItem.url = url + newItem.url;
      newItem.icon = url + newItem.icon;
      return newItem;
    })
    .filter(function (element) {
      return element.timestamp >= timestamp;
    })
    .sort(function (objA, objB) {
      if (Config.sortRandom || Config.random) {
        //Don't sort
        return 0;
      }
      else if (objB.timestamp - objA.timestamp == 0) {
        //Sort by id if timestamps are equals
        return objA.id - objB.id;
      }
      //Sort by timestamp
      return objB.timestamp - objA.timestamp;
    });
};

var getItemById = function (url, id) {
  return getItems(url, 0).filter(function (element) {
    return element.id == id;
  })[0];
};

function roll(array) {
  if (array.length < 1)
    return null;
  var num = Math.floor(Math.random() * array.length);
  return array.splice(num, 1)[0];
}

function randomSortItems(items) {
  var tmp = items;
  var sorted = [];
  var arrayLenght = tmp.length;
  for (var i = 0; i < arrayLenght; i++) {
    sorted.push(roll(tmp));
  }
  return sorted;
}
function generateUniqueRandoms() {
  var array = [];
  for (var i = 0; i < Config.itemsCount; i++) {
    array.push(i);
  }
  var random = getRandom();
  var randoms = [];
  for (var i = 0; i < random; i++) {
    randoms.push(roll(array));
  }
  return randoms;
}

function getRandom() {
  return parseInt(Math.random() * Config.itemsCount, 10);
}

module.exports = {
  getItems: getItems,
  getItemById: getItemById
};