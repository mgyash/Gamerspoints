<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="login_form.aspx.cs" Inherits="main_project.login_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Login Page | GamersPoint</title>
        <style type="text/css">
            .auto-style1 {
                width: 369px;
                height: 244px;
            }
        </style>

    </head>
    <body>

        <center>
            <h2>Login Form</h2>
            <div class="auto-style1">

                    <!--for displaying message-->
                    <div class="container">
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
                    </div>

                    <asp:Label ID="lbl_useremail" runat="server" Text="Email ID :" Font-Size="Large"></asp:Label>
                    &nbsp;&nbsp;   
        <asp:TextBox ID="txtbox_useremail" runat="server"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Label ID="lbl_userpassword" runat="server" Text="Password :" Font-Size="Large"></asp:Label>
                    &nbsp;&nbsp;   
        <asp:TextBox ID="txtbox_userpassword" runat="server" TextMode="Password"></asp:TextBox>
                    <br />
                    <br />
                    <asp:Button ID="btn_login" runat="server" Text="Login" BackColor="#000099" Font-Size="Large" ForeColor="#99FF33" Height="50px" OnClick="btn_login_Click" Width="150px" />
                    <br />
                    <br />
                    <asp:Label ID="lbl_question" runat="server" Text="Don't have an account?" Font-Size="Medium"></asp:Label>
                    <br />
                    <asp:HyperLink ID="link_registration" runat="server" NavigateUrl="~/registration_form.aspx">Register Now</asp:HyperLink>
                    <br />
                    <br />

            </div>
        </center>
    </body>
    </html>


</asp:Content>
