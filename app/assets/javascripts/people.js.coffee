$ ->
  $('table').on 'click', 'tr.person', ->
    window.location = $(@).data 'url'
