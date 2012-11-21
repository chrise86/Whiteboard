//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
$(document).ready(function()
  {
  get_section_events_pairs();
});

function get_section_events_pairs()
{
$.getJSON("<%= calendar_get_section_events_pairs_path %>", function(data)
  {
  alert(data);
});
}