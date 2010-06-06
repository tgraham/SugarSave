$(function() {
  
  $('#get-deals').hover(function() {
  	$(this).attr("src","../images/get-deals-hover.png");
  		}, function() {
  	$(this).attr("src","../images/get-deals.png");
  });
  
  $('#feature-business').hover(function() {
  	$(this).attr("src","../images/feature-business-hover.png");
  		}, function() {
  	$(this).attr("src","../images/feature-business.png");
  });
  
  $('a[rel*=facebox]').facebox();
  
  $.each($('.hideable'), function() {
    $(this).append('<a href="#" class="hide-link">[X]</a>');
    $(this).delay(3000).fadeOut(1000);
  });

  $('a.hide-link').click(function() {
    $(this).parent().fadeOut('slow');
    return false
  });
  
});