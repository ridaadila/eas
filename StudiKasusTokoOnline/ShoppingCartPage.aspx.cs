using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using System.Web.ModelBinding;

namespace StudiKasusTokoOnline
{
    public partial class ShoppingCartPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetTotalPrice();
        }

        private void GetTotalPrice()
        {
            AddToCart objAddToCart = new AddToCart();
            string cartID = objAddToCart.GetShoppingCartId();

            decimal cartTotal = GetTotal(cartID);
            lblTotalOrder.Text = string.Format("Rp.{0:N0}", cartTotal);
            if (cartTotal == 0)
            {
                btnCheckout.Visible = false;
            }
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

        // The id parameter name should match the DataKeyNames value set on the control
        public void gvCart_UpdateItem(int RecordID)
        {
            ShoppingCart item = db.ShoppingCarts.Find(RecordID);
            if (item == null)
            {
                ModelState.AddModelError("", String.Format("Item dengan id {0} tidak ditemukan", RecordID));
                return;
            }
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                db.SaveChanges();
                GetTotalPrice();
            }
        }

        public void gvCart_DeleteItem(int RecordID)
        {
            ShoppingCart item = db.ShoppingCarts.Find(RecordID);
            if(item==null)
            {
                ModelState.AddModelError("", String.Format("Item dengan id {0} tidak ditemukan", RecordID));
                return;
            }
            else
            {
                db.ShoppingCarts.Remove(item);
                db.SaveChanges();
                GetTotalPrice();
            }
        }
    }
}