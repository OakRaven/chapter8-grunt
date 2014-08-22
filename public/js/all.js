(function() {
  define(['cs!views/home/home', 'cs!views/ytdsales/ytdsales'], function() {
    'use strict';
    var APP, init;
    APP = window.APP || {};
    APP.navigate = function(url, transition) {
      if (APP.instance) {
        return APP.instance.navigate(url, transition || 'slide:left');
      }
    };
    APP.scrollToTop = function(view) {
      return view.scroller.element.find('.km-scroll-container').css('-webkit-transform', '');
    };
    init = function() {
      var config;
      config = {
        transition: 'slide',
        skin: 'flat',
        initial: 'appHome'
      };
      return APP.instance = new kendo.mobile.Application(document.body, config);
    };
    return {
      init: init
    };
  });

}).call(this);

(function() {
  define(['cs!app'], function(app) {
    'use strict';
    if (kendo.mobileOs) {
      return document.addEventListener('deviceready', function() {
        app.init();
        return navigator.splashscreen.hide();
      }, false);
    } else {
      return app.init();
    }
  });

}).call(this);

(function() {
  define([], function() {
    var employees;
    employees = [
      {
        id: 1,
        name: 'Tracy Ouellette',
        sales: [1290, 1120, 1904]
      }, {
        id: 2,
        name: 'Chris Daniels',
        sales: [1290, 1120, 1904]
      }, {
        id: 3,
        name: 'Jason Alexander',
        sales: [1290, 1120, 1904]
      }, {
        id: 4,
        name: 'Jennifer Hannah',
        sales: [1290, 1120, 1904]
      }, {
        id: 5,
        name: 'Maxx Slayd',
        sales: [1290, 1120, 1904]
      }
    ];
    return {
      employees: employees
    };
  });

}).call(this);

(function() {
  define(['cs!views/view', 'text!views/home/home.html', 'cs!data'], function(View, html, data) {
    'use strict';
    var APP, events, model;
    APP = window.APP || {};
    model = kendo.observable({
      employeesDs: new kendo.data.DataSource({
        data: data.employees,
        schema: {
          model: {
            id: 'id'
          }
        },
        sort: {
          field: 'name',
          dir: 'asc'
        }
      }),
      employeeSelected: function(e) {
        var employee, id;
        id = $(e.target).closest('a').data('id');
        employee = model.get('employeesDs').get(id);
        $.publish('/home/employeeSelected', {
          employee: employee
        });
        return APP.navigate('#ytdsales');
      }
    });
    events = {};
    return new View('appHome', html, model, events);
  });

}).call(this);

(function() {
  define([], function() {
    'use strict';
    var APP, View;
    APP = window.APP = window.APP || {};
    View = kendo.Class.extend({
      init: function(name, template, model, events) {
        this.html = $(template).appendTo(document.body);
        return APP[name] = {
          model: model || {},
          events: events || {}
        };
      }
    });
    return View;
  });

}).call(this);

(function() {
  define(['cs!views/view', 'text!views/ytdsales/ytdsales.html', 'cs!data'], function(View, html, data) {
    var events, model;
    model = kendo.observable({
      item: null
    });
    events = {};
    new View('ytdsales', html, model, events);
    return $.subscribe('/home/employeeSelected', function(e, params) {
      return model.set('item', params.employee);
    });
  });

}).call(this);
