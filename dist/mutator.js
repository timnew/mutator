(function() {
  var fixForIE, mutate;

  mutate = function(instance, klass, args) {
    if (args == null) {
      args = [];
    }
    if (typeof instance !== 'object') {
      throw 'Instance must be an object';
    }
    if (typeof klass !== 'function') {
      throw 'Klass must be a class';
    }
    instance.__proto__ = klass.prototype;
    klass.apply(instance, args);
    return instance;
  };

  fixForIE = function(instance, klass, args) {
    var k, v;
    if (args == null) {
      args = [];
    }
    if (typeof instance !== 'object') {
      throw 'Instance must be an object';
    }
    if (typeof klass !== 'function') {
      throw 'Klass must be a class';
    }
    for (k in klass) {
      v = klass[k];
      if (instance[k] === void 0) {
        instance[k] = v;
      }
    }
    klass.apply(instance, args);
    return instance;
  };

  this.mutate = {}.__proto__ === void 0 ? (console.warn('__proto__ is not supported by current browser, fallback to hard-copy approach'), fixForIE) : mutate;

}).call(this);
