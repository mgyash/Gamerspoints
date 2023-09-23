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
    public partial class page1 : System.Web.UI.Page
    {
        SqlConnection con;
        SqlDataAdapter sda;
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
                addToCart();
            }
        }

        protected Boolean userHasProductsInCart()
        {
            int uid = Convert.ToInt16(Session["user_id"]);
            fnConnectDB();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from user_cart where uid="+uid;
            cmd.Connection = con;
            int c = Convert.ToInt16(cmd.ExecuteScalar());
            if (c > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        // Add to Cart STARTS
        protected void addToCart() 
        {
            if (Session["user_id"] == null)
            {
                Session["alertmessage"] = "To add items to the cart, you must login!";
                Session["alertmsgType"] = "warning";
                Response.Redirect("home.aspx");
            }
            else 
            {

                int uid = Convert.ToInt16(Session["user_id"]);
                int pid = Convert.ToInt16(Request.QueryString["pid"]);
                int pqty;


                
                    fnConnectDB();
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = "select pqty from user_cart where uid=" + uid + " AND pid=" + pid + "";
                    cmd1.Connection = con;
                    int pq = Convert.ToInt16(cmd1.ExecuteScalar());
                    con.Close();

                    if (pq > 0)
                    {
                        pqty = pq + 1;
                        fnConnectDB();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "update user_cart set pqty="+pqty+" where uid="+uid+" AND pid="+pid;
                        cmd.Connection = con;
                        int res = cmd.ExecuteNonQuery();
                        if (res > 0)
                        {
                            Session["alertmessage"] = "Item Quantity Increased!";
                            Session["alertmsgType"] = "primary";
                            Response.Redirect("home.aspx");
                        }
                        else
                        {
                            con.Close();
                            Response.Redirect("login_form.aspx");
                        }

                    }
                    else
                    {
                        pqty = 1;
                        fnConnectDB();
                        SqlCommand cmd = new SqlCommand();
                        cmd.CommandText = "insert into user_cart(uid,pid,pqty) values(" + uid + "," + pid + "," + pqty + ")";
                        cmd.Connection = con;
                        int res = cmd.ExecuteNonQuery();
                        if (res > 0)
                        {
                            Session["alertmessage"] = "Item Added To Cart!";
                            Session["alertmsgType"] = "primary";
                            Response.Redirect("home.aspx");
                        }
                        else
                        {
                            con.Close();
                            Response.Redirect("login_form.aspx");
                        }

                    }                
            }
        }
        // Add to Cart ENDS



    }
}