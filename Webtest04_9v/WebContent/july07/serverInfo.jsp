<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
����: <%= application.getServerInfo() %><br>
���� �Ծ� ������: <%= application.getMajorVersion() %><br>
���� �Ծ� ���̳�: <%= application.getMinorVersion()%>
</body>
</html>