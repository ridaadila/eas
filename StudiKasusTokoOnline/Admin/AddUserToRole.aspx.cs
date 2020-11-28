using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace StudiKasusTokoOnline.Admin
{
    public partial class AddUserToRole : System.Web.UI.Page
    {
        private ApplicationDbContext ctx = new ApplicationDbContext();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Microsoft.AspNet.Identity.EntityFramework.IdentityRole> ddRole_GetData()
        {
            return ctx.Roles.OrderBy(r => r.Name);
        }

        public IQueryable<Microsoft.AspNet.Identity.EntityFramework.IdentityUser> ddUser_GetData()
        {
            return ctx.Users.OrderBy(u => u.UserName);
        }

        protected void btnAddUserToRole_Click(object sender, EventArgs e)
        {
            if(IsValid)
            {
                var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
                manager.AddToRole(ddUser.SelectedValue, ddRole.SelectedValue);
                SuccessText.Text = "Add User " + ddUser.SelectedItem.Text + " to Role " +
                    ddRole.SelectedValue + " success !";
            }
        }
    }
}