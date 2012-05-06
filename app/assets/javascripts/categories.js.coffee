# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#category_label_ids').chosen()

  handle_resort = (event, ui) ->
    i = 0;
    cats = []
    $('#categories tr').each ->
      row = $(this).get()[0]
      cats.push "" + row.id
    $.post($('#categories').data('update-url'), {"category" : cats})

  $('#categories').disableSelection
  $('#categories').sortable
    axis: 'y'
    cursor: 'move'
    handle: '.handle'
    update: handle_resort

