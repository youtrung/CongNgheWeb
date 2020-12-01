using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoanWebQLMYPHAM.Models;
namespace DoanWebQLMYPHAM.Controllers
{
    public class TrangChuController : Controller
    {
        QLMPDataContext data = new QLMPDataContext();
        // GET: TrangChu
        public ActionResult TrangChu()
        {
            List<Sanpham> dsSP = data.Sanphams.ToList();
            return View(dsSP);
        }

        public ActionResult DSThuongHieu()
        {
            List<Thuonghieu> dsTH = data.Thuonghieus.ToList();
            return PartialView(dsTH);
        }
        public ActionResult MenuThuongHieu()
        {
            List<Thuonghieu> dsTH = data.Thuonghieus.Take(10).ToList();
            return PartialView(dsTH);
        }

        public ActionResult HienThiTheoThuongHieu(int id)
        {
            List<Sanpham> dsHT = data.Sanphams.Where(sp => sp.Mathuonghieu == id).ToList();
            return View("TrangChu",dsHT);
        }

        [HttpGet]
        public ActionResult Dangnhap()
        {

            return View();
        }
        [HttpPost]
        public ActionResult Login(FormCollection col)
        {
            KhachHang kh = data.KhachHangs.FirstOrDefault(s => s.TaiKhoan == col["txtTen"] && s.MatKhau == col["txtPass"]);
            if (kh != null)
            {
                Session["KH"] = kh;
                KhachHang k = (KhachHang)Session["KH"];
             
                return RedirectToAction("TrangChu");
            }
            return RedirectToAction("Dangnhap");
        }
        public ActionResult KhoitaolayoutTenUser()
        {
            KhachHang k = (KhachHang)Session["KH"];
            return PartialView(k);
        }
        [HttpGet]
        public ActionResult CreateAccount()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddAccount(FormCollection col)
        {
            string tenkh = col["txtHoTen"];
            string ngaysinh = col["dtpNgaySinh"];
            string gt = col["GioiTinh"];
            string sdt = col["txtSDT"];
            string dc = col["txtDC"];
            string tk = col["txtTaikhoan"];
            string ps = col["txtPass"];
            string email = col["txtEmail"];
            KhachHang kh = new KhachHang();
            kh.HoTen = tenkh;
            kh.GioiTinh = gt;
            kh.DienThoai = sdt;
            kh.DiaChi = dc;
            kh.TaiKhoan = tk;
            kh.MatKhau = ps;
            kh.Email = email;
            kh.NgaySinh = DateTime.Parse(ngaysinh);
            data.KhachHangs.InsertOnSubmit(kh);
            data.SubmitChanges();
            Session["KH"] = kh;
            KhachHang k = (KhachHang)Session["KH"];
            return RedirectToAction("TrangChu");
        }

    }
}