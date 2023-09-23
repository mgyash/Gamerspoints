<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="product.aspx.cs" Inherits="main_project.product" %>

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

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>View Product | GamersPoint</title>
        <link rel="icon" style="height: max-content; width: max-content;" type="image/png" href="projectImages/gp-website-favicon-black.png" />
        <style>
            .custom-bg-atc {
                background-color: darkblue !important;
            }
        </style>
    </head>
    <body>

        <% 
            if (Request.QueryString["pid"] == null)
            {
                Response.Redirect("home.aspx");
            }
        %>

            <!--container div STARTS-->
            <div class="container">

                <!--row STARTS-->
                <div class="row  mt-3">


                    <%          
                        int pid = Convert.ToInt16(Request.QueryString["pid"]);
                        SqlConnection con1 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\midda\source\repos\main_project\App_Data\heaven_accessories.mdf;Integrated Security=True");
                        SqlDataReader dr1;
                        con1.Open();
                        SqlCommand cmd1 = new SqlCommand("select * from tbl_product where product_id=" + pid, con1);
                        dr1 = cmd1.ExecuteReader();

                        while (dr1.Read())
                        {
                    %>


                    <!--first part of page left side STARTS-->
                    <div class="col-md-6">

                        <!--card-->
                        <div class="card border-0">
                            <div class="card-body ">
                                <div class="text-center">
                                    <img src="<%= dr1["product_image"] %>" class="img-fluid" style="max-width: 100%; max-height: 100%;" alt="Image not found!">
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--first part of page left side ENDS-->

                    <!--second part of page right side STARTS-->
                    <div class="col-md-5">

                        <!--card STARTS-->
                        <div class="card border-0">
                            <div class="card-body">
                                <div class="fs-1 mb-3">
                                    <p><%= dr1["product_name"] %> </p>
                                </div>

                                <div class="fs-5 text-muted mt-3">
                                    <p>1 Week Return Policy </p>
                                </div>

                                <div class="my-3">
                                    <p>
                                        <span class="fs-4">Rs.<%= dr1["product_price"] %> </span>
                                    </p>
                                </div>

                                <div class="text-muted fs-6 my-3">
                                    <p>Tax included.</p>
                                </div>


                                <div class="my-4">
                                    <a ID="atc_btn" href="page1.aspx?pid=<%=dr1["product_id"]%>" class="fluid btn custom-bg-atc fs-5 text-white" style="max-width: 100%; max-height: 100%; width: 300px; height: 50px;" >Add to Cart</a>
                                    <!--    
                                    <button class="fluid btn custom-bg-atc fs-5 text-white" style="max-width: 100%; max-height: 100%; width: 300px; height: 50px;">Add to Cart</button>
                                    -->
                                </div>


                                <div class="mt-3">
                                    <p class="fs-3">Description</p>
                                    <p class="fluid" style="max-height: 100%"><%= dr1["product_description"] %></p>
                                </div>

                            </div>
                        </div>
                        <!--card ENDS-->

                    </div>
                    <!--second part of page right side ENDS-->


                    <%   
                        }
                        con1.Close();
                    %>
                </div>
                <!--row ENDS-->

            </div>
            <!--container div ENDS-->

    </body>
    </html>


</asp:Content>
