using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.ModelBinding;
using System.Web.Routing;
using StudiKasusTokoOnline.Models;


namespace StudiKasusTokoOnline
{
    public partial class BookList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Page.RouteData.Values["id"].ToString());
        }

        private SampleShopDbEntities db = new SampleShopDbEntities();
        public IQueryable<StudiKasusTokoOnline.Models.Book> lvBook_GetData([RouteData] int? id)
        {
            var results = from b in db.Books.Include("Category").Include("Author")
                          where b.CategoryID == id
                          orderby b.Category.CategoryName ascending
                          select b;

            return results;
        }
    }
}