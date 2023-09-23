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
    public partial class view_brands : System.Web.UI.Page
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
        protected void fillBrandGrid()
        {
            fnConnectDB();
            sda = new SqlDataAdapter("select * from tbl_brand", con);
            ds = new DataSet();
            sda.Fill(ds);
            gvBrands.DataSource = ds;
            gvBrands.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillBrandGrid();
            }
        }

        protected void gvBrands_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvBrands.EditIndex = e.NewEditIndex;
            fillBrandGrid();
        }

        protected void gvBrands_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvBrands.EditIndex = -1;
            fillBrandGrid();
        }

        protected void gvBrands_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            fnConnectDB();
            GridViewRow row = gvBrands.Rows[e.RowIndex];

            int brand_id = Convert.ToInt32(gvBrands.DataKeys[e.RowIndex].Value);

            string brand_name = (row.Cells[1].Controls[0] as System.Web.UI.WebControls.TextBox).Text;


            cmd = new SqlCommand();
            cmd.CommandText = "UPDATE tbl_brand SET brand_name='" + brand_name + "', WHERE category_id=" + brand_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('Record Updated Successfully...')</script>");
            }
            con.Close();
            gvBrands.EditIndex = -1;
            fillBrandGrid();
        }

        protected void gvBrands_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            fnConnectDB();
            int brand_id = Convert.ToInt32(gvBrands.DataKeys[e.RowIndex].Value);
            cmd = new SqlCommand();
            cmd.CommandText = "delete from tbl_brand WHERE brand_id=" + brand_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('Record Deleted Successfully...')</script>");
            }

            con.Close();
            gvBrands.EditIndex = -1;
            fillBrandGrid();
        }
    }
}