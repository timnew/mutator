mutator [![Bower version][bower-image]][homepage] [![NPM version][npm-image]][npm-url]
=======

> A function to convert plain javascript object(usually deserialized from JSON) into some class instance

Install
-------

Install using [bower][bower-url]:

    $ bower install mutator --save


Install using [npm][npm-homepage]:

    $ npm install mutator --save


Quick Start
------------

Signature:

```
function mutate(instance, class, [argument passed to constructor])
```

In Node.js:

```javascript
const mutate = require('mutator');

mutate(instance, klass);
```

In Browser:

```javascript
mutate(instance, klass);
```

Environment Support
---------------
`Mutator` works fine in most browsers and `Node.js`.

For `Internet Explorer`, prior than `IE 11`, because of lack of `object.__proto__`, a hard-copy work around is applied.

Quick Sample
------------

A simple `Rect` class definition

```coffeescript
class Rect
  constructor: (width, height) ->
  	@width = width if width?
  	@height = height if height?
  	
  area: ->
  	@width * @height

rect = new Rect(100, 100) # A rect instance

console.log rect.area() # should print 10000

rectJSON = JSON.stringify(rect) # Serialize the object into JSON

###
{
  "width": 100,
  "height": 100
}
###
```

`rectJSON` is usually stored into file or transmitted via ajax call.

When consuming the JSON

```coffeescript

mutate = require('mutator')

rectCopy = JSON.parse(rectJSON)

console.log rectCopy.area() # Got error: undefined isn't a function!

rectClone = mutate(rectCopy, Rect)

console.log rectClone == rectCopy # true, they are the same instance
console.log rectCopy.area() # got 10000

```

## License
MIT

[![NPM download][npm-download]][npm-url]

[homepage]: https://github.com/timnew/mutator
[bower-image]: https://badge.fury.io/bo/widget.coffee.svg
[bower-url]: http://bower.io/
[npm-image]: http://img.shields.io/npm/v/mutator.svg
[npm-download]: http://img.shields.io/npm/dm/mutator.svg?style=flat
[npm-url]: https://www.npmjs.org/package/mutator
[npm-homepage]: https://www.npmjs.org/
