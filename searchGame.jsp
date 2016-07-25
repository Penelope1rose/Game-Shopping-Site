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

<title>testing</title>

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
						class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
				<li id="options"><a href="#">GAMES BY GENRE</a>
					<ul class="subnav">
						<li><a href="searchGame.jsp?value=Action">Action</a></li>
						<li><a href="searchGame.jsp?value=Adventure">Adventure</a></li>
						<li><a href="searchGame.jsp?value=RPG">RPG</a></li>
						<li><a href="searchGame.jsp?value=Free-to-Play">Free-to-Play</a></li>
						<li><a href="searchGame.jsp?value=Indie">Indie</a></li>
						<li><a href="searchGame.jsp?value=Strategy">Strategy</a></li>
						<li><a href="searchGame.jsp?value=Shooter">Shooter</a></li>
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
				<h1 class="page-header">Search Results</h1>
			</div>
		</div>
		<!-- /.row -->

		

		<!-- Projects Row -->

		

		<div class="row">
			<div class="col-lg-12">
				<%
String inputSearch=request.getParameter("value");

    Connection conn =   DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("select distinct * from gamestore.game,gamestore.genre,gamestore.game_genre where gamestore.game.game_id=gamestore.game_genre.gameid and gamestore.game_genre.genreid=gamestore.genre.genre_id and title like ? or genre_name like ?");
	
    pstmt.setString(1,inputSearch);
    pstmt.setString(2,inputSearch);
	ResultSet rs=pstmt.executeQuery();%>
	<table width=100%>
	<tr><td>Title</td><td>ReleaseDate</td><td>Summary</td><td>Price</td><td>thumbnail</td></tr>
	<% 
	while(rs.next()){
		String title=rs.getString("title");
		String releasedate=rs.getString("release_date");
		String summary=rs.getString("summary");
		double price=rs.getInt("px");
		String img=rs.getString("image_location");
		%><tr><td><%=title %></td>
		<td><%=releasedate%>     </td>	
		<td><%=summary %></td>
		<td><%=price %></td>
		<td><img class="img-responsive"
					src="<%=img %>" alt="" style="width:300px;height:200px;" /></td>
		<% } %>
		</table>

			</div>

			
		
		

		<hr id="line">
		<!-- Footer -->
		<footer>
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