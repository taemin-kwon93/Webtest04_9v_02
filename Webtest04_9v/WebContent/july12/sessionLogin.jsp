<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	if(id.equals(password)){
		session.setAttribute("MEMBERID", id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ����</title>
</head>
<body>
�α��ο� �����߽��ϴ�.
</body>
</html>
<%
	}else{//�α��� ���н�
%>
<script>
alert("�α��� ����");
history.go(-1);
</script>
<%
	}
%>