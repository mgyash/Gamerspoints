<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="message.aspx.cs" Inherits="main_project.btspFiles.message" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <% 
        string message = Session["message"].ToString();
        string msgType = Session["msgType"].ToString();

        if (message != null)
        {
    %>

    <form id="form1" runat="server">
        <div class="alert alert-<%=Session["msgType"].ToString();%> alert-dismissible fade show" role="alert">
            <strong><%=Session["message"].ToString();%> </strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </form>

    <% 
            Session.Remove("message");
            Session.Remove("msgType");
        }
    %>
</body>
</html>
