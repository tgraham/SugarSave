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
  
  function set_deal_inputs() {
    var deal_type = $("#deal_deal_type").val();
    
    if (deal_type == 'Flat') {
      $("#deal_max_discount_input").css('display', 'none');
      $("#deal_max_threshold_input").css('display', 'none');
      $("#deal_tipping_point_input").css('display', 'none');
      
      $("#deal_max_discount").val('');
      $("#deal_max_threshold").val('');
      $("#deal_tipping_point").val('');
    };
    
    if (deal_type == 'Slider') {
      $("#deal_max_discount_input").css('display', 'block');
      $("#deal_max_threshold_input").css('display', 'block');
      $("#deal_tipping_point_input").css('display', 'none');
      
      $("#deal_tipping_point").val('');
    };
    
    if (deal_type == 'Tipping') {
      $("#deal_max_discount_input").css('display', 'none');
      $("#deal_max_threshold_input").css('display', 'none');
      $("#deal_tipping_point_input").css('display', 'block');
      
      $("#deal_max_discount").val('');
      $("#deal_max_threshold").val('');
    };
  };
  
  if ( $('#deal_deal_type').length ) {
    set_deal_inputs();
  };
  
  $("#deal_deal_type").change(set_deal_inputs);
  
  if ( $('#ordered_percent').length ) {
    var ordered_percent = $('#ordered_percent').html();
    ordered_percent = ordered_percent*1;
  
    $("#progressbar").progressbar({ value: ordered_percent });
  };
});
