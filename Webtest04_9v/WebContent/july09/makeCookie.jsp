<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLEncoder" %>
<%
	Cookie cookie = new Cookie("name", URLEncoder.encode("�ֹ���","EUC-KR"));
	response.addCookie(cookie);
%>

<html>
<head><title>��Ű����</title></head>
<body>
<%= cookie.getName() %>��Ű�� �� = "<%= cookie.getValue() %>"
</body>
</html>