(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  window.app = {};

  app.controllers = {};

  app.models = {};

  app.views = {};

  window.MainController = (function(_super) {

    __extends(MainController, _super);

    function MainController() {
      MainController.__super__.constructor.apply(this, arguments);
    }

    MainController.prototype.routes = {
      "": "home",
      "home": "home"
    };

    MainController.prototype.home = function() {
      return app.views.counter.render();
    };

    return MainController;

  })(Backbone.Controller);

  window.Counter = (function(_super) {

    __extends(Counter, _super);

    function Counter() {
      Counter.__super__.constructor.apply(this, arguments);
    }

    Counter.prototype.defaults = {
      count: 0
    };

    return Counter;

  })(Backbone.Model);

  window.CounterView = (function(_super) {

    __extends(CounterView, _super);

    function CounterView() {
      CounterView.__super__.constructor.apply(this, arguments);
    }

    CounterView.prototype.initialize = function() {
      this.counter = new Counter();
      return this.render();
    };

    CounterView.prototype.el = $('#counter');

    CounterView.prototype.events = {
      'click button#inc-count': 'inc',
      'click button#dec-count': 'dec'
    };

    CounterView.prototype.render = function() {
      $(this.el).find("#count").html("The count is " + this.counter.get("count"));
      return this;
    };

    CounterView.prototype.inc = function() {
      var ct;
      ct = this.counter.get("count");
      this.counter.set({
        count: ct + 1
      });
      return this.render();
    };

    CounterView.prototype.dec = function() {
      var ct;
      ct = this.counter.get("count");
      this.counter.set({
        count: ct - 1
      });
      return this.render();
    };

    return CounterView;

  })(Backbone.View);

  head.ready(function() {
    app.controllers.main = new MainController();
    app.views.counter = new CounterView();
    app.models.counter = new Counter();
    return Backbone.history.start();
  });

}).call(this);
