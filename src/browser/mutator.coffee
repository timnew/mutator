mutate = (instance, klass, args = []) ->
  throw 'Instance must be an object' if typeof instance isnt 'object'
  throw 'Klass must be a class' if typeof klass isnt 'function'

  instance.__proto__ = klass.prototype
  klass.apply(instance, args)
  instance

fixForIE = (instance, klass, args = []) ->
  throw 'Instance must be an object' if typeof instance isnt 'object'
  throw 'Klass must be a class' if typeof klass isnt 'function'
  
  for k,v of klass when instance[k] is undefined
    instance[k] = v 

  klass.apply(instance, args)
  instance  

@mutate = if ({}).__proto__ is undefined
            console.warn '__proto__ is not supported by current browser, fallback to hard-copy approach'
            fixForIE
          else
            mutate