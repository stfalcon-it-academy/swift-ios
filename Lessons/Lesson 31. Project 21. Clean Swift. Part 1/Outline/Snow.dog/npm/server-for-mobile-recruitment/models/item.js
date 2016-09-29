var item = function (i, timestamp) {
  this.id = i;
  this.name = "Item (x)".replace(/x/g, i);
  this.description = "Description of item (x)".replace(/x/g, i);
  this.icon = "/x/icon.png".replace(/x/g, i);
  this.timestamp = timestamp;
  this.url = "/x".replace(/x/g, i);
};

module.exports = item;
