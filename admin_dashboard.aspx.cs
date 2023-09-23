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
    public partial class admin_dashboard : System.Web.UI.Page
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
            if(!Page.IsPostBack)
            {
                getUserCount();
                getCategoryCount();
                getBrandCount();
                getProductCount();
                fillCategoryDD();
                fillBrandDD();
            }
        }

        protected void getUserCount() 
        {
            fnConnectDB();
            cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from user_data where user_type='normal'";
            cmd.Connection = con;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lbl_users.Text = dr[0].ToString();
            }
            con.Close();
        }
        protected void getCategoryCount()
        {
            fnConnectDB();
            cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from tbl_category";
            cmd.Connection = con;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lbl_categories.Text = dr[0].ToString();
            }
            con.Close();
        }
        protected void getBrandCount()
        {
            fnConnectDB();
            cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from tbl_brand";
            cmd.Connection = con;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lbl_brand.Text = dr[0].ToString();
            }
            con.Close();
        }
        protected void getProductCount()
        {
            fnConnectDB();
            cmd = new SqlCommand();
            cmd.CommandText = "select count(*) from tbl_product";
            cmd.Connection = con;
            dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lbl_product.Text = dr[0].ToString();
            }
            con.Close();
        }
        protected void fillCategoryDD()
        {
            fnConnectDB();
            cmd = new SqlCommand("select * from tbl_category",con);            
            ddl_productcategory.DataSource = cmd.ExecuteReader();
            ddl_productcategory.DataTextField = "category_name";
            ddl_productcategory.DataValueField = "category_id";
            ddl_productcategory.DataBind();
            con.Close();
        }

        protected void fillBrandDD()
        {
            fnConnectDB();
            cmd = new SqlCommand("select * from tbl_brand", con);
            ddl_productbrand.DataSource = cmd.ExecuteReader();
            ddl_productbrand.DataTextField = "brand_name";
            ddl_productbrand.DataValueField = "brand_id";
            ddl_productbrand.DataBind();
            con.Close();
        }
        protected void btn_add_brand_Click(object sender, EventArgs e)
        {
            fnConnectDB();
            string brand_name = txtbox_brandname.Text;
            cmd = new SqlCommand("insert into tbl_brand(brand_name) values('"+brand_name+"')",con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Session["alertmessage"] = "Brand Added Successfully!";
                Session["alertmsgType"] = "success";
                Response.Redirect("admin_dashboard.aspx");
                // MessageBox.Show("Brand Added Successfully!", "Success");
            }
            else 
            {
                Session["alertmessage"] = "Something went wrong!";
                Session["alertmsgType"] = "danger";
                Response.Redirect("admin_dashboard.aspx");
                // MessageBox.Show("Something went wrong!", "ERROR");
            }
            con.Close();
            fillCategoryDD();
            fillBrandDD();
        }

        
        protected void btn_add_category_Click(object sender, EventArgs e)
        {
            fnConnectDB();
            string category_name = txtbox_categoryname.Text;
            cmd = new SqlCommand("insert into tbl_category(category_name) values('" + category_name + "')", con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                // MessageBox.Show("Category Added Successfully!", "Success");
                Session["alertmessage"] = "Category Added Successfully!";
                Session["alertmsgType"] = "success";
                Response.Redirect("admin_dashboard.aspx");
            }
            else
            {
                // MessageBox.Show("Something went wrong!", "ERROR");
                Session["alertmessage"] = "Something went wrong!";
                Session["alertmsgType"] = "danger";
                Response.Redirect("admin_dashboard.aspx");
            }
            con.Close();
            fillCategoryDD();
            fillBrandDD();
        }

        protected void btn_add_product_Click(object sender, EventArgs e)
        {
            fnConnectDB();

            string product_name = txtbox_productname.Text;
            string product_description = txtarea_productdescription.InnerText;
            decimal product_price = Convert.ToDecimal(txtbox_productprice.Text);
            string product_image = "~/prodimgs/" +fupl_productimage.FileName;
            int pcid = Convert.ToInt32(ddl_productcategory.SelectedValue);
            int pbid = Convert.ToInt32(ddl_productbrand.SelectedValue);


            cmd = new SqlCommand("insert into tbl_product values('"+product_name+"','"+product_description+"',"+product_price+",'"+product_image+"',"+pcid+","+pbid+")", con);
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                // MessageBox.Show("Product Added Successfully!", "Success");
                fupl_productimage.SaveAs(Server.MapPath(product_image));
                Session["alertmessage"] = "Product Added Successfully!";
                Session["alertmsgType"] = "success";
                Response.Redirect("admin_dashboard.aspx");
            }
            else
            {
                Session["alertmessage"] = "Something went wrong!";
                Session["alertmsgType"] = "danger";
                Response.Redirect("admin_dashboard.aspx");
                // MessageBox.Show("Something went wrong!", "ERROR");
            }
            con.Close();
            fillCategoryDD();
            fillBrandDD();
        }
    }
}