<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = (memberId == null? false:true);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α��� ���� �˻�</title>
</head>
<body>
<%
	if(login){
%>
���̵� "<%= memberId %>"�� �α��� �߽��ϴ�.
<%
	}else{
%>
�α����� �ȵƽ��ϴ�.
<%
	}
%>
</body>
</html>