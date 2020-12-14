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
        public JsonResult getbyId(int id)
        {
            var p = db.Sanphams.Where(r => r.Masp == id).SingleOrDefault();
            return Json(p, JsonRequestBehavior.AllowGet);
        }
    }
}