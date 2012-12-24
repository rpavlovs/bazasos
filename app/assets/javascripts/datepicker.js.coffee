#= require jquery.ui.datepicker
#= require jquery.ui.datepicker-ru.js

$.datepicker.setDefaults( $.datepicker.regional['ru'] )

$ ->
  $('input.datepicker').each ->
    input = $(@)
    options = {}
    if input.data 'birth-date'
      options.changeMonth = true
      options.changeYear = true
      options.yearRange = '-120:+0'
    input.datepicker options
