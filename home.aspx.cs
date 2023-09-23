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
    public partial class home : System.Web.UI.Page
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

        protected void getProductList()
        {
            /*
            fnConnectDB();
            cmd = new SqlCommand("select * from tbl_product",con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                rpt_product.DataSource = dr;
                rpt_product.DataBind();
            }
            con.Close();
            */

            /*
            fnConnectDB();
            cmd = new SqlCommand("select * from tbl_product", con);
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dlist_product.DataSource = dr;
                dlist_product.DataBind();
            }
            con.Close();
            */
        }

        protected void fillingImage()
        {
            /*
            fnConnectDB();
            cmd = new SqlCommand("select count(*) from tbl_product", con);
            int prodcount = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();


            con.Open();
            cmd = new SqlCommand("select * from tbl_product",con);
            dr = cmd.ExecuteReader();

            for (int i = 0; i < prodcount; i++)
            {
                while (dr.Read())
                {
                    pimage.ImageUrl = dr["product_image"].ToString();
                }
            }
            */
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
               // fillingImage();
            }
            
        }

        public void addTocart()
        {
            MessageBox.Show("Function Working!");            
        }
        
        protected void addToCart()
        {
            if (Session["user_id"] == null)
            {
                Session["alertmessage"] = "You must be a registered user to add products to the cart!";
                Session["alertmsgType"] = "warning";
                Response.Redirect("login_form.aspx");
            }
            else
            {
                //int uid = Convert.ToInt16(Session["user_id"]);
                //int pid = ppid;
                //int pqty = ppqty;
                MessageBox.Show("Function Working!");
            }
        }
    }
}