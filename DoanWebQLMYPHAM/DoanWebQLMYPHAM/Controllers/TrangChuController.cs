using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoanWebQLMYPHAM.Models;
using PagedList;
namespace DoanWebQLMYPHAM.Controllers
{
    public class TrangChuController : Controller
    {
     
        QLMPDataContext data = new QLMPDataContext();
        // GET: TrangChu
        [HttpGet]
        public ActionResult TrangChu(int? page)
        {
            int pageSize = 9;
            int pagenumber = (page ?? 1);
            List<Sanpham> dsSP = data.Sanphams.ToList();
            var onePageOfProducts= dsSP.ToPagedList(pagenumber,pageSize);
            ViewBag.th = new SelectList(data.Thuonghieus.ToList(), "Mathuonghieu", "Tenthuonghieu");
            ViewBag.xx = new SelectList(data.NhaXuatXus.ToList(), "Maxuatxu", "Ten");
            KhachHang k = (KhachHang)Session["KH"];
            ViewBag.kh = k;
            ViewBag.OnePageOfProducts = onePageOfProducts;
            return View(onePageOfProducts);
        }
       

        public ActionResult DSThuongHieu()
        {
            List<Thuonghieu> dsTH = data.Thuonghieus.ToList();
            ViewBag.th = new SelectList(data.Thuonghieus.ToList(), "Mathuonghieu", "Tenthuonghieu");
            ViewBag.xx = new SelectList(data.NhaXuatXus.ToList(), "Maxuatxu", "Ten");
            KhachHang k = (KhachHang)Session["KH"];
            ViewBag.kh = k;
            return PartialView(dsTH);
        }
        public ActionResult MenuThuongHieu()
        {
            List<Thuonghieu> dsTH = data.Thuonghieus.Take(10).ToList();
            ViewBag.th = new SelectList(data.Thuonghieus.ToList(), "Mathuonghieu", "Tenthuonghieu");
            ViewBag.xx = new SelectList(data.NhaXuatXus.ToList(), "Maxuatxu", "Ten");
            KhachHang k = (KhachHang)Session["KH"];
            ViewBag.kh = k;
            return PartialView(dsTH);
        }

        public ActionResult HienThiTheoThuongHieu(int id,int? page)
        {
            int pageSize = 25;
            int pagenumber = (page ?? 1);
            List<Sanpham> dsHT = data.Sanphams.Where(sp => sp.Mathuonghieu == id).ToList();
            var onePageOfProducts = dsHT.ToPagedList(pagenumber, pageSize);
            ViewBag.OnePageOfProducts = onePageOfProducts;
            KhachHang k = (KhachHang)Session["KH"];
            ViewBag.kh = k;
            ViewBag.th = new SelectList(data.Thuonghieus.ToList(), "Mathuonghieu", "Tenthuonghieu");
            ViewBag.xx = new SelectList(data.NhaXuatXus.ToList(), "Maxuatxu", "Ten");
            return this.View("TrangChu",onePageOfProducts);
        }

        [HttpGet]
        public ActionResult Dangnhap()
        {
            return View();
        }
        [HttpPost]
        //public ActionResult Login(FormCollection col)
        //{
        //    KhachHang kh = data.KhachHangs.FirstOrDefault(s => s.TaiKhoan == col["txtTen"] && s.MatKhau == col["txtPass"]);
        //    if (kh != null)
        //    {
        //        Session["KH"] = kh;
        //        KhachHang k = (KhachHang)Session["KH"];

        //        return RedirectToAction("TrangChu");
        //    }
        //    return RedirectToAction("Dangnhap");
        //}
        public JsonResult Login(KhachHang t)
        {
            int kq = 1;
            try
            {
                KhachHang kh = data.KhachHangs.FirstOrDefault(s => s.TaiKhoan == t.TaiKhoan && s.MatKhau == t.MatKhau);
                if (kh != null)
                {
                    Session["KH"] = kh;
                    KhachHang k = (KhachHang)Session["KH"];
                    return Json(kq, JsonRequestBehavior.AllowGet);
                }
            }
            catch
            {
                kq = 0;
            }
            return Json(kq, JsonRequestBehavior.AllowGet);
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
        [HttpPost]
        public ActionResult TimKiemSP(FormCollection col,int? page)
        {
            int pageSize = 9;
            int pagenumber = (page ?? 1);
            string tensp = col["txtTimKiem"];
            List<Sanpham> sp = data.Sanphams.Where(r => r.Tensp.Contains(tensp)).ToList();
            var onePageOfProducts = sp.ToPagedList(pagenumber, pageSize);
            ViewBag.th = new SelectList(data.Thuonghieus.ToList(), "Mathuonghieu", "Tenthuonghieu");
            ViewBag.xx = new SelectList(data.NhaXuatXus.ToList(), "Maxuatxu", "Ten");
            ViewBag.OnePageOfProducts = onePageOfProducts;
            KhachHang k = (KhachHang)Session["KH"];
            ViewBag.kh = k;
            return View("TrangChu",onePageOfProducts);
        }
        public ActionResult Logout()
        {
            Session["KH"] = null;
            Session["GH"] = null;
            return RedirectToAction("TrangChu");
        }


    }
}