using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BRUH_Management_System
{
    public partial class AllEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_events();

            if (DataList1.Items.Count == 0)
            {
                no_ongoing.Visible = true;
            }
            else
            {
                no_ongoing.Visible = false; 
            }

            if (DataList2.Items.Count == 0)
            {
                no_upcoming.Visible = true;
            }
            else
            {
                no_upcoming.Visible = false; 
            }
        }

        protected void load_events()
        {
            string today = DateTime.Now.ToString();
            string query = "SELECT * FROM [dbo].[Event] WHERE start_time <= @today AND is_ended != 1;";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@today", today);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataList1.DataSource = dt;
            DataList1.DataBind();

            query = "SELECT * FROM [dbo].[Event] WHERE start_time > @today;";
            SqlCommand cmd2 = new SqlCommand(query, con);
            cmd2.Parameters.AddWithValue("@today", today);
            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            DataList2.DataSource = dt2;
            DataList2.DataBind();
        }
    }
}