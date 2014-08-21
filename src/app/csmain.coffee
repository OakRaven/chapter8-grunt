define [
  'cs!app'
], (app) ->
  'use strict'

  if kendo.mobileOs
    document.addEventListener 'deviceready', ->
      app.init()
      navigator.splashscreen.hide()
    , false
  else
    app.init()