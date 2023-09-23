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
    public partial class view_categories : System.Web.UI.Page
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
        protected void fillCategoryGrid()
        {
            fnConnectDB();
            sda = new SqlDataAdapter("select * from tbl_category", con);
            ds = new DataSet();
            sda.Fill(ds);
            gvCategories.DataSource = ds;
            gvCategories.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                fillCategoryGrid();
            }
        }

        protected void gvCategories_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvCategories.EditIndex = e.NewEditIndex;
            fillCategoryGrid();
        }

        protected void gvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            fnConnectDB();
            GridViewRow row = gvCategories.Rows[e.RowIndex];

            int category_id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);

            string category_name = (row.Cells[1].Controls[0] as System.Web.UI.WebControls.TextBox).Text;


            cmd = new SqlCommand();
            cmd.CommandText = "UPDATE tbl_category SET category_name='" + category_name + "', WHERE category_id=" + category_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('Record Updated Successfully...')</script>");
            }
            con.Close();
            gvCategories.EditIndex = -1;
            fillCategoryGrid();
        }

        protected void gvCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvCategories.EditIndex = -1;
            fillCategoryGrid();
        }

        protected void gvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            fnConnectDB();
            int category_id = Convert.ToInt32(gvCategories.DataKeys[e.RowIndex].Value);
            cmd = new SqlCommand();
            cmd.CommandText = "delete from tbl_category WHERE category_id=" + category_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('Record Deleted Successfully...')</script>");
            }

            con.Close();
            gvCategories.EditIndex = -1;
            fillCategoryGrid();
        }
    }
}