using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoanWebQLMYPHAM.Models;

namespace DoanWebQLMYPHAM.Controllers
{
   
    public  class ChitietController : Controller
    {
        QLMPDataContext db = new QLMPDataContext();
        // GET: Chitiet

      
        public ActionResult HienThiChiTiet(int id)
        {
            KhachHang kh = Session["KH"] as KhachHang;
            ViewBag.k = kh;
            Sanpham sp = db.Sanphams.Where(t => t.Masp == id).SingleOrDefault();
            if (sp==null)
            {
                return RedirectToAction("None","Trangchu");
            }
            List<Sanpham> items = db.Sanphams.Where(s => s.Mathuonghieu == sp.Mathuonghieu).ToList();
            ViewBag.dsThuonghieu = items;
           
            return View(sp);
        }
       
        public ActionResult GioHang(FormCollection num)
        {
            int sl = Int32.Parse(num["txtSL"]);
            int msp = Int32.Parse(num["txtMsp"]);
                GioHang gio = Session["GH"] as GioHang;
            KhachHang kh = Session["KH"] as KhachHang;
           
            if (gio == null)
            {
                gio = new GioHang();
            }
          
            int kq = gio.Them(msp,sl);
            Session["GH"] = gio;
            return RedirectToAction("TrangChu", "TrangChu");
        }
        public ActionResult HienThiSoLuongMathang()
        {
            GioHang gio = (GioHang)Session["GH"];
            return PartialView(gio);
        }
        public ActionResult XemGioHang()
        {
            
            GioHang gio = (GioHang)Session["GH"];
            //if (gio==null)
            //{
            //    return RedirectToAction("TrangChu", "TrangChu");
            //}
            return View(gio);
        }
        public ActionResult XacNhanGioHang()
        {
            GioHang gio = (GioHang)Session["GH"];
            KhachHang kh = (KhachHang)Session["KH"];
            ViewBag.khach = kh;
            return View(gio);
        }
        public ActionResult LuuDonHang(FormCollection c)
        {
            string ngaygiao = c["txtNgayGiao"];
         
            //Lay thong tin khach hang 
            KhachHang kh = Session["KH"] as KhachHang;
            GioHang gio = Session["GH"] as GioHang;
            //luu thong tin 
            DonHang dh = new DonHang();
            dh.NgayDat = DateTime.Now;
            if (ngaygiao != "")
            {
                dh.NgayGiao = DateTime.Parse(ngaygiao);
            }    
            dh.MaKH = kh.MaKH;
            db.DonHangs.InsertOnSubmit(dh);
            db.SubmitChanges();
            foreach (CardItem it in gio.list)
            {
                ChiTietDonHang ct = new ChiTietDonHang();
                ct.Masp = it.iMasp;
                ct.MaDonHang = dh.MaDonHang;
                ct.SoLuong = it.iSoluong;
                ct.DonGia = (decimal)it.ThanhTien * it.iSoluong;
                db.ChiTietDonHangs.InsertOnSubmit(ct);
                db.SubmitChanges();
            }
            Session["GH"] = null;
            return RedirectToAction("TrangChu", "TrangChu");

        }
        public ActionResult QuanLiDonHang()
        {
            var dh = db.DonHangs.ToList();
            return View(dh);
        }
        [HttpPost]
        public ActionResult Giaohang(FormCollection col)
        {
            
            
            foreach (var pair in col.Each())
            {
                DonHang dh = db.DonHangs.Where(t => t.MaDonHang == Int32.Parse(pair.Value)).SingleOrDefault();
                dh.NgayGiao = DateTime.Now;
                db.SubmitChanges();
            }
            var donhang = db.DonHangs.ToList();
            return View("QuanLiDonHang",donhang);
        }
        public ActionResult XoaGioHang()
        {
            Session["GH"] = null;
            return RedirectToAction("TrangChu", "TrangChu");
        }
        public ActionResult Xoasp(int msp,int sl)
        {
            GioHang gio = (GioHang)Session["GH"];
            var kq = gio.Xoa(msp, sl);
            return View("Xemgiohang",gio);
        }
        public ActionResult Vetrangchu()
        {
            return RedirectToAction("TrangChu", "TrangChu");
        }
        
    }
}