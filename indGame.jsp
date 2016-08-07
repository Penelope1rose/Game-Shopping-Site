<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*"%>
<%@page import="java.util.*, javax.servlet.*, java.text.*"%>
 <%
//user must login successfully to access this page
 	String user = (String) session.getAttribute("login-status");

	if(user == null){
		response.sendRedirect("login2.html");
	} else {
		
%> 
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
				<li><a href="mainPage.jsp"><span
						class="glyphicon glyphicon-home" aria-hidden="true"></span> HOME</a></li>
				<li id="options"><a href="#">GAMES BY GENRE</a>
					<ul class="subnav">
						<li><a href="searchGame.jsp?search=Action">Action</a></li>
						<li><a href="searchGame.jsp?search=Adventure">Adventure</a></li>
						<li><a href="searchGame.jsp?search=RPG">RPG</a></li>
						<li><a href="searchGame.jsp?search=Free-to-Play">Free-to-Play</a></li>
						<li><a href="searchGame.jsp?search=Indie">Indie</a></li>
						<li><a href="searchGame.jsp?search=Strategy">Strategy</a></li>
						<li><a href="searchGame.jsp?search=Shooter">Shooter</a></li>
					</ul>
				</li>
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
				<li>
<div class="topcorner">
						<a href="shoppingCart.jsp"><span
							class="glyphicon glyphicon-shopping-cart"></span>Cart</a> 
							<%
 									if(user != null){
							%>
									<a href="logout.jsp">Logout</a>
							<%			
 									 } else {
 							%>
 								 <a href="login2.html"> Login 
 							<% } %>
 						</a>
					</div>
				</li>

			</ul>

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
				if (id != null) {
					gsid = Integer.parseInt(id);
				}

				Connection conn = DBconnect.getConnection();

				String sql = "select Release_Date,Developer,Publisher,Preowning, genre_Name from genre, game_genre, game where Genre_ID=genreID and Game_ID=GameID and GameID = ?";

				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gsid);

				ResultSet rs = pstmt.executeQuery();

				if (rs.next()) { /* will fetch the next record. can be used to check if input is null */
					String genre = rs.getString("genre_Name");
					String dev = rs.getString("Developer");
					String pub = rs.getString("Publisher");
					String preown = rs.getString("Preowning");
					DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
			%>

			<div class="col-md-3">
				<p class="lead">Details</p>
				<div class="list-group">

					<p class="list-group-item active">
						Genre:

						<%=genre%>
					</p>
					<p class="list-group-item active">
						Publisher:
						<%=pub%></p>
					<p class="list-group-item active">
						Developer:
						<%=dev%></p>
					<p class="list-group-item active">
						Release Date:
						<%=df.format(rs.getDate("Release_Date"))%></p>
					<p class="list-group-item active">
						Preowned:
						<%=preown%></p>
				</div>
			</div>

			<%
				}

				sql = "select Title, Summary, Description, Px, Image_Location from game where Game_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gsid);

				rs = pstmt.executeQuery();

				if (rs.next()) { /* will fetch the next record. can be used to check if input is null */
					String title = rs.getString("Title");
					String sum = rs.getString("Summary");
					String desc = rs.getString("Description");
					double px = rs.getDouble("Px");
					String img = rs.getString("Image_Location");
			%>

			<div class="col-md-9" id="move">

				<div class="thumbnail">
					<img class="img-responsive" src="<%=img%>" alt="" width="900"
						height="300" />
					<div class="caption-full">
						<form action="cartControl" method="post">
							<input type='hidden' name='hiddenID' value=<%=gsid %> />
							<input type='hidden' name='hiddenQty' value=1 />
							<input type='hidden' name='action' value='add' />
							<button id="text2" class="btn btn-success"> Add to Cart </button>
						</form>
						
						<h3 id="text">
							<% NumberFormat formatter = new DecimalFormat("#0.00");  %>
							$<%=formatter.format(px)%></h3>

						<h2>
							<%=title%>
						</h2>
					</div>
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
		<%
			}
		%>

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
						class="pull-right">12 days ago</span>
					<p>I've already ordered another one!</p>
				</div>
			</div>

			<hr>

			<div class="row">
				<div class="col-md-12">

					<%
						pstmt = conn
								.prepareStatement("SELECT comment.* FROM comment, game where game_ID = gid and gid = ? ");
						pstmt.setInt(1, gsid);

						rs = pstmt.executeQuery();

						while (rs.next()) {
							String name = rs.getString("Reviewer");
							String date = rs.getString("Date");
							String comment = rs.getString("comment");
					%>
					<span class="glyphicon glyphicon-star"></span> <span
						class="glyphicon glyphicon-star"></span> <span
						class="glyphicon glyphicon-star"></span> <span
						class="glyphicon glyphicon-star"></span> <span
						class="glyphicon glyphicon-star-empty"></span>
					<%=name%>
					<span class="pull-right"><%=date%></span>
					<p><%=comment%></p>
				</div>
			</div>
		</div>
	</div>
	<%
		}
		conn.close();
	%>
	<!-- /.container -->

	<div class="container">

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
<%
	}
%>