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
    public partial class login_form : System.Web.UI.Page
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

        }

        protected void btn_login_Click(object sender, EventArgs e)
        {
            fnConnectDB();
            string user_email = txtbox_useremail.Text;
            string user_password = txtbox_userpassword.Text;

            cmd = new SqlCommand("select * from user_data where user_email='"+user_email+"' AND user_password='"+user_password+"'", con);
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                if (user_email == "admin@gamerspoint.com" && user_password == "admin123")
                {
                    Session["user_id"] = Convert.ToInt32(dr[0]);
                    Session["user_name"] = dr["user_name"].ToString();
                    Session["user_type"] = dr["user_type"].ToString();
                    Response.Redirect("admin_dashboard.aspx");
                }
                else
                {
                    Session["user_id"] = Convert.ToInt32(dr[0]);
                    Session["user_name"] = dr["user_name"].ToString();
                    Session["user_type"] = dr["user_type"].ToString();
                    Response.Redirect("profile_page.aspx");
                }
            }
            else
            {
                // MessageBox.Show("User Not Found!","ERROR");
                Session["alertmessage"] = "Invalid deatils! Please try again";
                Session["alertmsgType"] = "danger";
                Response.Redirect("login_form.aspx");
            }
        }
    }
}