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
      
        public ActionResult HienThiChiTiet(int id)
        {
            Sanpham sp = db.Sanphams.Where(t => t.Masp == id).SingleOrDefault();
            if (sp==null)
            {
                return RedirectToAction("None","Trangchu");
            }
            List<Sanpham> items = db.Sanphams.Where(s => s.Mathuonghieu == sp.Mathuonghieu).ToList();
            ViewBag.dsThuonghieu = items;
            return View(sp);
        }
       
    }
}