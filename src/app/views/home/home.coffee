define [
  'cs!views/view',
  'text!views/home/home.html'
  'cs!data'
], (View, html, data) ->
  'use strict'

  APP = window.APP || {}

  model = kendo.observable
    employeesDs: new kendo.data.DataSource
      data: data.employees
      schema:
        model:
          id: 'id'
      sort:
        field: 'name'
        dir: 'asc'

    employeeSelected: (e) ->
      id = $(e.target).closest('a').data 'id'
      employee = model.get('employeesDs').get id
      $.publish '/home/employeeSelected', { employee: employee }
      APP.navigate '#ytdsales'

  events = {}

  new View 'appHome', html, model, events