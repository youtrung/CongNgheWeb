using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace DoanWebQLMYPHAM.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";
<<<<<<< HEAD
		return viEW();
=======

<<<<<<< HEAD
            return (); fdfdfdfd
=======
        
>>>>>>> d59b04c54205ac9b6403ecb64412c45ebb10e288
>>>>>>> a660f10a1bdc4e9f52b57e5ca570b8310ab12ea2
        }
    }
}