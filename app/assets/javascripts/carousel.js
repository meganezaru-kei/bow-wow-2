$(document).on('turbolinks:load', function(){
  $('.slider-pc').slick({
    prevArrow:'<i class="fa fa-angle-left arrow arrow-left d-none d-md-block"></i>',
    nextArrow:'<i class="fa fa-angle-right arrow arrow-right d-none d-md-block"></i>',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800,
    centerMode: true,
    centerPadding: '15%'
  });
});
$(document).on('turbolinks:load', function(){
  $('.slider-sp').slick({
    prevArrow:'<i class="fa fa-angle-left arrow arrow-left d-none d-md-block"></i>',
    nextArrow:'<i class="fa fa-angle-right arrow arrow-right d-none d-md-block"></i>',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800,
    centerMode: true,
    centerPadding: '0%'
  });
});