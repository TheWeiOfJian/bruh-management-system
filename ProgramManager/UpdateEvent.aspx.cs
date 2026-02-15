using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BRUH_Management_System.ProgramManager
{
    public partial class UpdateEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user_role"] == null)
                Response.Redirect("../Login.aspx");

            if (!IsPostBack)
            {
                DataTable dt = sqlquery("SELECT * FROM [dbo].[Event] WHERE Id = '" + Request["event_Id"] + "'");

                if (dt.Rows.Count > 0)
                {
                    event_title.Text = dt.Rows[0].ItemArray[1].ToString();
                    event_desc.Text = dt.Rows[0].ItemArray[2].ToString();
                    event_start.Text = Convert.ToDateTime(dt.Rows[0].ItemArray[3]).ToString("yyyy-MM-ddThh:mm");
                    event_end.Text = Convert.ToDateTime(dt.Rows[0].ItemArray[4]).ToString("yyyy-MM-ddThh:mm");
                    event_venue.Text = dt.Rows[0].ItemArray[5].ToString();
                }
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            string query = "UPDATE [dbo].[Event] SET event_description = '" + event_desc.Text.Trim() + "', start_time = '" + Convert.ToDateTime(event_start.Text)
                + "', end_time = '" + Convert.ToDateTime(event_end.Text) + "', venue = '" + event_venue.Text + "' WHERE Id = '" + Request["event_Id"] + "'";

            sqlvoid(query);

            Response.Redirect("/ProgramManager/EventDashboard?Id=" + Request["event_Id"]);
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

        public void sqlvoid(string query)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
