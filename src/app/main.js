require({
  paths: {
    'cs': '../js/cs',
    'coffee-script': '../js/coffee-script',
    'text': '../js/text',
    'underscore': '../js/underscore'
  },
  shim: {
    'underscore': {
      exports: '_'
    }
  }
}, ['cs!csmain']);