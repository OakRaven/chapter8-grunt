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
