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
                ViewBag.user = k;
                return RedirectToAction("TrangChu");
            }
            return RedirectToAction("Dangnhap");
        }
        public ActionResult KhoitaolayoutTenUser()
        {
            KhachHang k = (KhachHang)Session["KH"];
            return PartialView(k);
        }
    }
}