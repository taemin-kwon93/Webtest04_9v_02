<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="EUC-KR">
<title>catch�±�</title>
</head>
<body>
<q.catch var="ex">
name �Ķ������ �� = <%=request.getParameter("name") %>
<% if(request.getParameter("name").equals("test")){ %>
${param.name}�� test�Դϴ�.
<%}%>
</q.catch>
<p>
<q:if test="${ex != null}">
���ܹ߻�<br>
${ex}
</q:if>
</body>
</html>