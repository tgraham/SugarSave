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
  
  $(".date_picker").datepicker();
  
  $(".wysiwyg").wysiwyg({
      controls: {
        subscript   : { visible : false },
        superscript : { visible : false },
        insertImage : { visible : false }
      }
  });    
});
