<%@ page contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import ="util2.CookieBox" %>
<%
	response.addCookie(CookieBox.createCookie("name", "�ֹ���"));
	response.addCookie(CookieBox.createCookie("id", "madvirus", "/july09", -1));
	response.addCookie(CookieBox.createCookie("kwon","KTM"));
	
%>
<html>
<head>
<meta charset="EUC-KR">
<title>CookieBox��뿹</title></head>
<body>
CookieBox�� ����Ͽ� ��Ű ����
</body>
</html>