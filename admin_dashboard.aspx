<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="admin_dashboard.aspx.cs" Inherits="main_project.admin_dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Admin | GamersPoint</title>
        <style>
            body {
                background-image: url("projectImages/home-bg3.jpg");
                background-size: cover;
            }
        </style>
        <link rel="icon" style="height: max-content; width: max-content;" type="image/png" href="projectImages/gp-website-favicon-black.png" />
    </head>
    <body>

            <!-- Checking if admin is logged in or not -->
            <%
                if (Session["user_id"] == null)
                {
                    Session["alertmessage"] = "Please login first!";
                    Session["alertmsgType"] = "warning";
                    Response.Redirect("login_form.aspx");
                }
                else if (Session["user_type"].ToString() == "normal")
                {
                    Session["alertmessage"] = "Access Denied!";
                    Session["alertmsgType"] = "danger";
                    Response.Redirect("home.aspx");
                }

            %>    



            <!-- Container Div Starts -->
            <div class="container">

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


                <!--first row-->

                <div class="row mt-3">

                    <!--first col-->
                    <div class="col-md-3">
                        <a href="view_users.aspx" style="text-decoration: none">
                            <div class="card bg-dark">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/user.png" alt="..." />
                                    </div>
                                    <h1 class="mt-2 text-light">
                                        <asp:Label ID="lbl_users" runat="server" Text="0"></asp:Label>
                                    </h1>
                                    <h1 class=" text-light mt-2" style="color: white;">Users</h1>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!--second col-->
                    <div class="col-md-3">
                        <a href="view_categories.aspx" style="text-decoration: none">
                            <div class="card bg-dark ">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/category.png" alt="..." />
                                    </div>
                                    <h1 class="mt-2 text-light ">
                                        <asp:Label ID="lbl_categories" runat="server" Text="0"></asp:Label>
                                    </h1>
                                    <h1 class="text-light mt-2">Categories</h1>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!--third col-->
                    <div class="col-md-3">
                        <a href="view_brands.aspx" style="text-decoration: none">
                            <div class="card bg-dark ">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/brand2.png" alt="..." />
                                    </div>
                                    <h1 class="mt-2 text-light ">
                                        <asp:Label ID="lbl_brand" runat="server" Text="0"></asp:Label>
                                    </h1>
                                    <h1 class="text-light mt-2">Brands</h1>
                                </div>
                            </div>
                        </a>
                    </div>

                    <!--fourth col-->
                    <div class="col-md-3">
                        <a href="view_products.aspx" style="text-decoration: none">
                            <div class="card bg-dark " style="cursor: pointer;" data-bs-target="~/view_products.aspx">
                                <div class="card-body text-center">
                                    <div class="container">
                                        <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/product.png" alt="..." />
                                    </div>
                                    <h1 class="mt-2 text-light ">
                                        <asp:Label ID="lbl_product" runat="server" Text="0"></asp:Label>
                                    </h1>
                                    <h1 class="text-light mt-2">Products</h1>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- ---------------------------------------------------------------------------- -->

                <!--second row-->
                <div class="row mt-3">

                    <!--first col-->
                    <div class="col-md-6">
                        <div class="card" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#add-category-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/newcategory.png" alt="..." />
                                </div>
                                <h1 class="text-muted mt-4">Add New Category</h1>
                            </div>
                        </div>
                    </div>

                    <!--second col-->
                    <div class="col-md-6">
                        <div class="card" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#add-brand-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/game-controller.png" alt="..." />
                                </div>
                                <h1 class="text-muted mt-4">Add New Brand</h1>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- ---------------------------------------------------------------------------- -->

                <!--third row-->
                <div class="row mt-3 mb-3">

                    <!--first col-->
                    <div class="col-md-12">
                        <div class="card" style="cursor: pointer;" data-bs-toggle="modal" data-bs-target="#add-product-modal">
                            <div class="card-body text-center">
                                <div class="container">
                                    <asp:Image runat="server" Width="130px" class="card-img-top img-fluid" ImageUrl="~/projectImages/newproduct.png" alt="..." />
                                </div>
                                <h1 class="text-muted mt-4">Add New Product</h1>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
            <!-- Container Div Ends -->



            <!--Modals-->

            <!--starting add brand modal-->
            <!-- Modal -->
            <div class="modal fade" id="add-brand-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header custom-bg ">
                            <h5 class="modal-title" id="exampleModalLabelBrand">Fill Brand Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <asp:TextBox class="form-control" placeholder="Enter brand name" ID="txtbox_brandname" runat="server"></asp:TextBox>
                            </div>

                            <div class="container text-center mt-4">
                                <asp:Button ID="btn_add_brand" runat="server" class="btn btn-outline-success" Text="Add Brand" OnClick="btn_add_brand_Click" />
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--ending add brand modal-->


            <!--starting add category modal-->
            <!-- Modal -->
            <div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabelCategory" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header custom-bg ">
                            <h5 class="modal-title" id="exampleModalLabelCategory">Fill Category Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <asp:TextBox class="form-control" placeholder="Enter category name" ID="txtbox_categoryname" runat="server"></asp:TextBox>
                            </div>

                            <div class="container text-center mt-4">
                                <asp:Button ID="btn_add_category" runat="server" class="btn btn-outline-success" Text="Add Category" OnClick="btn_add_category_Click" />
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--ending add category modal-->


            <!--starting add product modal-->
            <!-- Modal -->
            <div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header custom-bg ">
                            <h5 class="modal-title" id="exampleModalLabelProduct">Fill Product Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <asp:TextBox class="form-control" placeholder="Enter Product name" ID="txtbox_productname" runat="server"></asp:TextBox>
                                <br />
                                <textarea id="txtarea_productdescription" class="form-control" placeholder="Enter Product Description" runat="server" cols="20" rows="2"></textarea>
                                <br />
                                <asp:TextBox class="form-control" placeholder="Enter Product Price" TextMode="Number" ID="txtbox_productprice" runat="server"></asp:TextBox>
                                <br />
                                <asp:Label ID="lbl_productimage" runat="server" Text="Select Product Image: "></asp:Label>
                                <br />
                                <asp:FileUpload class="form-control" ID="fupl_productimage" runat="server" />
                                <br />
                                <asp:Label ID="lbl_productcategory" runat="server" Text="Select Category: "></asp:Label>
                                <asp:DropDownList class="form-control" ID="ddl_productcategory" runat="server"></asp:DropDownList>
                                <br />
                                <asp:Label ID="lbl_productbrand" runat="server" Text="Select Brand: "></asp:Label>
                                <asp:DropDownList class="form-control" ID="ddl_productbrand" runat="server"></asp:DropDownList>
                            </div>
                            <div class="container text-center mt-4">
                                <asp:Button ID="btn_add_product" runat="server" class="btn btn-outline-success" Text="Add Product" OnClick="btn_add_product_Click" />
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--ending add product modal-->

    </body>
    </html>


</asp:Content>
