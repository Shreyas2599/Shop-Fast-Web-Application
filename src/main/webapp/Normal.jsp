<%@page import="com.learn.mycart.entities.User"%>
<%
User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not logged in !! Login First");
	response.sendRedirect("login.jsp");
	return;
} else {
	if(user.getUserType().equals("admin"))
	{
		session.setAttribute("message", "You are not normal !! Do not access this page");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Normal Panel</title>
<style type="text/css">
body{
	background-color: #d1c4e9 !important;
}
</style>
<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp"%>
<h1>Normal</h1>
</body>
</html>