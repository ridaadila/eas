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
    public partial class DaftarPesanan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private SampleShopDbEntities db = new SampleShopDbEntities();
        public IQueryable<StudiKasusTokoOnline.Models.OrderDetail> gvDaftar_GetData([Session] string Session_CartId)
        {
            var results = from o in db.OrderDetails.Include("Order")
                          where o.Order.CustomerName == Session_CartId
                          orderby o.Order.OrderDate descending
                          select o;
            return results;
        }
    }
}