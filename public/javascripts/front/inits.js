function carousel_initCallback(carousel) {
  big_container = carousel.container.parent().parent()

  jQuery('.jcarousel-control a').bind('click', function() {
    carousel.scroll(jQuery.jcarousel.intval(jQuery(this).text()));
    return false;
  });

  big_container.find('.carousel-next').bind('click', function() {
    carousel.next();
    return false;
  });

  big_container.find('.carousel-prev').bind('click', function() {
    carousel.prev();
    return false;
  });
};

function mycarousel_itemFirstOutCallback(carousel){
  big_container = carousel.container.parent().parent();
  big_container.find('.carousel-prev').removeClass('disable');
}

function mycarousel_itemFirstInCallback(carousel){
  big_container = carousel.container.parent().parent();
  big_container.find('.carousel-prev').addClass('disable');
}

function mycarousel_itemLastOutCallback(carousel){
  big_container = carousel.container.parent().parent();
  big_container.find('.carousel-next').removeClass('disable');
}

function mycarousel_itemLastInCallback(carousel){
  big_container = carousel.container.parent().parent();
  big_container.find('.carousel-next').addClass('disable');
}

jQuery(document).ready(function(){
  $.get('/users/logins.html', function(data) {
    $('#top-menu').append(data);
  });

  $('.carousel').each(function(){
    $(this).jcarousel({
      scroll: 1,
      //wrap: 'circular',
      initCallback: carousel_initCallback,
      itemFirstInCallback:  mycarousel_itemFirstInCallback,
      itemFirstOutCallback: mycarousel_itemFirstOutCallback,
      itemLastInCallback:   mycarousel_itemLastInCallback,
      itemLastOutCallback:  mycarousel_itemLastOutCallback,
      // This tells jCarousel NOT to autobuild prev/next buttons
      buttonNextHTML: null,
      buttonPrevHTML: null
    });
  });
});
