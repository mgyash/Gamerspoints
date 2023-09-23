
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
    public partial class registration_form : System.Web.UI.Page
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

        protected void fillStateDDL()
        {
            cmd = new SqlCommand("select * from tbl_state", con);
            ddl_state.DataSource = cmd.ExecuteReader();
            ddl_state.DataTextField = "state_name";
            ddl_state.DataValueField = "state_id";
            ddl_state.DataBind();
        }

        protected void fillCityDDL()
        {
            cmd = new SqlCommand("select * from tbl_city where state_id="+ddl_state.SelectedValue, con);
            ddl_city.DataSource = cmd.ExecuteReader();
            ddl_city.DataTextField = "city_name";
            ddl_city.DataValueField = "city_id";
            ddl_city.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                fnConnectDB();
                fillStateDDL();
                con.Close();
            }

        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            string user_name = txtbox_username.Text;
            string user_email = txtbox_emailid.Text;
            string user_password = txtbox_password.Text;
            decimal user_phone = Convert.ToDecimal(txtbox_contactno.Text);
            int user_state = Convert.ToInt32(ddl_state.SelectedValue);
            int user_city = Convert.ToInt32(ddl_city.SelectedValue);
            string user_address = txtarea_address.InnerText;
            string user_picture = "~/uploads/" + FileUpload_picture.FileName;
            string user_type = HiddenField1.Value;

            fnConnectDB();
            cmd = new SqlCommand();
            cmd.CommandText = "insert into user_data values('"+user_name+ "','" + user_email + "','" + user_password + "',"+user_phone+","+user_state+","+user_city+ ",'" + user_address + "','" + user_picture+"', '"+user_type+"')";
            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            FileUpload_picture.SaveAs(Server.MapPath(user_picture));

            if (i > 0)
            {
                MessageBox.Show("Record Inserted Successfully!", "Success");
                Response.Redirect("~/login_form.aspx");
            }
            else 
            {
                MessageBox.Show("Error inserting record !","ERROR");
            }
            con.Close();
            Response.Redirect("registration_form.aspx");
            
        }

        protected void ddl_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            fnConnectDB();
            fillCityDDL();
            con.Close();
        }

        protected void btn_resett_Click(object sender, EventArgs e)
        {
            Response.Redirect("registration_form.aspx");
        }
    }
}