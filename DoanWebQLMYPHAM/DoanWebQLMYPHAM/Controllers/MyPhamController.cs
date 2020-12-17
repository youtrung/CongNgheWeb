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
            
            string Tensp = col["txtTen"];
            string Mota = col["MoTa"];
            string txtGiaban = col["txtGiaban"];
            string txtNgaycapnhap = col["txtNgaycapnhap"];
            string thuonghieu = col["th"];
            string xuatxu = col["xx"];
            string txtSoluongton = col["txtSoluongton"];
            string txtMoi = col["txtMoi"];
            string ston = col["txtSoluongton"];
            int msp = Int32.Parse(col["txtMa"]);
            Sanpham p = db.Sanphams.Where(t => t.Masp ==msp).SingleOrDefault();
            p.AnhBia = Path.GetFileName(fupload.FileName);
            fupload.SaveAs(Server.MapPath("~/Content/HinhAnh/") + p.AnhBia);
            p.Tensp = Tensp;
            p.MoTa = Mota;
            p.GiaBan =Int32.Parse(txtGiaban);
            p.SoLuongTon =Int32.Parse(txtSoluongton);
            p.NgayCapNhat = DateTime.Parse(txtNgaycapnhap);
            p.Mathuonghieu =Int32.Parse(col["th"]);
            p.Maxuatxu =Int32.Parse(col["xx"]);
            p.Moi =Int32.Parse(txtMoi);
            ValidateRequest = false;
            db.SubmitChanges();
            return RedirectToAction("TrangChu","TrangChu");
        }
        [HttpPost]
        public ActionResult Themsp(Sanpham s,FormCollection col, HttpPostedFileBase fupload1)
        {
            string thuonghieu = col["th"];
            string xuatxu = col["xx"];
            s.Tensp = col["txtTen"];
            s.MoTa = col["MoTa"];
            s.NgayCapNhat =DateTime.Parse(col["txtNgaycapnhap"]);
            s.GiaBan =Int32.Parse(col["txtGiaban"]);
            s.Mathuonghieu = Int32.Parse(col["th"]);
            s.Maxuatxu =Int32.Parse(xuatxu);
            s.SoLuongTon= Int32.Parse (col["txtSoluongton"]);
            // phai co mutilpart 
            s.AnhBia= fupload1.FileName;
            fupload1.SaveAs(Server.MapPath("~/Content/HinhAnh/" + fupload1.FileName));
            var kq=d.InsertMP(s);
            return RedirectToAction("TrangChu", "TrangChu");
        }
        public ActionResult Delete(int id)
        {
            d.Deletesp(id);
            return RedirectToAction("TrangChu", "TrangChu");
        }
    }
}