$(function() {
  $("input:visible:enabled:first").focus();
  
  $.each($('.hideable'), function() {
    $(this).append('<a href="#" class="hide-link">[X]</a>');
    $(this).delay(4000).fadeOut('fast');
  });

  $('a.hide-link').click(function() {
    $(this).parent().fadeOut('slow');
    return false
  });
  
  $("#deal_deal_date").datepicker();
  $("#charity_start_date").datepicker();
  $("#charity_end_date").datepicker();
  
  $("#deal_blurb").wysiwyg({
      controls: {
        subscript   : { visible : false },
        superscript : { visible : false },
        insertImage : { visible : false }
      }
        });
    
});
