<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page session="false" %>
<%@ taglib prefix="elfunc" uri="/WEB-INF/el-functions.tld" %>

<%
	java.util.Date today = new java.util.Date();
	request.setAttribute("today", today);
%>
<html>
<head>
<meta charset="EUC-KR">
<title>Expression Language �Լ� ȣ��</title>
</head>
<body>
������<b>${elfunc:dateFormat(today)}</b>�Դϴ�.
</body>
</html>