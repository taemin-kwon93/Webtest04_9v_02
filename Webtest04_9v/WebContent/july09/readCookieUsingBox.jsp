<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "util2.CookieBox" %>
<%
	CookieBox cookieBox = new CookieBox(request);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Cookie���</title></head>
<body>
name��Ű = <%= cookieBox.getValue("name") %><br>
<% if(cookieBox.exists("id")){ %>
id ��Ű = <%= cookieBox.getValue("id") %><br>
<% } %>
</body>
</html>