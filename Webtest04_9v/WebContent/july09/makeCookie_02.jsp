<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.net.URLDecoder"%>

<%
	Cookie cookie1 = new Cookie("name", URLEncoder.encode("���¹�", "EUC-KR"));
	response.addCookie(cookie1);
%>

<html>
<head>
<meta charset="EUC-KR">
<title>makeCookie</title></head>
<body>
������ ��Ű ���� name=<%= cookie1.getName() %>, value= <%= URLDecoder.decode(cookie1.getValue(), "EUC-KR") %>
</body>
</html>