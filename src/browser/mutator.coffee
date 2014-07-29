mutate = (instance, klass, args = []) ->
  throw 'Instance must be an object' if typeof instance isnt 'object'
  throw 'Klass must be a class' if typeof klass isnt 'function'

  instance.__proto__ = klass.prototype
  klass.apply(instance, args)
  instance