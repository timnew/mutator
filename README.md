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
mutate = require('mutate')

mutate(instance, klass)
```

In Browser:

```javascript
mutate(instance, klass)
```

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

mutate = require('mutate')

rectCopy = JSON.parse(rectJSON)

console.log rectCopy.area() # Got error: undefined isn't a function!

rectClone = muate(rectCopy, Rect)

console.log rectClone.area() # got 10000

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
