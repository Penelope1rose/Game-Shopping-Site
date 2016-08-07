<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*, db.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border="2">
<tr>
<td>Title</td>
<td>Price</td>
<td>Quantity</td>
</tr>
<%
Integer quantity=Integer.parseInt(request.getParameter("quantity"));
try
{
	Connection conn = DBconnect.getConnection();
    PreparedStatement pstmt = conn.prepareStatement("select title, px,quantity from assignment2.game where quantity < ?");
    pstmt.setInt(1,quantity);
    ResultSet rs=pstmt.executeQuery();

while(rs.next())
{

%>
    <tr><td><%rs.getString("Title"); %></td></tr>
    <tr><td><%rs.getInt("Price"); %></td></tr>
    <tr><td><%rs.getInt("Quantity"); %></td></tr>
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