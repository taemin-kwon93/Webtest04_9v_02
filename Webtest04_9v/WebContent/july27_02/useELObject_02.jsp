<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setAttribute("name", "�ֹ���"); %>

<html>
<head>
<meta charset="EUC-KR">
<title>Expression Language Example</title>
</head>
<body>
��û URI: ${pageContext.request.requestURI}<br>
request�� name �Ӽ�: ${requestScope.name}<br>
code �Ķ����: ${param.code}
</body>
</html>