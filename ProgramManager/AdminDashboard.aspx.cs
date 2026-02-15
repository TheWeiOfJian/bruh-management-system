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
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DisplayEvent();
            if (DataList1.Items.Count == 0)
            {
                no_event.Visible = true;
            }
            else
            {
                no_event.Visible = false;
            }
        }


        //public void DisplayEvent()
        //{
        //    DataTable dt = sqlquery("SELECT * FROM [dbo].[Event] WHERE is_ended = 0");
        //    if (dt.Rows.Count > 0)
        //    {
        //        StringBuilder html = new StringBuilder();
        //        foreach (DataRow row in dt.Rows)
        //        {

        //            html.Append("<div class='child'>");


                    //html.Append("<a href='EventDashboard?Id="+row["Id"]+"'><h3>" + row["event_title"] + "</h3></a>");
                    //html.Append("<p>" + row["event_description"] + "</p>");
                    //html.Append("<p>" + row["start_time"] + "</p>");
                    //html.Append("<p>" + row["end_time"] + "</p>");
                    //html.Append("<p>" + row["venue"] + "</p>");
                    //html.Append("<p>" + row["current_stage"] + "</p>");


        //            html.Append("<a href='EventDashboard?Id=" + row["Id"] + "'><h3>" + row["event_title"] + "</h3></a>");
        //            html.Append("<p>" + row["event_description"] + "</p>");
        //            html.Append("<p>" + row["start_time"] + "</p>");
        //            html.Append("<p>" + row["end_time"] + "</p>");
        //            html.Append("<p>" + row["venue"] + "</p>");

        //            html.Append("</div>");
        //        }
        //        displayEvents.Controls.Add(new Literal { Text = html.ToString() });
        //    }
        //    else
        //    {

        //    }
        //}
        //public DataTable sqlquery(string query)
        //{
        //    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //    con.Open();
        //    SqlCommand cmd = new SqlCommand(query, con);
        //    cmd.ExecuteNonQuery();
        //    con.Close();
        //    SqlDataAdapter sda = new SqlDataAdapter(cmd);
        //    DataTable dt = new DataTable();
        //    sda.Fill(dt);
        //    return dt;
        //}
    }
}