<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%! 
    ResourceBundle bundle =null;
    public void jspInit() {
       bundle = ResourceBundle.getBundle("forms");
      }
%>
<jsp:useBean id="formHandler" class="db.FormBean" scope="request">
<jsp:setProperty name="formHandler" property="*"/>
</jsp:useBean>
<% 
   if (formHandler.validate()) {
%>
    <jsp:forward page="<%=bundle.getString(\"process.success\")%>"/>
<%
   }  else {
%>
    <jsp:forward page="<%=bundle.getString(\"process.retry\")%>"/>
<%
   }
%>
</body>
</html>