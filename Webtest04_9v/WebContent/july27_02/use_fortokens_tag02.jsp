<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>forTokens�±�</title>
</head>
<body>
�޸��� ���� �����ڷ� ���: <br>
<c:forTokens var="token"
			items="����, ��Ȳ, ���, �ʷ�. �Ķ�. ����. ����"
			delims=",.">
${token}
</c:forTokens>
</body>
</html>