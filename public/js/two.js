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
