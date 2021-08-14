<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.net.URLEncoder" %>    
<%
	Cookie cookie1 = new Cookie("path2",URLEncoder.encode("���: /Webtest03_6v/july09/path2", "EUC-KR"));
	cookie1.setPath("/Webtest03_6v/july09/path2");
	response.addCookie(cookie1);
	
	Cookie cookie2 = new Cookie("path3",URLEncoder.encode("���:", "EUC-KR"));
	response.addCookie(cookie2);
	
	Cookie cookie3 = new Cookie("path3",
			URLEncoder.encode("���:/", "EUC-KR"));
	cookie3.setPath("/");
	response.addCookie(cookie3);
	
	Cookie cookie4 = new Cookie("path4",URLEncoder.encode("���: /Webtest03_6v/july09/path3", "EUC-KR"));
	cookie4.setPath("/Webtest03_6v/july09/path3");
	response.addCookie(cookie4);
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��Ű ��� ����</title>
</head>
<body>
������ ���� ��Ű�� �����߽��ϴ�.<br>
<%= cookie1.getName() %> = <%= cookie1.getValue() %>
[<%= cookie1.getPath() %>]
<br>
<%= cookie2.getName() %> = <%= cookie2.getValue() %>
[<%= cookie2.getPath() %>]
<br>
<%= cookie3.getName() %> = <%= cookie3.getValue() %>
[<%= cookie3.getPath() %>]
<br>
<%= cookie4.getName() %> = <%= cookie4.getValue() %>
[<%= cookie4.getPath() %>]
<br>
</body>
</html>