<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="view_categories.aspx.cs" Inherits="main_project.view_categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Categories | GamersPoint</title>
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
                    <asp:GridView ID="gvCategories" DataKeyNames="category_id" runat="server" OnRowEditing="gvCategories_RowEditing" OnRowUpdating="gvCategories_RowUpdating" OnRowCancelingEdit="gvCategories_RowCancelingEdit" OnRowDeleting="gvCategories_RowDeleting" AutoGenerateColumns="False" CellPadding="12" CellSpacing="10" EmptyDataText="No Categories Found">
                        <HeaderStyle BackColor="#0033CC" ForeColor="White" />
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="category_id" ReadOnly="true" />
                            <asp:BoundField HeaderText="Name" DataField="category_name" />

                            <asp:CommandField HeaderText="Update" ShowEditButton="true" />
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />

                        </Columns>
                    </asp:GridView>
                </div>
            </center>
    </body>
    </html>


</asp:Content>
