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
    public partial class deleteFromCart : System.Web.UI.Page
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
            if (!Page.IsPostBack)
            {
                deleteItem();
            }
        }

        protected void deleteItem()
        {
            if (Request.QueryString["pid"] == null || Session["user_id"] == null)
            {
                Session["alertmessage"] = "Access Denied!!!";
                Session["alertmsgType"] = "danger";
                Response.Redirect("login_form.aspx");
            }
            else
            {
                int uid = Convert.ToInt16(Session["user_id"]);
                int pid = Convert.ToInt16(Request.QueryString["pid"]);

                fnConnectDB();
                cmd = new SqlCommand();
                cmd.CommandText = "delete from user_cart where uid="+uid+" AND pid="+pid;
                cmd.Connection = con;

                int res = cmd.ExecuteNonQuery();
                con.Close();
                if (res > 0)
                {
                    Session["alertmessage"] = "Item removed from cart!";
                    Session["alertmsgType"] = "primary";
                    Response.Redirect("mycart.aspx");
                }
                else
                {
                    Session["alertmessage"] = "Error 8924!";
                    Session["alertmsgType"] = "danger";
                    Response.Redirect("mycart.aspx");
                }
            }
        }
    }
}