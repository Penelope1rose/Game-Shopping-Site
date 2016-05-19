<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Insert title here</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/3-col-portfolio.css" rel="stylesheet">

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
				<li><a href="#">Recents</a></li>

			</ul>
			<div class="topcorner">
				<a href="login.html">Login</a>
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
				<h1 class="page-header">Popular Games</h1>
			</div>
		</div>
		<!-- /.row -->

		<%
			Connection conn = DBconnect.getConnection();

			PreparedStatement pstmt = conn
					.prepareStatement("SELECT Title, Price FROM game");
			ResultSet rs = pstmt.execute();
		%>

		<!-- Projects Row -->
		<%
			if (rs.next()) {
				String id = rs.getString("Game_ID");
				String tt = rs.getString("Title");
				String px = rs.getString("Price");
				String img = rs.getString("Image_location");

				for (int i = 0; i < 4; i++) {
		%>

		<div class="row">
			<div class="col-md-3 portfolio-item">
				<a href="indGame.jsp?value='+id+'"><img class="img-responsive"
					src="+img+" alt="" />
					<h3>
						<a><%=tt%></a>
					</h3>
					<p><%=px%></p> </a>
			</div>

			<%
				}
				}
			%>

			<div class="col-md-3 portfolio-item">
				<a href="indGame.jsp?value='+id+'"> <img class="img-responsive"
					src="gameImg/csgo.png" alt="">
					<h3>
						<a href="#">CS:GO</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
			<div class="col-md-3 portfolio-item">
				<a href="#"> <img class="img-responsive"
					src="gameImg/stellaris.jpg" alt="">
					<h3>
						<a href="#">Stellaris</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
			<div class="col-md-3 portfolio-item">
				<a href="#"> <img class="img-responsive" src="gameImg/doom.jpg"
					alt="">
					<h3>
						<a href="#">Doom</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
		</div>
		<!-- /.row -->

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Recent Games</h1>
			</div>
		</div>

		<!-- Projects Row -->
		<div class="row">
			<div class="col-md-3 portfolio-item">
				<a href="#"> <img class="img-responsive"
					src="gameImg/goliath1.jpg" alt="">
					<h3>
						<a href="#">Goliath</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
			<div class="col-md-3 portfolio-item">
				<a href="#"> <img class="img-responsive"
					src="gameImg/Battlesouls.jpg" alt="">
					<h3>
						<a href="#">Battlesouls</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
			<div class="col-md-3 portfolio-item">
				<a href="#"> <img class="img-responsive"
					src="gameImg/XCOM-2.jpg" alt="">
					<h3>
						<a href="#">XCOM 2: Alien Hunters</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
			<div class="col-md-3 portfolio-item">
				<a href="#"> <img class="img-responsive"
					src="gameImg/TASTEE-Lethal-Tactics.jpg" alt="">
					<h3>
						<a href="#">TASTEE: Lethal Tactics</a>
					</h3>
					<p>Lorem ipsum dolor sit amet</p>
				</a>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Pagination -->
		<div class="row text-center">
			<div class="col-lg-12">
				<ul class="pagination">
					<li><a href="#">&laquo;</a></li>
					<li class="active"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
					<li><a href="#">&raquo;</a></li>
				</ul>
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Footer -->
		<footer>
		<div class="row">
			<div class="col-lg-12">
				<p>Copyright &copy; Your Website 2014</p>
			</div>
		</div>
		<!-- /.row --> </footer>

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="js/bootstrap.min.js"></script>

</body>
</html>