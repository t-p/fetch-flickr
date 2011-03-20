$(document).ready(function() {

  /* Apply fancybox to multiple items */
  
  $("a[rel=flickr_pic]").fancybox({
    'transitionIn'  : 'elastic',
    'transitionOut' : 'elastic',
    'speedIn'   : 600, 
    'speedOut'    : 200, 
    'overlayShow' : false
  });
  
});
