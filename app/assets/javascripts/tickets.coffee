# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#
$(document).ready ->
  $('#ticket_ticket_type_short').click ->
    $('#second_player').hide();
  
  $('#ticket_ticket_type_double').click ->
    $('#second_player').slideDown('slow');
  
