<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="profile_page.aspx.cs" Inherits="main_project.profile_page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>User Profile | GamersPoint</title>
    </head>
    <body>
        <center>
                <h2>User Profile </h2>
                <asp:Image ID="user_image" runat="server" Height="60px" Width="60px" />
                <br />
                <br />
                <asp:Label ID="lbl_user_name" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:GridView ID="gv_user_profile" BorderWidth="2px" BorderColor="SteelBlue" BorderStyle="Solid" Font-Italic="true" HeaderStyle-BackColor="Wheat" RowStyle-HorizontalAlign="Center" runat="server" AutoGenerateColumns="False" Height="151px" Width="1199px">
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="user_id" />
                        <asp:BoundField HeaderText="Name" DataField="user_name" />
                        <asp:BoundField HeaderText="Email" DataField="user_email" />
                        <asp:BoundField HeaderText="Password" DataField="user_password" />
                        <asp:BoundField HeaderText="Phone" DataField="user_phone" />
                        <asp:BoundField HeaderText="State" DataField="user_state" />
                        <asp:BoundField HeaderText="City" DataField="user_city" />
                        <asp:BoundField HeaderText="Address" DataField="user_address" />
                        <asp:ImageField DataImageUrlField="user_picture" ItemStyle-HorizontalAlign="Center" NullDisplayText="Image not found!" HeaderText="Image" ControlStyle-Height="100px" ControlStyle-Width="100px"></asp:ImageField>
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="btn_logout" runat="server" Text="Logout" Height="50px" Width="175px" BackColor="#FFCC66" Font-Size="Large" ForeColor="#009933" OnClick="btn_logout_Click" />
        </center>
    </body>
    </html>

</asp:Content>
