#Libnoise

This is a haxe port of [libnoise](http://libnoise.sourceforge.net/), the coherent noise library.
The port is almost complete, only the gradient and noise2D utilities are missing.

Examples usages in the test folder, require the [format library](http://lib.haxe.org/p/format) to generate images.

#JS Example

```js
var ctx = document
    .querySelector('#c')
    .getContext('2d');

//enums are a bit weird in js, so you have to use the actual reference, instead of an int.
var quality = libnoise.QualityMode.MEDIUM;
var noise = new libnoise.generator.Perlin(.01, 2.0, 0.5, 8, 42, quality);

var size = 512;
var img = ctx.createImageData(size, size);

function getColor(val) {
    var color = (128 * ((val + 1)));
    return color > 255 ? 255 : color < 0 ? 0 : color;
}

var z = 0;

for (var i = 0; i < size * size * 4; i += 4) {

    var x = (i / 4) % size; //Math.floor(i / width);
    var y = Math.floor((i / 4) / size); //i % height;:w

    var val = noise.getValue(x, y, z);

    var color = getColor(val);

    //console.log('pixel at: ', x ,y, val, color);
    //r
    img.data[i] = color;
    //g
    img.data[i + 1] = color;
    //b
    img.data[i + 2] = color;
    //a
    img.data[i + 3] = 255;
}
```

ctx.putImageData(img, 0, 0);

#License
This port is released under the [LGPL licence](https://www.gnu.org/licenses/lgpl.html), see LICENSE and LICENSE.lesser for details.
#About
[Libnoise](http://libnoise.sourceforge.net/) was originaly created by Jason Bevins. The library was later ported to
Xna by [Marc André Ueberall](http://www.big-black-block.com/#home), and moved to Unity by Tim Speltz. This haxe
version was mainly ported with [Libnoise.unity](https://github.com/ricardojmendez/LibNoise.Unity) as reference.
