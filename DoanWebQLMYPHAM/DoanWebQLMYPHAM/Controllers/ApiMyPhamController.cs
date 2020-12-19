using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DoanWebQLMYPHAM.Models;
namespace DoanWebQLMYPHAM.Controllers
{
   
    public class ApiMyPhamController : ApiController
    {
        QLMPDataContext db = new QLMPDataContext();
        public bool InsertMP(Sanpham s)
        {
            try
            {
                Sanpham sp = new Sanpham();
                sp.Tensp = s.Tensp;
                sp.AnhBia = s.AnhBia;
                sp.Mathuonghieu = s.Mathuonghieu;
                sp.Maxuatxu = s.Maxuatxu;
                sp.GiaBan = s.GiaBan;
                sp.MoTa = s.MoTa;
                sp.NgayCapNhat = s.NgayCapNhat;
                sp.SoLuongTon = s.SoLuongTon;
              
                db.Sanphams.InsertOnSubmit(sp);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        [HttpDelete]
        public bool Deletesp(int id)
        {
            try
            {
                var sp = db.Sanphams.Where(t => t.Masp == id).SingleOrDefault();
                db.Sanphams.DeleteOnSubmit(sp);
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool Updatesp(int id,string tsp,string anh,int th,int xx,int gb,string mota,DateTime ngay,int sl)
        {
            try
            {
                Sanpham sp = db.Sanphams.Where(t => t.Masp == id).SingleOrDefault();
                sp.Tensp = tsp;
                sp.AnhBia = anh;
                sp.Mathuonghieu = th;
                sp.Maxuatxu = xx;
                sp.GiaBan = gb;
                sp.MoTa = mota;
                sp.NgayCapNhat = ngay;
                sp.SoLuongTon =sl;
                db.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
