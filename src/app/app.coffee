define [
  'cs!views/home/home'
  'cs!views/ytdsales/ytdsales'
], ->
  'use strict'

  APP = window.APP || {}

  APP.navigate = (url, transition) ->
    if (APP.instance)
      APP.instance.navigate url, (transition || 'slide:left')

  APP.scrollToTop = (view) ->
    view.scroller.element\
      .find('.km-scroll-container').css '-webkit-transform', ''

  init = ->
    config =
      transition: 'slide'
      skin: 'flat'
      initial: 'appHome'

    APP.instance = new kendo.mobile.Application document.body, config

  return {
    init: init
  }