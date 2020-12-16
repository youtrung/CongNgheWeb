using System;
using System.Collections.Generic;
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
                return View();
        }
        public ActionResult Themsp(Sanpham s)
        {
            var kq=d.InsertMP(s);
            return View();
        }
    }
}