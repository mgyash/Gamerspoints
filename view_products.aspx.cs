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
    public partial class view_products : System.Web.UI.Page
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

        protected void fillProductGrid()
        {
            fnConnectDB();
            sda = new SqlDataAdapter("select product_id,product_name,product_description,product_price,product_image,category_name,brand_name from tbl_product,tbl_category,tbl_brand where tbl_product.product_category_id=tbl_category.category_id AND tbl_product.product_brand_id=tbl_brand.brand_id ", con);
            ds = new DataSet();
            sda.Fill(ds);
            gvProducts.DataSource = ds;
            gvProducts.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillProductGrid();
            }
        }

        protected void gvProducts_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            fillProductGrid();

            int ni = gvProducts.EditIndex;

            fnConnectDB();
            GridViewRow row1 = gvProducts.Rows[ni];
            DropDownList cat1 = gvProducts.Rows[ni].FindControl("ddl_category") as DropDownList;
            cmd = new SqlCommand("select * from tbl_category", con);
            cat1.DataSource = cmd.ExecuteReader();
            cat1.DataTextField = "category_name";
            cat1.DataValueField = "category_id";
            cat1.DataBind();
            con.Close();

            fnConnectDB();
            GridViewRow row2 = gvProducts.Rows[ni];
            DropDownList brand1 = gvProducts.Rows[ni].FindControl("ddl_brand") as DropDownList;
            cmd = new SqlCommand("select * from tbl_brand", con);
            brand1.DataSource = cmd.ExecuteReader();
            brand1.DataTextField = "brand_name";
            brand1.DataValueField = "brand_id";
            brand1.DataBind();
            con.Close();
        }

        protected void gvProducts_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {

            fnConnectDB();
            GridViewRow row = gvProducts.Rows[e.RowIndex];
            
            int product_id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);

            string product_name = (row.Cells[1].Controls[0] as System.Web.UI.WebControls.TextBox).Text;
            string product_description = (row.Cells[2].Controls[0] as System.Web.UI.WebControls.TextBox).Text;
            decimal product_price = Convert.ToDecimal((row.Cells[3].Controls[0] as System.Web.UI.WebControls.TextBox).Text);

            DropDownList cat1 = gvProducts.Rows[e.RowIndex].FindControl("ddl_category") as DropDownList;
            int cat2 = Convert.ToInt16(cat1.SelectedValue);
            
            DropDownList brand1 = gvProducts.Rows[e.RowIndex].FindControl("ddl_brand") as DropDownList;
            int brand2 = Convert.ToInt16(brand1.SelectedValue);


            // UPDATE CODE 

            cmd = new SqlCommand();
            cmd.CommandText = "UPDATE tbl_product SET product_name='" + product_name + "', product_description='" + product_description + "', product_price=" + product_price + ", product_category_id=" + cat2 + ", product_brand_id=" + brand2 + " WHERE product_id=" + product_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('Record Updated Successfully...')</script>");
            }
            con.Close();
            gvProducts.EditIndex = -1;
            fillProductGrid();
        }

        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            fillProductGrid();
        }

        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            fnConnectDB();
            int product_id = Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value);
            cmd = new SqlCommand();
            cmd.CommandText = "delete from tbl_product WHERE product_id=" + product_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('Record Deleted Successfully...')</script>");
            }

            con.Close();
            gvProducts.EditIndex = -1;
            fillProductGrid();
        }
    }
}