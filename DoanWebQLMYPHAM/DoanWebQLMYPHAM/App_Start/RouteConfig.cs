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
                defaults: new { controller = "TrangChu", action = "TrangChu", id = UrlParameter.Optional }

=======

                defaults: new { controller = "TrangChu", action = "TrangChu", id = UrlParameter.Optional }
>>>>>>> f815ce7837e6d2b93774b04cb7107e58f3712b00
            );
        }
    }
}
