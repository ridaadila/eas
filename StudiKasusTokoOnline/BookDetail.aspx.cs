using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using System.Web.ModelBinding;
using Microsoft.AspNet.Identity;

namespace StudiKasusTokoOnline
{
    public partial class BookDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private SampleShopDbEntities db = new SampleShopDbEntities();
        public StudiKasusTokoOnline.Models.Book fvBookDetail_GetItem([RouteData] int? id)
        {
            var results = (from b in db.Books
                           where b.BookID == id
                           select b).SingleOrDefault();
            return results;
        }

        private string bookId;
        protected void btnReview_Click(object sender, EventArgs e)
        {

            bookId = Page.RouteData.Values["id"].ToString();
            var rating = (AjaxControlToolkit.Rating)lvAddReview.FindControl("myRating");
            var comments = (TextBox)lvAddReview.FindControl("txtComment"); 
            Review newReview = new Review()
            {
                BookID = Convert.ToInt32(bookId),
                CustomerName = Context.User.Identity.GetUserName(),
                CustomerEmail = Context.User.Identity.GetUserName(),
                Rating =  rating.CurrentRating,
                Comments = comments.Text
            };
            
            try
            {
                db.Reviews.Add(newReview);
                db.SaveChanges();
                gvReview.DataBind();
            }
            catch (Exception ex)
            {
                ltMessage.Text = string.Format("<p class='alert alert-danger'>{0}</p>", "Error: "+ex.Message);
            }
        }

        public IQueryable<StudiKasusTokoOnline.Models.Review> gvReview_GetData([RouteData] int? id)
        {
            var results = from r in db.Reviews
                          where r.BookID == id
                          orderby r.ReviewID descending
                          select r;
            return results;
        }
    }
}