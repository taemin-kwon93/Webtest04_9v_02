<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" %>
<! DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α�����</title></head>
<body>
<form action="<%= request.getContextPath() %>/july12/sessionLogin.jsp"
      method="post">
���̵� <input type="text" name="id" size="10">
��ȣ <input type="password" name="password" size="10">
<input type="submit" value="�α���">
</form>

</body>
</html>