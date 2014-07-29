(function() {
  var mutate;

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

}).call(this);
