function Login() {
    var userObj = {
        TaiKhoan: $('#name').val(),
        MatKhau: $('#pass').val(),
    };
    $.ajax({
        url: "/TrangChu/Login",
        type: "POST",
        data: JSON.stringify(userObj),
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            $('#iclose').trigger('click');
            location.reload(true);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }

    });
}

