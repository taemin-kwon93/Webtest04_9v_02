<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.HashMap" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	HashMap<String, Object> mapData = new HashMap<String,Object>();
	mapData.put("name", "Kwon");
	mapData.put("today", new java.util.Date());
%>
<c:set var="intArray" value="<%=new int[] {1,2,3,4,5}%>"/>
<c:set var="map" value="<%=mapData%>"/>
<html>
<head>
<meta charset="EUC-KR">
<title>forEach �±�</title>
</head>
<body>
<h4>1���� 100���� Ȧ���� ��</h4>
<c:set var="sum" value="0"/>
<c:forEach var="i" begin="1" end="100" step="2">
<c:set var="sum" value="${sum+i}"/>
</c:forEach>
��� = ${sum}
<h4>������:4��</h4>
<ul>
<c:forEach var="i" begin="1" end="9">
<li>4*${i} = ${4*i}
</c:forEach>

<h4>Map</h4>
<c:forEach var="i" items="${map}">
${i.key}=${i.value}<br>
</c:forEach>
</ul>
</body>
</html>