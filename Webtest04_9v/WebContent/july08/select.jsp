<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<! DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>옵션 선택 화면</title></head>
<body>
<form action="<%= request.getContextPath() %>/viewEx.jsp" >

보고싶은 페이지 선택:
	<select name="code">
		<option value="A">A페이지</option>
		<option value="B">B페이지</option>
		<option value="C">C페이지</option>
	</select>
<input type="submit" value="이동">
</form>
</body>
</html>