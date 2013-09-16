# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$ ->
  $('.party-select').click ->
    $('.party-select').attr('disabled', 'disabled')

  $('.result-table tr').click (event) ->
    lightboxId = $(event.target).parents('tr').data('lightbox-id')
    $("##{lightboxId}").lightbox()

  $('.lightbox').click (event) ->
    event.stopPropagation()
