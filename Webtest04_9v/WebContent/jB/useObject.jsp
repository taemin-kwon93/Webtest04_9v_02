<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="member" scope="request"
class="ez2.member.MemberInfo"/>
<html>
<head>
<meta charset="EUC-KR">
<title>�λ縻</title>
</head>
<body>
<%= member.getName() %>(<%= member.getId() %>)ȸ����, �ȳ��ϼ���.
</body>
</html>