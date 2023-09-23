<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="view_products.aspx.cs" Inherits="main_project.view_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Products | GamersPoint</title>
        <link rel="icon" style="height: max-content; width: max-content;" type="image/png" href="projectImages/gp-website-favicon-black.png" />
        <style>
            .gvProductsEditRow input[type=text] {
                width: 150px;
            }

            .gvProductsEditRow select {
                width: 100px;
            }
        </style>
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

            <center>
                <div class="col-md-10 mt-3 mb-3">
                    <asp:GridView ID="gvProducts" DataKeyNames="product_id" OnRowDeleting="gvProducts_RowDeleting" OnRowCancelingEdit="gvProducts_RowCancelingEdit" OnRowEditing="gvProducts_RowEditing" OnRowUpdating="gvProducts_RowUpdating" runat="server" AutoGenerateColumns="False" CellPadding="12" CellSpacing="10" EmptyDataText="No Products Found" PageSize="3">
                        <EditRowStyle CssClass="gvProductsEditRow" />

                        <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="product_id" ReadOnly="true" />
                            <asp:BoundField HeaderText="Name" DataField="product_name" />
                            <asp:BoundField HeaderText="Description" DataField="product_description" />
                            <asp:BoundField HeaderText="Price" DataField="product_price" />

                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_category" runat="server" Text='<%# Bind("category_name") %>'>  
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_category" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Brand">
                                <ItemTemplate>
                                    <asp:Label ID="lbl_brand" runat="server" Text='<%# Bind("brand_name") %>'>  
                                    </asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddl_brand" runat="server">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:ImageField DataImageUrlField="product_image" NullDisplayText="No Image" HeaderText="Image" ControlStyle-Height="150px" ControlStyle-Width="150px">
                                <ControlStyle Height="150px" Width="150px"></ControlStyle>
                            </asp:ImageField>
                            <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />



                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle Font-Bold="False" Font-Italic="False" Font-Size="X-Large" ForeColor="#FF3300" HorizontalAlign="Center" />
                    </asp:GridView>
                </div>
            </center>

    </body>
    </html>


</asp:Content>
