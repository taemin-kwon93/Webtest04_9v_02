<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Enumeration" %>
	
<html>
<head>
<meta charset="EUC-KR">
<title>�ʱ�ȭ �Ķ���� �о����</title></head>
<body>
�ʱ�ȭ �Ķ���� ���:
<ul>
<%
	Enumeration InitParamEnum = application.getInitParameterNames();
	while (InitParamEnum.hasMoreElements()){
		String initParamName = (String)InitParamEnum.nextElement();
%>
<li><%= initParamName %> =
	<%= application.getInitParameter(initParamName) %>
<%
	}
%>

</ul>
</body>
</html>