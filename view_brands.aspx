<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="view_brands.aspx.cs" Inherits="main_project.view_brands" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Brands | GamersPoint</title>
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
                    <asp:GridView ID="gvBrands" DataKeyNames="brand_id" runat="server" OnRowEditing="gvBrands_RowEditing" OnRowCancelingEdit="gvBrands_RowCancelingEdit" OnRowUpdating="gvBrands_RowUpdating" OnRowDeleting="gvBrands_RowDeleting" AutoGenerateColumns="False" CellPadding="12" CellSpacing="10" EmptyDataText="No Brands Found">
                        <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="brand_id" ReadOnly="true" />
                            <asp:BoundField HeaderText="Name" DataField="brand_name" />

                            <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />

                        </Columns>
                    </asp:GridView>
                </div>
            </center>
    </body>
    </html>


</asp:Content>
