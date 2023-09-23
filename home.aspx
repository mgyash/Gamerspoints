<%@ Page  Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="main_project.home" %>

<% @Import Namespace="System" %>
<% @Import Namespace="System.Collections.Generic" %>
<% @Import Namespace="System.Linq" %>
<% @Import Namespace="System.Web" %>
<% @Import Namespace="System.Web.UI" %>
<% @Import Namespace="System.Web.UI.WebControls" %>
<% @Import Namespace="System.Data" %>
<% @Import Namespace="System.Data.SqlClient" %>
<% @Import Namespace="System.Windows.Forms" %>


<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Home | GamersPoint</title>
        <link rel="icon" style="height: max-content; width: max-content;" type="image/png" href="projectImages/gp-website-favicon-black.png" />
        <style>
            .custom-navbar-bg {
                background-color: darkblue !important;
                color: white !important;
            }

            .custom-bg-atc {
                background-color: darkblue !important;
            }

            .product-card:hover {
                background: #f6f6f6;
                cursor: pointer;
            }

            .card {
                border: 1px solid darkblue !important;
            }

        </style>
    </head>
    <body>

            <!--container fluid starts-->
            <div class="container-fluid">

                <!--for displaying message-->
                <%

                    if (Session["alertmessage"] != null)
                    {
                        string alertmessage = Session["alertmessage"].ToString();
                        string alertmsgType = Session["alertmsgType"].ToString();
                %>
                <div class="alert alert-<%=alertmsgType%> alert-dismissible fade show mt-3" role="alert">
                    <strong><%=alertmessage%> </strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <% 
                        Session["alertmessage"] = null;
                        Session["alertmsgType"] = null;
                    }
                %>

                <!--main row starts-->
                <div class="row mt-3 mx-2">

                    <!--show categories starts -->
                    <div class="col-md-2">
                        <div class="list-group mt-4">
                            <a href="home.aspx" class="list-group-item list-group-item-action active" aria-current="true">All Products
                            </a>
                            <%          
                                // Label lbl_totalcartitems = (Label)Master.FindControl("lbl_totalcartitems");
                                // lbl_totalcartitems.Text = "5"; 
                                SqlConnection con1 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\midda\source\repos\main_project\App_Data\heaven_accessories.mdf;Integrated Security=True");
                                SqlDataReader dr1;
                                con1.Open();
                                SqlCommand cmd1 = new SqlCommand("select * from tbl_category", con1);
                                dr1 = cmd1.ExecuteReader();

                                while (dr1.Read())
                                {
                            %>
                            <a href="home.aspx?pcatid=<%= dr1["category_id"] %>" class="list-group-item list-group-item-action"><%= dr1["category_name"] %>  </a>
                            <%   
                                }
                                con1.Close();
                            %>
                        </div>
                    </div>
                    <!--show categories ends -->


                    <!--show products starts-->
                    <div class="col-md-10" >

                        <!--row starts-->
                        <div class="row mt-3">

                            <!--traversing products-->
                            <% 

                                SqlConnection con2 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\midda\source\repos\main_project\App_Data\heaven_accessories.mdf;Integrated Security=True");
                                SqlDataReader dr2;
                                con2.Open();
                                SqlCommand cmd2;

                                if (Request.QueryString["pcatid"] == null)
                                {
                                    cmd2 = new SqlCommand("select * from tbl_product", con2);
                                }
                                else
                                {
                                    int pcatid = Convert.ToInt16(Request.QueryString["pcatid"]);
                                    cmd2 = new SqlCommand("select * from tbl_product where product_category_id=" + pcatid, con2);
                                }

                                dr2 = cmd2.ExecuteReader();

                                // if category has no products 
                                if (!dr2.HasRows)
                                {
                                    %>
                                        <div class="container mt-1">
                                            <h2 class="fs-3 fw-bold" >No Products in this Category!</h2>
                                        </div>
                                    <%
                                }
                                else
                                {
                                    while (dr2.Read())
                                    {
                            %>

                            <!--product card which is repeating-->
                            <div class="card mb-2 mt-2 p-0 product-card col-md-3 mx-3 text-center container">

                                <div class="container" onclick="window.location='product.aspx?pid=<%= dr2["product_id"] %>'">
                                    <img id="pimg" style="width:200px; height:200px; object-fit:contain;"  alt="Image not found!" class="card-img-top my-2 img-fluid" src='<%=dr2["product_image"].ToString()%>' />
                                </div>

                                <div class="card-body" onclick="window.location='product.aspx?pid=<%= dr2["product_id"] %>'">
                                    <h5 class="card-title"><%= dr2["product_name"] %> </h5>
                                </div>

                                <div class="card-footer">
                                    <a ID="atc_btn" href="page1.aspx?pid=<%=dr2["product_id"]%>" class="btn custom-bg-atc text-white" >Add to Cart</a>
                                    <button class="btn btn-outline-success ">&#8377;<%= dr2["product_price"] %> </button>
                                </div>

                            </div>
                            <%     
                                    }
                                }
                                con2.Close();
                            %>

                            

                        </div>
                        <!--row ends-->

                    </div>
                    <!--show products ends-->

                </div>
                <!--main row ends-->

            </div>
            <!--container fluid ends-->



            <asp:Repeater ID="rpt_product" runat="server">
                <ItemTemplate>
                    <table class="">
                        <tr>
                            <td>Name: </td>
                            <td>
                                <asp:Label ID="lbl_pname" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Description: </td>
                            <td>
                                <asp:Label ID="lbl_pdesc" runat="server" Text='<%# Eval("product_description") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Price: </td>
                            <td>
                                <asp:Label ID="lbl_pprice" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Image: </td>
                            <td>
                                <asp:Image ID="img_product" AlternateText="No Image Found" Height="100px" Width="100px" runat="server" ImageUrl='<%# Eval("product_image") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:Repeater>

            <hr />

            <asp:DataList ID="dlist_product" runat="server" RepeatDirection="Horizontal" RepeatColumns="3" CellPadding="5" CellSpacing="5">
                <ItemTemplate>
                    <table class="auto-style1">
                        <tr>
                            <td>Name: </td>
                            <td>
                                <asp:Label ID="lbl_pname" runat="server" Text='<%# Eval("product_name") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Description: </td>
                            <td>
                                <asp:Label ID="lbl_pdesc" runat="server" Text='<%# Eval("product_description") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Price: </td>
                            <td>
                                <asp:Label ID="lbl_pprice" runat="server" Text='<%# Eval("product_price") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>Image: </td>
                            <td>
                                <asp:Image ID="img_product" AlternateText="No Image Found" Height="100px" Width="100px" runat="server" ImageUrl='<%# Eval("product_image") %>' />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>

    </body>
    </html>


</asp:Content>
