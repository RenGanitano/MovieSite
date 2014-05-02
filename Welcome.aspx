<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Welcome.aspx.cs" Inherits="Welcome" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../../assets/ico/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>

    <div class="container">
        <form runat="server" id="loginForm" class="form-signin">
            <h2>
            <asp:Label ID="lblForm" runat="server" CssClass="form-signin-heading" Text="Please sign in"></asp:Label></h2>
            <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Username" autofocus></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
            <asp:Button ID="btnSignin" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Sign in" OnClick="btnSignin_Click" />
            <asp:Button ID="btnRegister" runat="server" CssClass="btn btn-lg btn-primary btn-block" Text="Register" OnClick="btnRegister_Click" />
            <a href="/Home.aspx" class="btn btn-primary btn-lg active" role="button">Preview Features</a>
        </form>
    </div>
    <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
