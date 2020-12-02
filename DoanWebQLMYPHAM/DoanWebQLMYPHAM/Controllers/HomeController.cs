using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoanWebQLMYPHAM.Models;
namespace DoanWebQLMYPHAM.Controllers
{   
   
    public class HomeController : Controller
    {
        QLMPDataContext db = new QLMPDataContext();
        public ActionResult Index()
        {
            List<Sanpham> dsSP = db.Sanphams.ToList();
            return View(dsSP);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}