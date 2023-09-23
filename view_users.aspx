<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="view_users.aspx.cs" Inherits="main_project.view_users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Users | GamersPoint</title>
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
                    <h1>All Users</h1>
                    <br />
                    <br />
                    <asp:GridView ID="gvUsers" DataKeyNames="user_id" CellPadding="5" OnRowDeleting="gvUsers_RowDeleting" CellSpacing="5" BorderWidth="2px" BorderColor="SteelBlue" BorderStyle="Solid" Font-Italic="true" HeaderStyle-BackColor="Wheat" RowStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" Width="1000px">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="user_id" />
                            <asp:BoundField HeaderText="Name" DataField="user_name" />
                            <asp:BoundField HeaderText="Email" DataField="user_email" />
                            <asp:BoundField HeaderText="Password" DataField="user_password" />
                            <asp:BoundField HeaderText="Phone" DataField="user_phone" />
                            <asp:BoundField HeaderText="State" DataField="state_name" />
                            <asp:BoundField HeaderText="City" DataField="city_name" />
                            <asp:BoundField HeaderText="Address" DataField="user_address" />
                            <asp:BoundField HeaderText="Type" DataField="user_type" />
                            <asp:ImageField DataImageUrlField="user_picture" ItemStyle-HorizontalAlign="Center" NullDisplayText="Image not found!" HeaderText="Image" ControlStyle-Height="100px" ControlStyle-Width="100px"></asp:ImageField>
                            <asp:CommandField HeaderText="Delete" ShowDeleteButton="true" />
                        </Columns>
                    </asp:GridView>
                </div>
            </center>
    </body>
    </html>


</asp:Content>
