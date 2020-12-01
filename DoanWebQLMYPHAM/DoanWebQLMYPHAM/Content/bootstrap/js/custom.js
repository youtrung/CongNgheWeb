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
$(function () {
    $('.multiple-items-v2').slick({
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows: true,
        dots: true,
        centerMode: true,
        prevArrow: '<span class="priv_arrow"><i class="fas fa-angle-left"></i> </span>',
        nextArrow: '<span class="next_arrow"><i class="fas fa-angle-right"></i> </span>',

    });
});
$function validateForm()
{
    // Bước 1: Lấy giá trị của username và password
    var username = document.getElementById('username').value;
    var password = document.getElementById('password').value;

    // Bước 2: Kiểm tra dữ liệu hợp lệ hay không
    if (username == '') {
        alert('Bạn chưa nhập tên đăng nhập');
    }
    else if (password == '') {
        alert('Bạn chưa nhập mật khẩu');
    }
    else {
        alert('Dữ liệu hợp lệ, ta có thể chấp nhận submit form');
        return true;
    }

    return false;
};

