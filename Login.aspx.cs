using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BRUH_Management_System
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            login_alert.Visible = false;
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string email = this.user_email.Text;
            string password = this.user_password.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string query = "SELECT * FROM [dbo].[User] WHERE user_email ='" + email + "' AND user_password ='" + password + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            int i = cmd.ExecuteNonQuery();
            con.Close();

            if(dt.Rows.Count >0)
            {
                this.Session["user_email"] = email;
                object id = dt.Rows[0].ItemArray[0];
                this.Session["user_Id"] = id;
                object role = dt.Rows[0].ItemArray[5];
                this.Session["user_role"] = role;
                object name = dt.Rows[0].ItemArray[2];
                this.Session["user_name"] = name;

                if (role.Equals("programManager"))
                {
                    Response.Redirect("ProgramManager/AdminDashboard.aspx");
                } else if (role.Equals("itdp"))
                {
                    Response.Redirect("MyEvents.aspx");
                }
            } else
            {
                login_alert.Visible = true;
            }
        }
    }
}