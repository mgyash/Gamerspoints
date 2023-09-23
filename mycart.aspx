<%@ Page Language="C#" MasterPageFile="~/header.Master" AutoEventWireup="true" CodeBehind="mycart.aspx.cs" Inherits="main_project.mycart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="maincontentplaceholder1" runat="Server">

<!DOCTYPE html>

<html>
<head>
    <title>Cart | GamersPoint</title>
    <style>
        .table {
            max-width: 900px;
            min-width: 370px;
        }
        .thname {
            max-width: 500px;
        }
    </style>
</head>
<body>
    <div class="container-fluid mt-2 mb-4">
        <center>
            <h1 class="my-3">Products Cart</h1>
            <!--for displaying message-->
                <%

                    if (Session["alertmessage"] != null)
                    {
                        string alertmessage = Session["alertmessage"].ToString();
                        string alertmsgType = Session["alertmsgType"].ToString();
                %>
                <div class="alert alert-<%=alertmsgType%> alert-dismissible fade show mt-3" role="alert" style="max-width:300px">
                    <strong><%=alertmessage%> </strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
                <br />
                <% 
                        Session["alertmessage"] = null;
                        Session["alertmsgType"] = null;
                    }
                %>
            <asp:Table ID="mycarttable" class='table' runat="server" CellPadding="3" CellSpacing="2" GridLines="Both">
                <asp:TableHeaderRow class='thead-light ' Font-Bold="True">
                    <asp:TableHeaderCell class="thname" Width="550px">Name</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Price</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Quantity</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Total</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Image</asp:TableHeaderCell>
                    <asp:TableHeaderCell>Action</asp:TableHeaderCell>
                </asp:TableHeaderRow>
            </asp:Table>
            <div class="container text-center">
                <button class="btn btn-outline-success order-btn">Order Now</button>
                <a href="home.aspx" class="btn btn-outline-warning">Continue Shopping</a>
                <br />
                
            </div>
            <br />
        </center>
    </div>
</body>
</html>


</asp:Content>
