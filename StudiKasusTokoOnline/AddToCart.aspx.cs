using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using Microsoft.AspNet.Identity;

namespace StudiKasusTokoOnline
{
    public partial class AddToCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //mengambil parameter dari route url
            string urlParam = Page.RouteData.Values["id"].ToString();
            if (!string.IsNullOrEmpty(urlParam))
            {
                int bookId = Convert.ToInt32(urlParam);
                string cartId = GetShoppingCartId();
                AddItem(cartId, bookId, 1);
            }
            else
            {
                ltError.Text = "Tidak dapat menambahkan barang ke cart";
            }
            Response.Redirect("~/ShoppingCartPage.aspx");
        }

        private SampleShopDbEntities db = new SampleShopDbEntities();

        //menambahkan item kedalam shopping cart
        public void AddItem(string cartID, int bookID, int qty)
        {
            //mencari data yg akan ditambah apakah sudah ada di shopping cart
            var result = (from c in db.ShoppingCarts
                          where c.CartID == cartID && c.BookID == bookID
                          select c).SingleOrDefault();

            //jika tidak ditemukan maka tambahkan ke cart
            if (result == null)
            {
                ShoppingCart newCart = new ShoppingCart()
                {
                    CartID = cartID,
                    Quantity = qty,
                    BookID = bookID,
                    DateCreated = DateTime.Now
                };
                db.ShoppingCarts.Add(newCart);
            }
            else //jika ditemukan update quantitynya
            {
                result.Quantity += qty;
            }
            db.SaveChanges();
        }

        private const string CartId = "Session_CartId";
        public string GetShoppingCartId()
        {
            //cek apakah session sudah ada
            if (Session[CartId] == null)
            {
                //jika user sudah login simpan nama jika belum beri nilai random
                Session[CartId] = 
                    Context.User.Identity.IsAuthenticated ? Context.User.Identity.GetUserName() : Guid.NewGuid().ToString();
            }
            return Session[CartId].ToString();
        }

        //migrasi pengguna anonymous
        public void MigrasiCart(string oldCartID,string username)
        {
            var results = from s in db.ShoppingCarts
                          where s.CartID == oldCartID
                          select s;
            foreach(var shoppingCart in results)
            {
                shoppingCart.CartID = username;
            }
            db.SaveChanges();
            Session[CartId] = username;
        }

    }
}