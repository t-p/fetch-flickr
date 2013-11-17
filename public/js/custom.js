$(document).ready(function() {

  /* Apply fancybox to multiple items */
  $("a[rel=flickr_pic]").fancybox({
    'loop'        : true,
    'openEffect'  : 'elastic',
    'closeEffect' : 'elastic',
    'nextEffect'  : 'elastic',
    'prevEffect'  : 'elastic'
  });
});
