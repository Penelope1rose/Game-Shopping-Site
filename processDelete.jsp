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
String inputgid=request.getParameter("gid");


	Connection conn = DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("delete from game where game_id=?");
	pstmt.setString(1,inputgid);
	pstmt.executeUpdate();
	response.sendRedirect("adminPage.jsp");
%>
</body>
</html>