using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using Microsoft.Reporting.WebForms;
using Microsoft.AspNet.Identity;

namespace StudiKasusTokoOnline.Account
{
    public partial class LaporanNota : System.Web.UI.Page
    {
        private SampleShopDbEntities db = new SampleShopDbEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!Page.IsPostBack)
            {
                ShowReport();
            }
        }

        private void ShowReport()
        {
            var strOrderId = Page.RouteData.Values["id"].ToString();
            string currentUser = Context.User.Identity.GetUserName();
            int orderId = Convert.ToInt32(strOrderId);
            var results = from o in db.OrderDetails.Include("Book").Include("Author")
                          where o.Order.CustomerName == currentUser && o.OrderID == orderId
                          select new
                          {
                              Quantity = o.Quantity,
                              Price = o.Price,
                              FirstName = o.Book.Author.FirstName,
                              LastName = o.Book.Author.LastName,
                              Title = o.Book.Title,
                              PublicationDate = o.Book.PublicationDate,
                              ISBN = o.Book.ISBN,
                              CoverImage = o.Book.CoverImage,
                              Description = o.Book.Description,
                              OrderId = o.OrderID,
                              Id = o.Id
                          };

            rvLaporan.LocalReport.DataSources.Clear();
            ReportDataSource rds = new ReportDataSource("InvoiceDataSet", results.ToList());
            rvLaporan.LocalReport.DataSources.Add(rds);
            rvLaporan.LocalReport.ReportPath = Server.MapPath("~/Account/Report/ReportInvoice.rdlc");
            rvLaporan.LocalReport.Refresh();
        }
    }
}