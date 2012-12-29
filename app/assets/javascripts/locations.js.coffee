$ ->
  $('#locations').on 'click', 'tr', ->
    $modal = $('#modal')
    $.ajax
      url: $(@).data 'url'
    .done (data) ->
      $modal.html data
      $modal.modal()

