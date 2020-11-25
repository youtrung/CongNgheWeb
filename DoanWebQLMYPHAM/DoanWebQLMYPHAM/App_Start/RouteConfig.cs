using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace DoanWebQLMYPHAM
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            routes.MapRoute(
                name: "Default",
                url: "{controller}/{action}/{id}",
<<<<<<< HEAD
                defaults: new { controller = "Default1", action = "Index", id = UrlParameter.Optional }
=======
                defaults: new { controller = "TrangChu", action = "TrangChu", id = UrlParameter.Optional }
>>>>>>> 1dedc5c44c78ca56716a9923282f580c491ab6ec
            );
        }
    }
}
