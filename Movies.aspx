<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Movies.aspx.cs" Inherits="Movies" %>

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
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="pnlPlan" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="page-header">
                            <h1 style="color:navy;">@Video <small>your online video emporium</small></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3">
                        
                        <asp:RadioButton ID="rbtn1" runat="server" GroupName="plan" text="1" OnCheckedChanged="RadioSubscribe_CheckedChanged"/>
                        <label>Month</label>
                    </div>
                    <div class="col-md-3">
                        <asp:RadioButton ID="rbtn3" runat="server" GroupName="plan" text="3" OnCheckedChanged="RadioSubscribe_CheckedChanged"/>
                        <label>Months</label>
                    </div>
                    <div class="col-md-3">
                        <asp:RadioButton ID="rbtn6" runat="server" GroupName="plan" text="6" OnCheckedChanged="RadioSubscribe_CheckedChanged"/>
                        <label>Months</label>
                    </div>
                    <div class="col-md-3">
                        <asp:RadioButton ID="rbtn12" runat="server" GroupName="plan" text="12" OnCheckedChanged="RadioSubscribe_CheckedChanged"/>
                        <label>Months</label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <asp:Button ID="btnSubscribe" class="btn btn-primary btn-lg" runat="server" Text="Subscribe!" OnClick="btnSubscribe_Click" />
                        <a href="Home.aspx" class="btn btn-primary btn-lg " role="button">Back to Gallery</a>
                    </div>
                </div>
            </div>
        </asp:Panel>

        <asp:Panel ID="pnlMovie" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="page-header">
                            <h1 style="color:navy;">@Video <small>your online video emporium</small></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-11">
                        <video controls preload="auto" width="960" height="396">
                            <source src="http://video-js.zencoder.com/oceans-clip.mp4" type='video/mp4' />
                            <source src="http://video-js.zencoder.com/oceans-clip.webm" type='video/webm' />
                            <source src="http://video-js.zencoder.com/oceans-clip.ogv" type='video/ogg' />
                        </video>
                    </div>
                    <div class="col-md-1">

                        <strong>Title: </strong><asp:Label ID="Label1" runat="server" Text="Label"><%Label1.Text = (string)Session["movieTitle"]; %></asp:Label>
                        <strong>Company: </strong><asp:Label ID="Label2" runat="server" Text="Label"><%Label2.Text = (string)Session["movieCompany"]; %></asp:Label>
                        <strong>Summary: </strong><asp:Label ID="Label3" runat="server" Text="Label"><%Label3.Text = (string)Session["movieSummary"]; %></asp:Label>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <a href="Home.aspx" class="btn btn-primary btn-lg " role="button">Back to Gallery</a>
                    </div>
                </div>
            </div> 
        </asp:Panel>

        <asp:Panel ID="pnlPurchase" runat="server">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="page-header">
                            <h1 style="color:navy;">@Video <small>your online video emporium</small></h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <h3>Payment Method:</h3>
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <asp:RadioButton ID="rbtnPayPal" runat="server" GroupName="payMethod" OnCheckedChanged="RadioPayment_CheckedChanged" Text="Pay Pal" AutoPostBack="True" />
                                <asp:RadioButton ID="rbtnCredit" runat="server" GroupName="payMethod" OnCheckedChanged="RadioPayment_CheckedChanged" Text="Credit Card" AutoPostBack="True" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="col-md-6">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <asp:Panel ID="pnlPayPal" runat="server">
                                    <h2>Use Pay Pal gateway:</h2>
                                    <asp:Button ID="btnSubmit1" runat="server" class="btn btn-success" Text="Pretend to Pay" OnClick="btnSubmit1_Click" />
                                </asp:Panel>

                                <asp:Panel ID="pnlCredit" runat="server">
                                    <h2>Enter your payment Information:</h2>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Name:</label>
                                        </div>
                                        <div class="col-md-6">
                                             <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Credit Card Number:</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>CSV:</label>
                                        </div>
                                        <div class="col-md-6">
                                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                        </div>
                                    <div class="row">
                                    
                                    <asp:Button ID="btnSubmit2" runat="server" Text="Pretend to Pay" class="btn btn-success" OnClick="btnSubmit2_Click" />
                                </asp:Panel>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-1">
                        <a href="Home.aspx" class="btn btn-primary btn-lg " role="button">Back to Gallery</a>
                    </div>
                </div>
            </div>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
