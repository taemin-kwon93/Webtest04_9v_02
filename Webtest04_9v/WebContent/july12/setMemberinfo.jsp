<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date time = new Date();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
	session.setAttribute("MEMBERID", "kwon");
	session.setAttribute("NAME", "taemin");
	session.setMaxInactiveInterval(2);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>���ǿ� ���� ����ϱ�</title>
</head>
<body>
���ǿ� ������ �����Ͽ����ϴ�.<br>

<%
    Object lobj_getdata = session.getAttribute("MEMBERID");
    String ls_getdata = (String)lobj_getdata;
    out.println("������ ���ǰ� [1] �� " + ls_getdata + "<br/><br/>");
%>


<% time.setTime(session.getCreationTime());%><br>
���� �����ð�: <%= sdf.format(time) %><br>
<% time.setTime(session.getLastAccessedTime()); %>
���� ������ ���ٽð�: <%= sdf.format(time) %><br>



</body>
</html>