<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String inputuser=request.getParameter("user");
String inputpassword=request.getParameter("pass");

    Connection conn = DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("select * from users where userID = ? and pass=?");
    pstmt.setString(1, inputuser);
    pstmt.setString(2, inputpassword);
	
	ResultSet rs=pstmt.executeQuery();
	
	if(rs.next()){
		String dbusername=rs.getString("userID");
		String dbpassword=rs.getString("pass");
		int status = rs.getInt("status");
		
		session.setAttribute("login-status", dbusername);
		response.sendRedirect("mainPage.jsp");
	} else {
		response.sendRedirect("login2.html");
	}
	conn.close();
	
	
%>

</body>
</html>