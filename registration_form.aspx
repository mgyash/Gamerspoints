<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="registration_form.aspx.cs" Inherits="main_project.registration_form" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">


    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title>Registration | GamersPoint</title>
        <style type="text/css">
            .auto-style1 {
                width: 800px;
                border-collapse: collapse;
                height: 750px;
                border: 2px solid #000080;
            }

            .auto-style2 {
                width: 216px;
            }

            .auto-style3 {
                width: 18px;
            }

            .auto-style6 {
                width: 216px;
                text-decoration: underline;
            }

            .auto-style8 {
                width: 200px;
            }

            .auto-style9 {
                width: 216px;
                height: 230px;
            }

            .auto-style10 {
                width: 18px;
                height: 230px;
            }

            .auto-style11 {
                width: 200px;
                height: 230px;
            }

            .auto-style12 {
                width: 266px;
                height: 230px;
            }

            .auto-style13 {
                height: 140px;
                width: 275px;
                margin-top: 0px;
            }

            .auto-style14 {
                width: 216px;
                height: 70px;
            }

            .auto-style15 {
                width: 18px;
                height: 70px;
            }

            .auto-style16 {
                width: 200px;
                height: 70px;
            }

            .auto-style18 {
                width: 216px;
                height: 58px;
            }

            .auto-style19 {
                width: 18px;
                height: 58px;
            }

            .auto-style20 {
                width: 200px;
                height: 58px;
            }

            .auto-style21 {
                width: 266px;
                height: 58px;
            }

            .auto-style23 {
                width: 266px;
            }

            .auto-style24 {
                width: 266px;
                height: 70px;
            }

            .auto-style25 {
                width: 216px;
                height: 49px;
            }

            .auto-style26 {
                width: 18px;
                height: 49px;
            }

            .auto-style27 {
                width: 200px;
                height: 49px;
            }

            .auto-style28 {
                width: 266px;
                height: 49px;
            }
        </style>
    </head>
    <body>

        <center>

            <h2>Registration Form</h2>

                <table cellpadding="3" cellspacing="3" class="auto-style1">
                    <tr>
                        <td class="auto-style6">
                            <asp:Label ID="lbl_username" runat="server" Text="Username" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style3">:</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtbox_username" runat="server" Height="30px" Width="220px"></asp:TextBox>
                        </td>
                        <td class="auto-style23">
                            <asp:RequiredFieldValidator ID="reqvald_username" runat="server" ControlToValidate="txtbox_username" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbl_emailid" runat="server" Text="Email ID" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style3">:</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtbox_emailid" runat="server" Height="30px" Width="220px"></asp:TextBox>
                        </td>
                        <td class="auto-style23">
                            <asp:RequiredFieldValidator ID="reqvald_emailid" runat="server" ControlToValidate="txtbox_emailid" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                            &nbsp;
                        <asp:RegularExpressionValidator ID="regex_email" runat="server" ControlToValidate="txtbox_emailid" ErrorMessage="Email must be in proper format" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="submit"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style25">
                            <asp:Label ID="lbl_password" runat="server" Text="Password" Font-Size="X-Large"> </asp:Label>
                        </td>
                        <td class="auto-style26">:</td>
                        <td class="auto-style27">
                            <asp:TextBox ID="txtbox_password" runat="server" Height="30px" Width="220px"></asp:TextBox>
                        </td>
                        <td class="auto-style28">
                            <asp:RequiredFieldValidator ID="reqvald_password" runat="server" ControlToValidate="txtbox_password" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="regex_password" runat="server" ControlToValidate="txtbox_password" ErrorMessage="Password must be 6-12 characrers long" ForeColor="Red" ValidationExpression="^.{6,12}$" ValidationGroup="submit"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbl_contactno" runat="server" Text="Contact No." Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style3">:</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtbox_contactno" runat="server" Height="30px" Width="220px"></asp:TextBox>
                        </td>
                        <td class="auto-style23">
                            <asp:RequiredFieldValidator ID="reqvald_contact" runat="server" ControlToValidate="txtbox_contactno" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                            &nbsp;
                        <asp:RegularExpressionValidator ID="regex_contact" runat="server" ControlToValidate="txtbox_contactno" ErrorMessage="Ex: 9876543210" ForeColor="Red" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="submit"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14">
                            <asp:Label ID="lbl_state" runat="server" Text="State" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style15">:</td>
                        <td class="auto-style16">
                            <asp:DropDownList ID="ddl_state" AutoPostBack="true" runat="server" Height="40px" Width="230px" OnSelectedIndexChanged="ddl_state_SelectedIndexChanged">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style24">
                            <asp:RequiredFieldValidator ID="reqvald_state" runat="server" ControlToValidate="ddl_state" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14">
                            <asp:Label ID="lbl_city" runat="server" Text="City" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style15">:</td>
                        <td class="auto-style16">
                            <asp:DropDownList ID="ddl_city" AutoPostBack="true" runat="server" Width="230px" Height="40px">
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style24">
                            <asp:RequiredFieldValidator ID="reqvald_city" runat="server" ControlToValidate="ddl_city" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Label ID="lbl_address" runat="server" Text="Address" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style10">:</td>
                        <td class="auto-style11">
                            <textarea id="txtarea_address" runat="server" class="auto-style13" name="S1"></textarea></td>
                        <td class="auto-style12">
                            <asp:RequiredFieldValidator ID="reqvald_address" runat="server" ControlToValidate="txtarea_address" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="lbl_picture" runat="server" Text="Picture" Font-Size="X-Large"></asp:Label>
                        </td>
                        <td class="auto-style3">:</td>
                        <td class="auto-style8">
                            <asp:FileUpload ID="FileUpload_picture" runat="server" Height="35px" Width="280px" />
                        </td>
                        <td class="auto-style23">
                            <asp:RequiredFieldValidator ID="reqvald_image" runat="server" ControlToValidate="FileUpload_picture" ErrorMessage="*" Font-Size="X-Large" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submit"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <asp:HiddenField ID="HiddenField1" Value="normal" runat="server" />
                    <tr>
                        <td class="auto-style2">&nbsp;</td>
                        <td class="auto-style3">&nbsp;</td>
                        <td class="auto-style8">&nbsp;</td>
                        <td class="auto-style23">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style18" rowspan="1">
                            <asp:Button ID="btn_submit" runat="server" Height="50px" OnClick="btn_submit_Click" Text="Submit" Width="165px" ValidationGroup="submit" />
                        </td>
                        <td class="auto-style19"></td>
                        <td class="auto-style20">
                            <asp:Button ID="btn_resett" runat="server" Height="50px" Width="165px" Text="Reset" OnClick="btn_resett_Click" />
                        </td>
                        <td class="auto-style21">
                            <asp:HyperLink ID="link_login" runat="server" NavigateUrl="~/login_form.aspx" Font-Size="Large">Login Here!</asp:HyperLink>
                        </td>
                    </tr>
                </table>

        </center>
    </body>
    </html>


</asp:Content>
