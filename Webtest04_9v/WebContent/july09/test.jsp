<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page import="java.net.URLEncoder" %>
<%
	Cookie cookie1 = new Cookie("id","madvirus");
	cookie1.setDomain(".madvirus.net");
	response.addCookie(cookie1);
	
	Cookie cookie2 = new Cookie("only", "onlycookie");
	response.addCookie(cookie2);
	
	Cookie cookie3 = new Cookie("invalid", "invalidcookie");
	cookie3.setDomain("javacan.tistory.com");
	response.addCookie(cookie3);
	%>
<html>
<head><title>��Ű����</title></head>
<body>
������ ���� ��Ű�� �����߽��ϴ�.<br>
<%= cookie1.getName() %> = <%=cookie1.getValue() %>
[<%=cookie1.getDomain() %>]
<br>
<%= cookie2.getName() %> = <%=cookie2.getValue() %>
[<%=cookie2.getDomain() %>]
<br>
<%= cookie3.getName() %> = <%=cookie3.getValue() %>
[<%=cookie3.getDomain() %>]
</body>
</html>