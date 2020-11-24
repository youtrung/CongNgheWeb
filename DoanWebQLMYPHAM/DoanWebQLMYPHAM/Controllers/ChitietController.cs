using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoanWebQLMYPHAM.Models;

namespace DoanWebQLMYPHAM.Controllers
{
   
    public class ChitietController : Controller
    {
        QLMPDataContext db = new QLMPDataContext();
        // GET: Chitiet
      
        public ActionResult HienThiChiTiet()
        {
            Sanpham sp = db.Sanphams.Where(t => t.Masp == 1).SingleOrDefault();
            if (sp==null)
            {
                return RedirectToAction("None","Trangchu");
            }
            ViewBag.dsThuonghieu = db.Sanphams.Where(s => s.Mathuonghieu == sp.Mathuonghieu).Take(5).ToList();
            return View(sp);
        }
       
    }
}