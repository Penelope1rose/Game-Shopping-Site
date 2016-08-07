<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="Model.*, java.util.*, db.*, java.sql.*, java.text.*" %>
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
						class="glyphicon glyphicon-home"></span> HOME</a></li>
				<li id="options"><a href="#" onclick="">GAMES BY GENRE</a>
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

		<!-- Page Heading -->
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Your shopping Cart!</h1>
			</div>

			<!-- Project /.row -->
			<table width=100%>
			<% ArrayList <cartSet> cartList = (ArrayList <cartSet>) session.getAttribute("cart");
			   if(cartList == null){
				   cartList = new ArrayList <cartSet>();
			   }
			   
			   int cartSize = cartList.size();
				   if (cartSize > 0) {
				   		for (cartSet scart:cartList) {
				  
				   				NumberFormat formatter = new DecimalFormat("#0.00");
				   
				   				Connection conn = DBconnect.getConnection();
				   
				   				String sql = "Select Title, Image_location,Px,Quantity from game where game_ID = ?";
					
								PreparedStatement pt = conn.prepareStatement(sql);
								pt.setInt(1, scart.getId());

								ResultSet rs = pt.executeQuery();
								
								if(rs.next()){
									String tt = rs.getString("Title");
									double price = rs.getDouble("Px");
									String img = rs.getString("Image_location");
									int dbquantity = rs.getInt("Quantity");
			%>
			
			<tr>
				<td><img class="img-responsive" src=<%=img%> alt="" width="200" height="280"> </td>
				<td><%=tt %></td>
				<td>
					<form action="cartControl" method="post">
  						<input type="number" name="quantity" min='1' max=<%=dbquantity %> value=<%=scart.getQuantity() %>>
				</td>
				<td>
				<% if(scart.getQuantity()> 1){
					price = scart.getQuantity()*price;
				}
				%>
				$<%=formatter.format(price) %>
				</td>
				<td>
						<input type='hidden' name='index' value=<%=cartList.indexOf(scart) %> />
						<input type='hidden' name='action' value='update' />
						<button class="btn btn-success"> Update </button>
					</form>
				</td>
				<td>
					<form action="cartControl" method="post">
						<input type='hidden' name='index' value=<%=cartList.indexOf(scart) %> />
						<input type='hidden' name='action' value='delete' />
						<button class="btn btn-success"> Remove </button>
					</form>
				</td>
			</tr>
		
				<% 
								}
								conn.close();
						}
					
				%>	
		</table>
		<div class="text-right">
			<form action="checkout.jsp" method="post">
				<input type='hidden' name='action' value='checkout' />
				<button class="btn btn-success"> Checkout </button>
			</form>
		</div>
		
		<%
				   } else {  
		%>
					Sorry, there is nothing in your cart. Let us browse for games!

					<div class="text-right">
						<a class="btn btn-success" href="mainPage.jsp">Browse</a>
					</div>
					<% } %>

		<!-- Projects Row -->
		
		<div class="row">


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