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
    public partial class MyEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            load_events();

            if (DataListMyOngoingEvents.Items.Count == 0)
            {
                no_ongoing.Visible = true;
            }
            else
            {
                no_ongoing.Visible = false;
            }

            if (DataListMyUpcomingEvents.Items.Count == 0)
            {
                no_upcoming.Visible = true;
            }
            else
            {
                no_upcoming.Visible = false;
            }

            if (DataListMyPastEvents.Items.Count == 0)
            {
                no_past.Visible = true;
            }
            else
            {
                no_past.Visible = false;
            }
        }

        protected void load_events()
        {
            String user_id = this.Session["user_Id"].ToString();
            string today = DateTime.Now.ToString();
            string query = "SELECT E.* FROM Event E INNER JOIN User_Event UE ON E.Id = UE.event_Id WHERE UE.user_Id = @user_Id AND start_time <= @today AND is_ended = 0";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@today", today);
            cmd.Parameters.AddWithValue("@user_Id", user_id);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            DataListMyOngoingEvents.DataSource = dt;
            DataListMyOngoingEvents.DataBind();

            query = "SELECT E.* FROM Event E INNER JOIN User_Event UE ON E.Id = UE.event_Id WHERE UE.user_Id = @user_Id AND start_time > @today;";
            SqlCommand cmd2 = new SqlCommand(query, con);
            cmd2.Parameters.AddWithValue("@today", today);
            cmd2.Parameters.AddWithValue("@user_Id", user_id);
            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
            DataTable dt2 = new DataTable();
            sda2.Fill(dt2);
            DataListMyUpcomingEvents.DataSource = dt2;
            DataListMyUpcomingEvents.DataBind();

            query = "SELECT E.* FROM Event E INNER JOIN User_Event UE ON E.Id = UE.event_Id WHERE UE.user_Id = @user_Id AND start_time <= @today AND is_ended = 1";
            SqlCommand cmd3 = new SqlCommand(query, con);
            cmd3.Parameters.AddWithValue("@today", today);
            cmd3.Parameters.AddWithValue("@user_Id", user_id);
            SqlDataAdapter sda3 = new SqlDataAdapter(cmd3);
            DataTable dt3 = new DataTable();
            sda3.Fill(dt3);
            DataListMyPastEvents.DataSource = dt3;
            DataListMyPastEvents.DataBind();
        }
    }
}