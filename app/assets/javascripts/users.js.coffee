$ ->
  $('#users').on 'click', 'tr', ->
    window.location = $(@).data 'url'
