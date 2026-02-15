using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BRUH_Management_System
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_role"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                navUserName_lbl.Text = this.Session["user_name"].ToString();
            }
        }

        protected void navLogout_btn_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}