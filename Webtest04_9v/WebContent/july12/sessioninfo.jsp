<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page session="true" %><!-- �⺻ ������ true�̴�. false���� �ٰ� �ƴ϶�� �����ص� �����ϴ�. -->
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat formatter= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��������</title>
</head>
<body>
����ID: <%= session.getId() %><br>

<%
	time.setTime(session.getCreationTime());
%>
���ǻ����ð�: <%= formatter.format(time) %><br>
<%
	time.setTime(session.getLastAccessedTime());
%>
�ֱ����ٽð�: <%= formatter.format(time) %><br>
</body>
</html>