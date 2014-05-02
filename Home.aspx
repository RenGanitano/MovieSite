<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="BootstrapTest" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Shop Homepage Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.css" rel="stylesheet">

    <!-- Add custom CSS here -->
    <link href="css/shop-homepage.css" rel="stylesheet">

    <!--Test Script-->
    <script type="text/javascript">

        function changeTrailer(name, title, company, summary) {
            var mt = document.getElementById("movieTitle");
            mt.textContent = 'Title: ' + title;
            mt.style.visibility = "visible";
            var mc = document.getElementById("movieCompany");
            mc.textContent = company;
            mc.style.visibility = "visible";
            var ms = document.getElementById("movieSum");
            ms.textContent = summary;
            ms.style.visibility = "visible";
            var f = document.getElementById("youtube1");
            var k = document.getElementById("watchnow");
            k.style.visibility = "visible";
            
            f.src = name;
            f.height = "350px";
            f.width = "100%";
            
        }

        function watchClicked()
        {
        <%
        Session.Add("movieTitle", movieTitle.Text);
        Session.Add("movieCompany", movieCompany.Text);
        Session.Add("movieSummary", movieSum.Text);
                
        %>
        }

    </script>

</head>

<body>

    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>                                                            
                </button>
                <a class="navbar-brand" href="/Home.aspx">Home</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">                
                <ul class="nav navbar-nav">
                    <li><a href="#about">Plans</a>
                    </li>
                    <li><a href="#services">Services</a>
                    </li>
                    <li><a href="#contact">Contact</a>
                    </li>                                                   
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <div class="container">

        <div class="row">

            <div class="col-md-3">
                <div class="list-group">
                    <form id="Form2" runat="server">
                    <span>
                        <asp:TextBox ID="searchBox" runat="server" class="list-group-item" Width="262px"></asp:TextBox>                       
                        <asp:DropDownList ID="listSelect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="AjaxMovieList">
                            <asp:ListItem Value="director">Director</asp:ListItem>
                            <asp:ListItem Value="castname">Actor</asp:ListItem>
                            <asp:ListItem Value="castrole">Character</asp:ListItem>
                            <asp:ListItem Value="title">Title</asp:ListItem>
                            <asp:ListItem>Keyword</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="Button2" runat="server" class="list-group-item" Text="Search" OnClick="AjaxMovieList"/>
                    </span>                                                
                    &nbsp;<asp:ScriptManager ID="ScriptManager1" runat="server">
                        </asp:ScriptManager>
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                            <ContentTemplate>
                                <strong><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></strong><br />
                                <u><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></u><br />
                                <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </form>
                </div>      
                        
            </div>
            
            <div class="col-md-9">

                <div id="titleDiv" name="titleDiv" runat="server">
                                
                </div>
                
                <div class="row carousel-holder">
                    <h4>Click on the image to view a trailer below</h4>
                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators" runat="server" id="dots">
                                
                            </ol>
                            <div class="carousel-inner" id="carouselImgs" name="carouselImgs" runat="server">
                                
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>       
                        
                        <%--Movie List Here--%>
                        <asp:PlaceHolder ID="placeholder" runat="server">

                        </asp:PlaceHolder>

                    </div>
                </div>
                <div class="row movie-holder" style="padding-top:20px;">
                    <div class="col-md-8" id="trailers" onload="this.height=0;">
                        <iframe id="youtube1" width="0" height="0" src=""></iframe>
                    </div>
                    <div class ="col-md-4">
                        <legend><strong><asp:Label ID="movieTitle" runat="server"></asp:Label></strong></legend> <br />
                        <h4><strong></strong><asp:Label ID="movieCompany" runat="server" style="visibility:hidden;"><strong></strong></asp:Label></h4><br />
                        <p><asp:Label ID="movieSum" runat="server"></asp:Label></p>
                        <a href="movies.aspx" runat="server" id="watchnow" class="btn btn-primary btn-lg" role="button" style="visibility:hidden;" onclick="watchClicked()">Watch It Now</a>
                    </div>
                </div>   

            </div>

        </div>

    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Company 2013</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- JavaScript -->
    <script src="js/jquery-1.10.2.js"></script>
    <script src="js/bootstrap.js"></script>

</body>
</html>
