using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoanWebQLMYPHAM.Models;
namespace DoanWebQLMYPHAM.Controllers
{
    public class MyPhamController : Controller
    {
        // GET: MyPham
        QLMPDataContext db = new QLMPDataContext();
        ApiMyPhamController d = new ApiMyPhamController();

        [HttpGet]
        public ActionResult getbyId(int id)
        {     
                Sanpham p = db.Sanphams.FirstOrDefault(x=>x.Masp==id);
                ViewBag.sp = p;
                ViewBag.th = new SelectList(db.Thuonghieus.ToList(), "Mathuonghieu", "Tenthuonghieu");
                ViewBag.xx = new SelectList(db.NhaXuatXus.ToList(), "Maxuatxu", "Ten");
            return View(p);
        }
        [HttpPost]
        public ActionResult Update(FormCollection col,HttpPostedFileBase fupload)
        {
            
            string Tensp = col["txtTen1"];
            string Mota = col["MoTa1"];
            int txtGiaban =Int32.Parse(col["txtGiaban1"]);
            string txtNgaycapnhap = col["txtNgaycapnhap1"];
            int thuonghieu =Int32.Parse(col["th"]);
            int xuatxu = Int32.Parse(col["xx"]);
          
           
            int ston = Int32.Parse(col["txtSoluongton1"]);
            int msp = Int32.Parse(col["txtMa1"]);
            d.Updatesp(msp, Tensp, thuonghieu, xuatxu, txtGiaban, Mota, DateTime.Parse(txtNgaycapnhap), ston);
            return RedirectToAction("TrangChu", "TrangChu");
            
        }
        [HttpPost]
        public ActionResult Themsp(Sanpham s, FormCollection col, HttpPostedFileBase fupload1)
        {
            
            string xuatxu = col["xx"];
            s.Tensp = col["txtTen"];
            s.MoTa = col["MoTa"];
            s.NgayCapNhat = DateTime.Parse(col["txtNgaycapnhap"]);
            s.GiaBan = Int32.Parse(col["txtGiaban"]);
            s.Mathuonghieu = Int32.Parse(col["th"]);
            s.Maxuatxu = Int32.Parse(xuatxu);
            s.SoLuongTon = Int32.Parse(col["txtSoluongton"]);
            // phai co mutilpart 
            s.AnhBia = fupload1.FileName;
            fupload1.SaveAs(Server.MapPath("~/Content/HinhAnh/" + fupload1.FileName));
            var kq = d.InsertMP(s);
            return RedirectToAction("TrangChu", "TrangChu");
        }
        public ActionResult Delete(int id)
        {
            d.Deletesp(id);
            return RedirectToAction("TrangChu", "TrangChu");
        }
    }
}