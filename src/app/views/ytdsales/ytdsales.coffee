define [
  'cs!views/view'
  'text!views/ytdsales/ytdsales.html'
  'cs!data'
], (View, html, data) ->

  model = kendo.observable
    item: null

  events = {}

  new View 'ytdsales', html, model, events

  $.subscribe '/home/employeeSelected', (e, params) ->
    model.set 'item', params.employee