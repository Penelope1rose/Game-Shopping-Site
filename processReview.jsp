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
String inputname=request.getParameter("Name");
String inputrate=request.getParameter("Rating");
String inputdate=request.getParameter("Date");
String inputcomment=request.getParameter("Comments");

	Connection conn = DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("INSERT INTO comment(gid,Reviewer,Rating,Date,Comments) VALUES(?,?,?,?,?)");
	pstmt.setString(1,inputgid);
	pstmt.setString(2,inputname);
	pstmt.setString(3,inputrate);
	pstmt.setString(4,inputdate);
	pstmt.setString(5,inputcomment);
	
	pstmt.executeUpdate();
	response.sendRedirect("adminPage.jsp");
%>
</body>
</html>