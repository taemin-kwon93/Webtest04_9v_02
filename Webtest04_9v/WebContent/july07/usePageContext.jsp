<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
	
<html>
<head><title>pageContext �⺻ ��ü</title></head>
<body>
<%
	HttpServletRequest httpRequest = (HttpServletRequest)pageContext.getRequest();
%>

request �⺻ ��ü�� pageContext.getRequest�� ���Ͽ���.
<%= request == httpRequest%>
<br>
<% pageContext.getOut().println("hi"); %>

</body>
</html>

<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html> --%>