<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String inputuser=request.getParameter("username");
String inputpassword=request.getParameter("passwd");
try {
    // Step1: Load JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    // Step 2: Define Connection URL
    String connURL ="jdbc:mysql://cqr.softether.net/gamestore?user=root&password=EADBestModule"; 
    // Step 3: Establish csonnection to URL
    Connection conn =   DriverManager.getConnection(connURL); 
    PreparedStatement pstmt = conn.prepareStatement("SELECT * from users");
	
	ResultSet rs=pstmt.executeQuery();
	
	while(rs.next()){
		String dbusername=rs.getString("userID");
		String dbpassword=rs.getString("pass");
		if (inputuser.equals(dbusername)&&inputpassword.equals(dbpassword)) {
			response.sendRedirect("admin.html");
		}
		else {
			response.sendRedirect("login.html");
		}
	}
	
	
	
}
catch(Exception e){
	out.println(e);
}
%>
</body>
</html>