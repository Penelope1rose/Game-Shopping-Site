<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*" %>
<%@page import="java.util.*, javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	
	
	Connection conn = DBconnect.getConnection();

	String sql = "SELECT * from game ";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	ResultSet rs = pstmt.executeQuery();
	
	out.println("<table>");

	while (rs.next()) { //will fetch the next record. can be used to check if input is null 
		String gid = rs.getString("Game_ID");
		String title = rs.getString("Title");
        String sum = rs.getString("Summary");
        String desc = rs.getString("Description");
	    String dev = rs.getString("Developer");
        String pub = rs.getString("Publisher");
        double px = rs.getDouble("Px");
        String preown = rs.getString("Preowning");
        String img = rs.getString("Image_Location");
				
%>
<tr>
	<td><%=gid%></td>
	<td><%=title%></td>
    <td><%=sum %></td>
    <td><%=desc %></td>
    <td><%=dev %></td>
    <td><%=pub %></td>
    <td><%=px %></td>
    <td><%=preown %></td>
    <td><%=img %></td>
</tr>
<% 
	}
	out.println("</table");
	conn.close();
%>
</body>
</html>