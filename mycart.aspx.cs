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
    public partial class mycart : System.Web.UI.Page
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

        protected void checkUserLogin()
        {
            if (Session["user_id"] == null)
            {
                Session["alertmessage"] = "Please login to see your cart!";
                Session["alertmsgType"] = "warning";
                Response.Redirect("login_form.aspx");
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            checkUserLogin();
            fillCartTable();
        }
        protected void fillCartTable()
        {
            int uid = Convert.ToInt16(Session["user_id"]);
            fnConnectDB();
            cmd = new SqlCommand();
            cmd.CommandText = "select * from tbl_product, user_cart where tbl_product.product_id=user_cart.pid AND user_cart.uid=" + uid;
            cmd.Connection = con;

            int grandTotal = 0;

            dr = cmd.ExecuteReader();

            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    TableCell cell1 = new TableCell();
                    TableCell cell2 = new TableCell();
                    TableCell cell3 = new TableCell();
                    TableCell cell4 = new TableCell();
                    TableCell cell5 = new TableCell();
                    TableCell cell6 = new TableCell();

                    TableRow row = new TableRow();

                    int pp = Convert.ToInt16(dr["product_price"]);
                    int pq = Convert.ToInt16(dr["pqty"]);
                    int totalPrice = pp * pq;

                    grandTotal += totalPrice;

                    cell1.Text = dr["product_name"].ToString();
                    cell2.Text = dr["product_price"].ToString();
                    cell3.Text = dr["pqty"].ToString();
                    cell4.Text = (totalPrice).ToString();

                    Image img = new Image();
                    img.Width = 100;
                    img.Height = 100;
                    img.ImageUrl = dr["product_image"].ToString();
                    cell5.Controls.Add(img);

                    /*
                    LinkButton linkButton = new LinkButton();
                    linkButton.PostBackUrl = "deleteFromCart.aspx?pid=" + dr["product_id"];
                    linkButton.Text = "Remove";
                    //linkButton.BackColor = System.Drawing.Color.Red;
                    //linkButton.ForeColor = System.Drawing.Color.White;
                    linkButton.Attributes.Add("class", "btn btn-danger");
                    cell6.Controls.Add(linkButton);
                    */


                    /*
                    System.Web.UI.WebControls.Button button = new System.Web.UI.WebControls.Button();
                    button.Click = deleteFromCart(Convert.ToInt16(dr["product_id"]));
                    */


                    HyperLink deletelink = new HyperLink();
                    deletelink.NavigateUrl = "deleteFromCart.aspx?pid=" + dr["product_id"];
                    deletelink.Text = "Remove";
                    deletelink.Attributes.Add("class", "btn btn-danger");
                    cell6.Controls.Add(deletelink);


                    row.Cells.Add(cell1);
                    row.Cells.Add(cell2);
                    row.Cells.Add(cell3);
                    row.Cells.Add(cell4);
                    row.Cells.Add(cell5);
                    row.Cells.Add(cell6);

                    mycarttable.Rows.Add(row);
                }

                TableFooterRow tableFooterRow = new TableFooterRow();
                TableRow tableRow = new TableRow();
                TableCell cellGT = new TableCell();
                TableCell cellGTP = new TableCell();

                cellGT.Text = "Grand Total";
                cellGT.Attributes.Add("class", "fs-5 fw-bold");
                cellGT.ColumnSpan = 5;

                cellGTP.Text = "₹" + grandTotal.ToString();
                cellGTP.Attributes.Add("class", "fs-5 fw-bold");

                tableFooterRow.Cells.Add(cellGT);
                tableFooterRow.Cells.Add(cellGTP);
                mycarttable.Rows.Add(tableFooterRow);
            }
            else 
            {
                TableCell emptyCell = new TableCell();
                TableRow emptyRow = new TableRow();

                emptyCell.Text = "<h2>Your cart is currently empty!! Continue shopping to add more products into your Cart<h2>";
                emptyCell.ColumnSpan = 6;

                emptyRow.Cells.Add(emptyCell);
                mycarttable.Rows.Add(emptyRow);

                Response.Write("<script> $('.order-btn').addClass('disabled'); </script>");

            }
        }
    }
}