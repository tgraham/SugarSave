$(function() {

  $.each($('.hideable'), function() {
    $(this).append('<a href="#" class="hide-link">[X]</a>');
  });

  $('a.hide-link').click(function() {
    $(this).parent().fadeOut('slow');
    return false
  });
  
  $("#deal_deal_date").datepicker();
  
});