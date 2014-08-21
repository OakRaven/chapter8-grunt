define [], ->
  'use strict'

  APP = window.APP = window.APP || {}

  View = kendo.Class.extend
    init: (name, template, model, events) ->
      @.html = $(template).appendTo document.body
      APP[name] = { model: model || {}, events: events || {} }

  return View