using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;

namespace StudiKasusTokoOnline.Admin
{
    public partial class AddProduct : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private SampleShopDbEntities db = new SampleShopDbEntities();
        public IQueryable<Category> ddCategory_GetItem()
        {
            return db.Categories.OrderBy(c => c.CategoryName);
        }

        public IQueryable<Author> ddAuthor_GetItem()
        {
            return db.Authors.OrderBy(a => a.FirstName);
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //menambah data
            try
            {
                var newBook = new Book()
                {
                    Title = txtTitle.Text,
                    CategoryID = Convert.ToInt32(ddCategory.SelectedValue),
                    ISBN = txtIsbn.Text,
                    Price = Convert.ToDecimal(txtPrice.Text),
                    Publisher = txtPublisher.Text,
                    AuthorID = Convert.ToInt32(ddAuthor.SelectedValue),
                    PublicationDate = Convert.ToDateTime(txtDate.Text),
                    CoverImage = fpCover.FileName,
                    Description = txtDescription.Text
                };
                db.Books.Add(newBook);
                db.SaveChanges();

                string filenameCover = System.IO.Path.GetFileName(fpCover.FileName);
                fpCover.SaveAs(Server.MapPath("~/Catalog/Images/") + filenameCover);

                string filenameThumbs = System.IO.Path.GetFileName(fpThumbs.FileName);
                fpThumbs.SaveAs(Server.MapPath("~/Catalog/Images/Thumbs/") + filenameThumbs);

                ltMessage.Text = string.Format("<p class='alert alert-success'>{0}</p>", "Data Buku berhasil ditambah !");
            }
            catch (Exception ex)
            {
                ltMessage.Text = string.Format("<p class='alert alert-danger'>{0}</p>", "Error : " + ex.Message);
            }
        }
    }
}