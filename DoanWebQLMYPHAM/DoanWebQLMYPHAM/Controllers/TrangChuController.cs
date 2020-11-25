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

        public ActionResult HienThiTheoThuongHieu(int id)
        {
            List<Sanpham> dsHT = data.Sanphams.Where(sp => sp.Mathuonghieu == id).ToList();
            return View("TrangChu",dsHT);
        }
    }
}