using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using System.Web.ModelBinding;

namespace StudiKasusTokoOnline.Account
{
    public partial class DetailPesanan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string routeParam = Page.RouteData.Values["id"].ToString();
            if (string.IsNullOrEmpty(routeParam))
            {
                Response.Redirect("~/Account/DaftarPesanan");
            }
            else
            {
                lblTotalOrder.Text = string.Format("Rp.{0:N0}", GetTotal(Convert.ToInt32(routeParam)));
            }
        }

        private SampleShopDbEntities db = new SampleShopDbEntities();

        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public StudiKasusTokoOnline.Models.Order frmDetail_GetItem([RouteData] int? id)
        {
            var result = (from o in db.Orders
                          where o.OrderID == id
                          orderby o.OrderDate descending
                          select o).SingleOrDefault();

            return result;
        }

        public IQueryable<StudiKasusTokoOnline.Models.OrderDetail> gvBookDetail_GetData([RouteData] int? id)
        {
            var results = from o in db.OrderDetails.Include("Book")
                          where o.OrderID == id
                          select o;

            return results;
        }

        private decimal GetTotal(int orderID)
        {
            decimal? total = 0;
            var results = from o in db.OrderDetails
                          where o.OrderID == orderID
                          select o;
            if(results.Count()>0)
            {
                total = results.Sum(o => o.Price * o.Quantity);
            }

            return total.Value;
        }
    }
}