using Microsoft.AspNet.Identity.EntityFramework;
using StudiKasusTokoOnline.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using StudiKasusTokoOnline.Models;

namespace StudiKasusTokoOnline.Admin
{
    public partial class AddRole : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           //var sample = from u in ctx.Users
           //             select u
        }

        protected void btnAddRole_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var newRole = new IdentityRole
                {
                    Name = txtRole.Text
                };
                ctx.Roles.Add(newRole);
                ctx.SaveChanges();

                SuccessText.Text = "Adding role successfull";
                gvRole.DataBind();
            }
        }

        private ApplicationDbContext ctx = new ApplicationDbContext();
        public IQueryable<Microsoft.AspNet.Identity.EntityFramework.IdentityRole> gvRole_GetData()
        {
            var results = from r in ctx.Roles
                          select r;
            
            return results;
        }
    }
}