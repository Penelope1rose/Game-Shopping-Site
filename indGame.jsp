<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*"%>
<%@page import="java.util.*, javax.servlet.*"%>
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
<link href="css/shop-item.css" rel="stylesheet">

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
				<li><a href="mainPage2.jsp"><span
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
								type="text" class="form-control" id="style" name="search"
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

		<div class="row">

			<%
				int gsid = 0;
				String id = request.getParameter("value");
				if (id != null){
					gsid=Integer.parseInt(id);
					}

				Connection conn = DBconnect.getConnection();

				String sql = "SELECT * from game where Game_ID = ? ";
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gsid);

				ResultSet rs = pstmt.executeQuery();

					if (rs.next()) { /* will fetch the next record. can be used to check if input is null */
						String title = rs.getString("title");
						String sum = rs.getString("Summary");
						String desc = rs.getString("Description");
						String dev = rs.getString("Developer");
						String pub = rs.getString("Publisher");
						double px = rs.getDouble("Px");
						String preown = rs.getString("Preowning");
						String img = rs.getString("Image_Location");
						
						out.println("/* Sam, can help me do le genre thing? showing it all but have no repeats. that is hard fr me to do */");
						out.println("/* Also, le release date idk how to bring out from db. ");
			%>
			
				<div class="col-md-3">
					<p class="lead">Details</p>
					<div class="list-group">
				
				/* Sam, can help me do le genre thing? showing it all but have no repeats. that is hard fr me to do */	
							
						<p class="list-group-item active">Genre: </p>
						<p class="list-group-item active">Developer: <%=dev%></p>
						<p class="list-group-item active">Publisher <%=pub%></p>
						<p class="list-group-item active">Developer: <%=dev%></p>
						<p class="list-group-item active">Release Date: </p>
						<p class="list-group-item active">Preowned: <%=preown %></p>
						
						
					</div>
				</div>

			<div class="col-md-9" id="move">

				<div class="thumbnail">
					<img class="img-responsive" src="<%=img%>" alt="" width="900"
						height="300" />
					<div class="caption-full">
						<button id="text2" class="btn btn-success">Purchase</button>
						<h3 id="text">
							$<%=px%></h3>

						<h2>
							<%=title%>
						</h2>
					</div>


					<%
						pstmt = conn.prepareStatement("SELECT Reviewer, Date, Comment, Rating FROM comment, game where game_ID = gid and gid = ? ");
						pstmt.setString(1, id);
																					
						rs = pstmt.executeQuery();
					%>

				<div class="caption-full">
					<div class="ratings">
						<p class="pull-right">3 reviews</p>
						<p>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> 4.0 stars
						</p>
					</div>
					</div>
				</div>

				<div class="thumbnail">
					<div class="caption-full">
						<h4 class="font">
							Summary: <br>
						</h4>

						<p>
							<%=sum%>
						</p>
						<br>
						<h4 class="font">Game Description:</h4>

						<p>
							<%=desc%><br>
						</p>
					</div>
				</div>





				<div class="well">

					<div class="text-right">
						<a class="btn btn-success" href="review.jsp">Leave a Review</a>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> Anonymous <span
								class="pull-right">10 days ago</span>
							<p>This product was great in terms of quality. I would
								definitely buy another!</p>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> Anonymous <span
								class="pull-right">12 days ago</span>
							<p>I've alredy ordered another one!</p>
						</div>
					</div>

					<hr>

					<div class="row">
						<div class="col-md-12">
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> Anonymous <span
								class="pull-right">15 days ago</span>
							<p>I've seen some better than this, but not at this price. I
								definitely recommend this item.</p>
						</div>
					</div>
						<div class="row">
						<div class="col-md-12">
						<%
			Connection conn = DBconnect.getConnection();

			PreparedStatement pstmt = conn.prepareStatement("SELECT * from comment");
									
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String name = rs.getString("Reviewer");
				String date = rs.getString("Date");
				String comment = rs.getString("comment");
				
		%>
							<span class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star"></span> <span
								class="glyphicon glyphicon-star-empty"></span> <%=name %> <span
								class="pull-right"><%=date %></span>
							<p><%=comment %></p>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- /.container -->

	<div class="container">

		<hr>

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
	<%
		}
			conn.close();
	%>

</body>
</html>