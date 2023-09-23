<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testpage.aspx.cs" Inherits="main_project.testpage" %>

<% @Import Namespace="System" %>
<% @Import Namespace="System.Collections.Generic" %>
<% @Import Namespace="System.Linq" %>
<% @Import Namespace="System.Web" %>
<% @Import Namespace="System.Web.UI" %>
<% @Import Namespace="System.Web.UI.WebControls" %>
<% @Import Namespace="System.Data" %>
<% @Import Namespace="System.Data.SqlClient" %>
<% @Import Namespace="System.Windows.Forms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">


        <!--show products starts-->
                    <div class="col-md-9">
                        <!--row starts-->
                        <div class="row mt-4">
                            <!--traversing products-->
                            <% 
                                SqlConnection con2 = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\midda\source\repos\main_project\App_Data\heaven_accessories.mdf;Integrated Security=True");
                                con2.Open();
                                SqlDataReader dr2;                                
                                SqlCommand cmd2;

                                cmd2 = new SqlCommand("select * from tbl_product", con2);

                                dr2 = cmd2.ExecuteReader();

                                while (dr2.Read())
                                {

                            %>

                            <!--product card which is repeating-->
                            <div class="card mb-2 mt-2 product-card col-md-3 mx-4 text-center">

                                <div class="container" onclick="window.location='product.aspx?pid=<%= dr2["product_id"] %>'">                                   
                                
                                    <img src='<%=dr2["product_image"].ToString()%>' id="pimg" alt="" height="200" width="200" />
                                 <!-- 
                                    <asp:Image ID="Image1" runat="server" class="card-img-top m-2 img-fluid" AlternateText="Image not found!" Height="150px" Width="150px" />
                                 -->
                                    <%
                                        // pimg.Src = dr2["product_image"].ToString();
                                        // Image1.ImageUrl = dr2["product_image"].ToString();
                                        // Image1.ImageUrl = "/prodimgs/img1.jpg";
                                        // Image1.ImageUrl = ds.Tables[0].Rows[0]["product_image"].ToString();
                                    %>
                                    <h5 class="card-title"> <%= dr2["product_id"] %></h5>
                                    <h5 class="card-title"> <%= Image1.ImageUrl %></h5>
                                </div>

                                <div class="card-body" onclick="window.location='product.aspx?pid=<%= dr2["product_id"] %>'">
                                    <h5 class="card-title"><%= dr2["product_name"] %> </h5>
                                </div>

                                <div class="card-footer">
                                    <asp:Button ID="btn_atc" class="btn custom-bg-atc atc-disabler text-white" runat="server" Text="Add to Cart" />
                                    <%
                                        btn_atc.PostBackUrl = "page1.aspx?pid=";
                                        btn_atc.PostBackUrl += dr2["product_id"];
                                    %>
                                    <button class="btn btn-outline-success ">&#8377;<%= dr2["product_price"] %> </button>
                                </div>
                            </div>
                            <%     
                                }
                                con2.Close();
                            %>
                        </div>
                        <!--row ends-->
                    </div>
                    <!--show products ends-->
    </form>
</body>
</html>
