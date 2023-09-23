using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace main_project
{
    public partial class header : System.Web.UI.MasterPage
    {
        SqlConnection con;
        SqlDataAdapter sda;
        SqlCommand cmd;
        DataSet ds;
        SqlDataReader dr;
        protected void fnConnectDB()
        {
            con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\midda\source\repos\main_project\App_Data\heaven_accessories.mdf;Integrated Security=True");
            con.Open();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectDB();
        }

        protected void logout_btn_Click(object sender, EventArgs e)
        {
            Session["user_id"] = null;
            Session["user_name"] = null;
            Session["user_type"] = null;

            Session["alertmessage"] = "Logged out successfully!";
            Session["alertmsgType"] = "success";

            Response.Redirect("~/login_form.aspx");
        }
    }
}