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
String inputtitle=request.getParameter("title");
String inputsummary=request.getParameter("summary");
String inputdescription=request.getParameter("description");
String inputdeveloper=request.getParameter("developer");
String inputpublisher=request.getParameter("publisher");
String inputimageurl=request.getParameter("imageurl");
String inputreleasedate=request.getParameter("releasedate");
String inputprice=request.getParameter("price");
String gametype="Recent";
String inputgid=request.getParameter("gid");

	Connection conn = DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("update game set title=?,release_date=?,summary=?,description=?,developer=?,publisher=?,px=?,image_location=?,game_type=? where game_id=?");
	pstmt.setString(1,inputtitle);
	pstmt.setString(2,inputreleasedate);
	pstmt.setString(3,inputsummary);
	pstmt.setString(4,inputdescription);
	pstmt.setString(5,inputdeveloper);
	pstmt.setString(6,inputpublisher);
	pstmt.setString(7,inputprice);
	pstmt.setString(8,inputimageurl);
	pstmt.setString(9,gametype);
	pstmt.setString(10,inputgid);
	
	pstmt.executeUpdate();
	response.sendRedirect("adminPage.jsp");
%>
</body>
</html>