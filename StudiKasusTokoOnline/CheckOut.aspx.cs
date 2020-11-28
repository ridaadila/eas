using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using Microsoft.AspNet.Identity;
using System.Web.ModelBinding;

namespace StudiKasusTokoOnline
{
    public partial class CheckOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ltHeader.Text = string.Format("<h3>{0}</h3><br />", "Periksa dan Kirim Pesanan Anda");
            ltPesanSukses.Text = string.Format("<p class='alert alert-success'>{0}</p>", "Silahkan periksa semua informasi dibawah ini dengan teliti dan pastikan tidak ada kesalahan sebelum anda mengirimkan.");
            ltUsername.Text =  Context.User.Identity.GetUserName();
            GetTotalPrice();
        }

        private void GetTotalPrice()
        {
            AddToCart objAddToCart = new AddToCart();
            string cartID = objAddToCart.GetShoppingCartId();

            decimal cartTotal = GetTotal(cartID);
            lblTotalOrder.Text = string.Format("Rp.{0:N0}", cartTotal);
        }

        public decimal GetTotal(string cartID)
        {
            decimal cartTotal = 0;
            var results = from s in db.ShoppingCarts.Include("Book")
                          where s.CartID == cartID
                          select s;
            if (results.Count() > 0)
                cartTotal = results.Sum(s => s.Book.Price * s.Quantity);
            else
                cartTotal = 0;

            return cartTotal;
        }

        private SampleShopDbEntities db = new SampleShopDbEntities();
        public IQueryable<StudiKasusTokoOnline.Models.ShoppingCart> gvCart_GetData([Session] string Session_CartId)
        {
            var results = from s in db.ShoppingCarts.Include("Book")
                          where s.CartID == Session_CartId
                          orderby s.RecordID ascending
                          select s;
            return results;
        }

        //submit barang pesanan
        private int orderId;
        public bool SubmitOrder(string username)
        {
            try
            {
                Order newOrder = new Order()
                {
                    CustomerName = username,
                    OrderDate = DateTime.Now,
                    ShipDate = HitungTanggalKirim()
                };
                var addResult = db.Orders.Add(newOrder);
                db.SaveChanges();
                orderId = addResult.OrderID;

                //menambahkan data order detail
                AddToCart objAddCart = new AddToCart();
                string cartID = objAddCart.GetShoppingCartId();
                var results = from s in db.ShoppingCarts.Include("Book")
                              where s.CartID == cartID
                              select s;
                foreach (var shoppingCart in results)
                {
                    OrderDetail od = new OrderDetail()
                    {
                        OrderID = newOrder.OrderID,
                        BookID = shoppingCart.BookID,
                        Quantity = shoppingCart.Quantity,
                        Price = shoppingCart.Book.Price
                    };
                    db.OrderDetails.Add(od);

                    //mendelete data pada ShoppingCart
                    var result = (from s in db.ShoppingCarts
                                  where s.CartID == shoppingCart.CartID && s.BookID == shoppingCart.BookID
                                  select s).SingleOrDefault();
                    if (result != null)
                        db.ShoppingCarts.Remove(result);
                }
                db.SaveChanges();
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            return true;
        }

        //menghitung tanggal pengiriman, 2 hari setelah pesan
        private DateTime HitungTanggalKirim()
        {
            DateTime shipDate = DateTime.Now.AddDays(2);
            return shipDate;
        }

        
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (SubmitOrder(Context.User.Identity.GetUserName()))
            {
                ltHeader.Text = string.Format("<h3>{0}</h3><br />", "Terima Kasih telah berbelanja di Toko kami");
                ltPesanSukses.Text = string.Format("<p class='alert alert-success'>{0}</p>", "Pesanan anda sudah diproses.");
                btnSubmit.Visible = false;
                ltLinkInvoice.Text = string.Format("<a href='{0}'>Cetak Invoice</a>",ResolveUrl("~/Account/LaporanNota/"+orderId.ToString()));
            }
        }
    }
}