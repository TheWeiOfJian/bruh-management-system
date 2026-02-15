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

namespace BRUH_Management_System.ProgramManager
{
    public partial class EventDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_role"] == null)
                Response.Redirect("../Login.aspx");

            DataTable dt1 = sqlquery("SELECT * FROM [dbo].[Event]   WHERE Id = '" + Request["Id"] + "'");

            DataTable dt = sqlquery("SELECT * FROM [dbo].[Event] e  INNER JOIN [dbo].[User_Event] ue ON e.Id = ue.event_Id WHERE e.Id = '" + Request["Id"] + "'");
            
            if (dt.Rows.Count > 0)
            {
                output1.Text = "Total ITDP on " + dt.Rows[0].ItemArray[1].ToString() + ": ";
                output2.Text = dt.Rows.Count.ToString();
            }

            event_title.Text = dt1.Rows[0].ItemArray[1].ToString();
            event_timeline.Text = Convert.ToDateTime(dt1.Rows[0].ItemArray[3].ToString()).ToString("dd-MMM") + " - " + Convert.ToDateTime(dt1.Rows[0].ItemArray[4]).ToString("dd-MMM-yyyy");
            event_venue.Text = dt1.Rows[0].ItemArray[5].ToString();
            DisplayUsers();

            StringBuilder sb = new StringBuilder();
            sb.Append("<a href=\"/ProgramManager/UpdateEvent?event_Id=" + Request["Id"] + "\"");
            sb.Append(" class=\"btn btn-primary update-btn\">Update Event</a>");
            update_link_PlaceHolder.Controls.Add(new Literal { Text = sb.ToString() });
        }

        public void DisplayUsers()
        {
            DataTable dt = sqlquery("SELECT * FROM [dbo].[User] e  INNER JOIN [dbo].[User_Event] ue ON e.Id = ue.user_Id WHERE ue.event_Id = '" + Request["Id"] + "'");
            int i = 1;
            StringBuilder html = new StringBuilder();
            foreach (DataRow row in dt.Rows)
            {
                html.Append("<tr>");
                html.Append("<td>");
                html.Append("<p>" + i+ "</p>");
                i++;
                html.Append("</td>");
                html.Append("<td>");
                html.Append("<p>" + row["user_email"] + "</p>");
                html.Append("</td>");
                html.Append("<td>");
                html.Append("<p>" + row["user_name"] + "</p>");
                html.Append("</td>");
                html.Append("<td>");
                html.Append("<p>" + row["phone_number"] + "</p>");
                html.Append("</td>");
                html.Append("</tr>");
            }
            PlaceHolder1.Controls.Add(new Literal { Text = html.ToString() });


        }


        public DataTable sqlquery(string query)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            return dt;
        }
    }
}