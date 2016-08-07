<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import ="model.*,java.sql.*,db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display User Information</title>
</head>
<body>
<h1>Transaction History</h1>

<table border="2">
<tr>
<td>Title</td>
<td>Price</td>
<td>Quantity</td>
<td>Date Of Purchase</td>
</tr>
<% 
//need to get email in as cookie or session
try
{
	Connection conn = DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("select p.game_id,p.date_of_purchase,p.qty,g.title,g.px,g.quantity from assignment2.purchases p,assignment2.game g where p.game_id=g.game_id and member_id=?");
    pstmt.setInt(1,email);
    ResultSet rs=pstmt.executeQuery();

while(rs.next())
{

%>
    <tr><td><%rs.getString("Title"); %></td></tr>
    <tr><td><%rs.getInt("Price"); %></td></tr>
    <tr><td><%rs.getInt("Quantity"); %></td></tr>
    <tr><td><%rs.getInt("DateOfPurchase"); %></td></tr>
        <%

}
%>
    </table>
    <%
    rs.close();
    
    conn.close();
    }
catch(Exception e)
{
    
    }




%>
</body>
</html>