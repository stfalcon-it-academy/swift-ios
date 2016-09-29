var PNG = require('pngjs').PNG
  , drawing = require('pngjs-draw')
  , font = require('../helpers/roboto');


var createPNG = function (id, res) {

  var png = new PNG({
    width: 400,
    height: 400,
    filterType: -1
  })
    , RGBA = [Math.floor((Math.random() * 256)), Math.floor((Math.random() * 256)), Math.floor((Math.random() * 256)), 255]
    , LIGHT_COLOUR = [255, 255, 255, 255]
    , DARK_COLOUR = [0, 0, 0, 255];

  for (var y = 0; y < png.height; y++) {
    for (var x = 0; x < png.width; x++) {
      var idx = (png.width * y + x) << 2;
      png.data[idx] = RGBA[0];
      png.data[idx + 1] = RGBA[1];
      png.data[idx + 2] = RGBA[2];
      png.data[idx + 3] = RGBA[3];
    }
  }

  drawing(PNG);

  var textWidth = png.measureText(id, font)
    , textHeight = font.height
    , centerX = Math.floor((png.width - textWidth) / 2)
    , centerY = Math.floor((png.height - textHeight) / 2);

  png.drawText(centerX, centerY, id, contrastingColor(RGBA), font);

  png.pack().pipe(res);

  function contrastingColor(rgb) {
    return (luma(rgb) >= 165) ? DARK_COLOUR : LIGHT_COLOUR;
  }

  function luma(rgb) {
    return (0.2126 * rgb[0]) + (0.7152 * rgb[1]) + (0.0722 * rgb[2]);
  }
};

module.exports = createPNG;