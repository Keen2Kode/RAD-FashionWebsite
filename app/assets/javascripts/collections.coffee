# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load',  ->
    $('#all').change ->
        allChecked = $(this).is(":checked")
        $('input[name="tags[]"]').prop('checked', allChecked)