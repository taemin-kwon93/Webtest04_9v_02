<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<meta charset="EUC-KR">
<title>if �±�</title>
</head>
<body>
<c:if test="true">
�����Ǽ���</c:if><br>
<c:if test="${param.name=='bk'}">
${param.name}�� �̸�</c:if>
<c:if test="${param.age>18}">
${param.age}�� �̴ϱ� ��̳� ���������� ��^��</c:if>
</body>
</html>