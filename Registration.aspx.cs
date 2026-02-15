using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace BRUH_Management_System
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            String email = this.user_email.Text;
            String username = this.username.Text;
            String password = this.user_password.Text;
            String phone = this.user_phone.Text;

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            

            string query2 = "SELECT * FROM [dbo].[User] WHERE user_email = '" + email + "'";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            cmd2.CommandType = System.Data.CommandType.Text;

            cmd2.ExecuteNonQuery();

            SqlDataAdapter sda = new SqlDataAdapter(cmd2);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Response.Write("Email is already registered, please proceed to login instead.");
            }
            else
            {
                string query = "INSERT INTO [dbo].[User] VALUES ('" + email + "', '" + username + "', '" + password +
                "', '" + phone + "', 'itdp');";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.ExecuteNonQuery();

                
                Response.Redirect("AllEvents.aspx");
            }

            con.Close();


            
        }
    }
}