<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("euc-kr"); %>

<html>
<head>
<meta charset="EUC-KR">
<title>Expression Language Example02</title>
</head>
<body>
<h3>ǥ����� ����2</h3>
<form action="eLEx2_02.jsp" method="post">
�̸� : <input type="text" name="name" value="${param.name}">
<input type="submit" value="Ȯ��">
</form>
�̸���: ${param.name} �Դϴ�.<br>
�̸���: <%=request.getParameter("name") %> �Դϴ�.
</body>
</html>