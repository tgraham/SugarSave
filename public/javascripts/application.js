$(function() {

  $.each($('.hideable'), function() {
    $(this).append('<a href="#" class="hide-link">[X]</a>');
    $(this).delay(4000).fadeOut('fast');
  });

  $('a.hide-link').click(function() {
    $(this).parent().fadeOut('slow');
    return false
  });
  
  $("#deal_deal_date").datepicker();
  
});