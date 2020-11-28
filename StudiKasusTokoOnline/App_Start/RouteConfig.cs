using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Routing;
using Microsoft.AspNet.FriendlyUrls;

namespace StudiKasusTokoOnline
{
    public static class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.MapPageRoute("BookList", "BookList/{id}", "~/BookList.aspx");
            routes.MapPageRoute("BookDetail", "BookDetail/{id}", "~/BookDetail.aspx");
            routes.MapPageRoute("AddToCart", "AddToCart/{id}", "~/AddToCart.aspx");
            routes.MapPageRoute("DetailPesanan", "Account/DetailPesanan/{id}", "~/Account/DetailPesanan.aspx");
            routes.MapPageRoute("LaporanNota", "Account/LaporanNota/{id}", "~/Account/LaporanNota.aspx");

            var settings = new FriendlyUrlSettings();
            settings.AutoRedirectMode = RedirectMode.Permanent;
            routes.EnableFriendlyUrls(settings); 
        }
    }
}
