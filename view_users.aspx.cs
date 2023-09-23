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
    public partial class view_users : System.Web.UI.Page
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

        protected void fillUserGrid()
        {
            fnConnectDB();
            cmd = new SqlCommand("select * from user_data, tbl_state, tbl_city where user_data.user_state=tbl_state.state_id AND user_data.user_city=tbl_city.city_id", con);
            sda = new SqlDataAdapter(cmd);
            ds = new DataSet();
            sda.Fill(ds);
            gvUsers.DataSource = ds;
            gvUsers.DataBind();
            con.Close();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            { 
                fillUserGrid();
            }
        }

        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            fnConnectDB();
            int user_id = Convert.ToInt32(gvUsers.DataKeys[e.RowIndex].Value);
            cmd = new SqlCommand();
            cmd.CommandText = "delete from user_data WHERE user_id=" + user_id;
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();

            if (i > 0)
            {
                Response.Write("<script> alert('User Deleted Successfully...')</script>");
            }

            con.Close();
            gvUsers.EditIndex = -1;
            fillUserGrid();
        }
    }
}