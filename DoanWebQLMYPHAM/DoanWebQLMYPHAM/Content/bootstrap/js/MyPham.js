function getbyId(productID) {
    $.ajax({
        url: "/MyPham/getbyId/" + productID,
        type: "GET",
        contentType: "application/json;charset=UTF-8",
        datatype: "json",
        success: function (result) {
            $('#myModal1').show();
            $('#id').val(result.Masp);
            $('#ten').val(result.Tensp);
            $('#anh').val(result.AnhBia);
            $('#giaban').val(result.GiaBan);
            $('#mota').val(result.MoTa);
            $('#ngaycapnhap').val(result.NgayCapNhap);
            $('#slton').val(result.SoLuongTon);
            $('#idthuonghieu').val(result.Mathuonghieu);
            $('#idxuatxu').val(result.Maxuatxu);

        }
    });
}
function Them() {
    var productID={
        Masp: $('#id').val(),
        Tensp: $('#ten').val(),
        AnhBia: $('#anh').val(),
        GiaBan: $('#giaban').val(),
        Mota: $('#mota').val(),
        NgayCapNhap: $('#ngaycapnhap').val(),
        SoLuongTon: $('#slton').val(),
        Mathuonghieu: $('#idthuonghieu').val(),
        Maxuatxu: $ ('#idxuatxu').val(),

    }

    $.ajax({
        url: "/MyPham/Themsp",
        type: "POST",
        datatype: "json",
        data: JSON.stringify(productID),
        contentType: "application/json;charset=utf-8",
        success: function (result) {
            location.reload(true);
        }

    });
}