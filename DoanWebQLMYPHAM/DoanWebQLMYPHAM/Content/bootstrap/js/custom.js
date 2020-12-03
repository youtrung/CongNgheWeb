$('.multiple-items').slick({
    infinite: false,
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    autoPlay: true,
    autoplaySpeed: 2000,
    dots: true,
    centerMode: true,
    centerPadding: '60px',

});
$('.multiple-items-v2').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3,
        arrows: true,
        dots: true,
        centerMode: true,
        prevArrow: '<span class="priv_arrow"><i class="fas fa-angle-left"></i> </span>',
        nextArrow: '<span class="next_arrow"><i class="fas fa-angle-right"></i> </span>',

    });
