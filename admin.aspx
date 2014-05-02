<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<!DOCTYPE html>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>Welcome Admin</title>

    <!-- Bootstrap core CSS -->
    <!--link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <!--link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
    <form id="adminFuncs" runat="server">
    <asp:TextBox runat="server" ID="txtTitle" placeholder="Movie title"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtCompany" placeholder="Movie company"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtDirector" placeholder="Movie director"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtEditor" placeholder="Movie editor"></asp:TextBox>
    <asp:TextBox runat="server" ID="txtTrailer" placeholder="Movie trailer"></asp:TextBox>
    <asp:Button runat="server" CssClass="btn btn-sm btn-primary center-block" ID="btnAdd" Text="Add Movie" OnClick="btnAdd_Click" /><br />
    <asp:DropDownList runat="server" ID="list"></asp:DropDownList>
    <asp:TextBox runat="server" ID="newTitle" placeholder="Movie title"></asp:TextBox>
    <asp:TextBox runat="server" ID="newCompany" placeholder="Movie company"></asp:TextBox>
    <asp:TextBox runat="server" ID="newDirector" placeholder="Movie director"></asp:TextBox>
    <asp:TextBox runat="server" ID="newEditor" placeholder="Movie editor"></asp:TextBox>
    <asp:TextBox runat="server" ID="newTrailer" placeholder="Movie trailer"></asp:TextBox>
    <asp:Button runat="server" CssClass="btn btn-sm btn-primary center-block" ID="btnEdit" Text="Edit Movie" OnClick="btnEdit_Click" /><br />
    <asp:DropDownList runat="server" ID="listDelete"></asp:DropDownList>
    <asp:Button runat="server" CssClass="btn btn-sm btn-primary center-block" ID="btnDelete" Text="Delete Movie" OnClick="btnDelete_Click" />    
    </form>
    <a href="Home.aspx">Back to home</a>

</body>
</html>
