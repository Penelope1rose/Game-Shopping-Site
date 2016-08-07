<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*, Model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SP Gamestore</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/4-col-portfolio.css" rel="stylesheet">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<p class="navbar-brand">SP Gamestore</p>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="mainPage.jsp"><span
						class="glyphicon glyphicon-home" ></span> HOME</a></li>
				<li id="options"><a href="#">GAMES BY GENRE</a>
					<ul class="subnav">
						<li><a href="searchGame.jsp?search=Action">Action</a></li>
						<li><a href="searchGame.jsp?search=Adventure">Adventure</a></li>
						<li><a href="searchGame.jsp?search=RPG">RPG</a></li>
						<li><a href="searchGame.jsp?search=Free-to-Play">Free-to-Play</a></li>
						<li><a href="searchGame.jsp?search=Indie">Indie</a></li>
						<li><a href="searchGame.jsp?search=Strategy">Strategy</a></li>
						<li><a href="searchGame.jsp?search=Shooter">Shooter</a></li>
					</ul></li>
				<li>
					<form class="form-inline" role="form" action="searchGame.jsp">
						<div class="form-group has-success has-feedback">
							<label class="control-label" for="inputSuccess4"></label> <input
								type="text" class="form-control" id="style" name="value"
								placeholder="Search"> <span
								class="glyphicon glyphicon-search form-control-feedback"
								id="style2"></span>
						</div>
					</form>
				</li>
				<li>
					<div class="topcorner">
						<a href="shoppingCart.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span>Cart</a>
							
							<%
 								if (session.getAttribute("login-status") == "YES") { %>
 							  	<span class="glyphicon glyphicon-chevron-down"></span> 
 								<% } else { %>
 								 <a href="login2.html">Login 
 								<% } %>
 						</a>
					</div>
				</li>
			</ul>

			<div class="topcorner">
				<a href="login2.html"> 
					
 					
 				</a>
			</div>
		</div>

		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Popular</h1>
			</div>

			<!-- /.row -->

			<%
				Connection conn = DBconnect.getConnection();

				PreparedStatement pstmt = conn
						.prepareStatement("SELECT Title, Px, Game_ID, Image_location, game_type FROM game where game_type = 'popular'");

				ResultSet rs = pstmt.executeQuery();
			%>

			<!-- Projects Row -->

			<%
				while (rs.next()) {
					String id = rs.getString("Game_ID");
					String tt = rs.getString("Title");
					double px = rs.getDouble("Px");
					String img = rs.getString("Image_location");
					String gt = rs.getString("game_type");
			%>


			<div class="col-md-3 portfolio-item">
				<a href="indGame.jsp?value=<%=id%>"> <img class="img-responsive"
					src=<%=img%> alt="">
					<h4 class="flow">
						<a href="indGame.jsp?value=<%=id%>"><%=tt%></a>

						<p class="pull-right" id="font2">
							$<%=px%></p></a>
				</h4>
			</div>

			<%
				}
			%>
		</div>
		<!-- Projects Row -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Recent</h1>
			</div>

			<%
				pstmt = conn
						.prepareStatement("SELECT Title, Px, Game_ID, Image_location, game_type FROM game where game_type = 'recent'");

				rs = pstmt.executeQuery();
			%>

			<!-- Projects Row -->
			<%
				while (rs.next()) {
					String id = rs.getString("Game_ID");
					String tt = rs.getString("Title");
					double px = rs.getDouble("Px");
					String img = rs.getString("Image_location");
					String gt = rs.getString("game_type");
			%>


			<div class="col-md-3 portfolio-item">
				<a href="indGame.jsp?value=<%=id%>"><img class="img-responsive"
					src="<%=img%>" alt="" />
					<h4>
						<a href="indGame.jsp?value=<%=id%>" aria-hidden="true"><%=tt%></a>
					</h4>
					<p class="pull-right" id="font2">
						$<%=px%></p> </a>
			</div>
			<%
				}
			%>
		</div>
		<!-- /.row -->

		<hr id="line">
		<!-- Footer -->
		<footer id="footer">
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Sammyu Productions 2016</p>
			</div>
		</div>
		</footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>