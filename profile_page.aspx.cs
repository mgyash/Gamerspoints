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
    public partial class profile_page : System.Web.UI.Page
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
            if (Session["user_id"] != null)
            {
                int user_id = Convert.ToInt32(Session["user_id"]);
                string user_name = Session["user_name"].ToString();
                lbl_user_name.Text = "Welcome "+user_name;
                
                fnConnectDB();
                cmd = new SqlCommand("select * from user_data where user_id="+user_id,con);
                dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    user_image.ImageUrl = dr["user_picture"].ToString();
                }
                con.Close();

                fnConnectDB();
                sda = new SqlDataAdapter("select * from user_data where user_id = " + user_id, con);
                ds = new DataSet();
                sda.Fill(ds);
                gv_user_profile.DataSource = ds;
                gv_user_profile.DataBind();
                con.Close();
            }
            else
            {
                // MessageBox.Show("Please login first!","ERROR");
                Session["alertmessage"] = "Please login first!";
                Session["alertmsgType"] = "warning";
                Response.Redirect("~/login_form.aspx");
            }
        }

        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("~/login_form.aspx");
        }
    }
}