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
    public partial class EventDetails : System.Web.UI.Page
    {
        private int EVENT_ID = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString != null && Request.QueryString.Count > 0)
            {
                string param = Request.QueryString["event_id"];

                if (string.IsNullOrEmpty(param))
                {
                    Response.Redirect("/AllEvents.aspx");
                }
                else
                {
                    bool convertable = int.TryParse(param, out EVENT_ID);
                    if (!convertable)
                    {
                        Response.Redirect("/AllEvents.aspx");
                    }
                }
            }
            else
            {
                Response.Redirect("/AllEvents.aspx");
            }

            string query = "SELECT * FROM Event WHERE Id = @event_id";
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@event_id", EVENT_ID);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    event_title.InnerText = reader["event_title"].ToString();
                    start_time_lbl.Text = reader["start_time"].ToString();
                    end_time_lbl.Text = reader["end_time"].ToString();
                    venue_lbl.Text = reader["venue"].ToString();
                    description_lbl.Text = reader["event_description"].ToString();
                }
            }
        }

        protected void signup_btn_Click(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();

            String id = this.Session["user_Id"].ToString();

            string query2 = "SELECT * FROM [dbo].[User_Event] WHERE user_Id = '" + id + "' AND event_Id = '" + EVENT_ID + "'";
            SqlCommand cmd2 = new SqlCommand(query2, con);
            cmd2.CommandType = System.Data.CommandType.Text;

            cmd2.ExecuteNonQuery();

            SqlDataAdapter sda = new SqlDataAdapter(cmd2);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Response.Write("<script>alert('The same user cannot sign up for the same event twice!')</script>");
            }
            else
            {
                string query = "INSERT INTO [dbo].[User_Event] VALUES ('" + id + "', '" + EVENT_ID + "' ,'"+DateTime.Now.ToString()+"');";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.CommandType = System.Data.CommandType.Text;

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Signed up successfully!')</script>");
            }

            con.Close();
        }
    }
}