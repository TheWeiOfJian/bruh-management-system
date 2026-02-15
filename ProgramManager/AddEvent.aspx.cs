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
    public partial class AddEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void CreateBtn_Click(object sender, EventArgs e)
        {
            if (!CheckExist("event_title", event_title.Text))
            {
                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                string query = "INSERT INTO [Dbo].[Event] (event_title, event_description, start_time, end_time, venue, is_ended)" +
                    " VALUES (@event_title, @event_description, @start_time, @end_time, @venue, '" + false + "')";

                SqlCommand cmd = new SqlCommand(query, con);


                cmd.Parameters.AddWithValue("@event_title", event_title.Text);
                cmd.Parameters.AddWithValue("@event_description", event_desc.Text);
                cmd.Parameters.AddWithValue("@start_time", Convert.ToDateTime(event_start.Text));
                cmd.Parameters.AddWithValue("@end_time", Convert.ToDateTime(event_end.Text));
                cmd.Parameters.AddWithValue("@venue", event_venue.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                //System.Windows.Forms.MessageBox.Show("Congrats, Your Account Has Been Created");
                //Response.Redirect("LoginPage.aspx");
                con.Close();
                Response.Write("<script>alert('Event Created');window.location  = 'AdminDashboard.aspx'</script>");

            }
            else
            {
                Response.Write("<script>alert('Sorry, Event Already Exist');window.location  = 'AdminDashboard.aspx'</script>");

            }

        }
        public bool CheckExist(string data, string code)
        {

            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            con.Open();
            string query = "Select  * FROM  [Dbo].[Event] WHERE " +data+ "='"+code+"'";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.CommandType = System.Data.CommandType.Text;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            int i = cmd.ExecuteNonQuery();
            con.Close();
            return dt.Rows.Count > 0;

        }
    }
}