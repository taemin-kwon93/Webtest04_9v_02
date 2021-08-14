<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--list.jsp 13��
request.setAttribute("listModel", articlelistModel); -->
<%--���� �������� html �ҽ� ���⿡�� Ȯ���� �� �ִ�.
html�������� �ҽ����⸦ �Ҷ� 
<!-- -->�� �ּ��� �ҽ��ڵ�� ���̰� �ȴ�.
������ <%-- --%><%--�� �ҽ����⿡�� ������ �ʴ´�. 
--%>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խñ۸��</title>
</head>
<body>
<table border="1">
<c:if test="${listModel.totalPageCount > 0}">
<tr>
	<td colspan="5">
	${listModel.startRow}~${listModel.endRow}&nbsp;&nbsp;&nbsp;
	[${listModel.requestPage}&nbsp;/&nbsp;${listModel.totalPageCount}]
	</td>
</tr></c:if>
<tr>
<td>�۹�ȣ</td>
<td>�� ��</td>
<td>�ۼ���</td>
<td>�ۼ���</td>
<td>��ȸ��</td>
</tr>
<c:choose>
<c:when test="${listModel.hasArticle==false}"><%--�Խñ��� ���°�� --%>
<tr>
<td colspan="5">
�Խñ��� �����ϴ�.
</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach var="article" items="${listModel.articleList}"><%-- �ش� �������� articleList�� �̴� �ݺ����� ������ --%>
<tr>
<td>${article.id}</td>
<td>
<c:if test="${article.level > 0}">
<c:forEach begin="1" end="${article.level}">-</c:forEach>&gt;
</c:if>
<c:set var="query" value="articleId=${article.id}&p=${listModel.requestPage}"/><!-- �信�� �߿��� �ڵ�,
query��� ������ �����ϰ� 'articleId=${article.id}&p=${listModel.requestPage}'��� ������ ��´�. -->
<a href="<c:url value="read.jsp?${query}"/>">${article.title}</a></td><!-- �������� �Է��ϸ� a �±׸� �̿��ؼ� �̵��Ѵ�. -->
<td>${article.writerName}</td>
<td>${article.postingDate}</td>
<td>${article.readCount}</td>
</tr>
</c:forEach><%-- �ش� �������� articleList�� �̴� �ݺ����� �� ���� --%>
<tr>
	<td colspan="5">
	<c:if test="${beginPage > 10}">
		<a href="<c:url value="list.jsp?=p=${beginPage-1}"/>">����</a>
	</c:if>
	<c:forEach var="pno" begin="${beginPage}" end="${endPage}"><!-- �ݺ����� ���� �������� ���-->
	<a href="<c:url value="list.jsp?p=${pno}"/>">[${pno}]</a>
	</c:forEach>
	<c:if test="${endPage < listModel.totalPageCount}">
	<a href="<c:url value="list.jsp?p=${endPage+1}"/>">����</a>
	</c:if>
	</td>
</tr>
</c:otherwise>
</c:choose>
<tr>
<td colspan="5">
<a href="writeForm.jsp">�۾���</a>
</td>
</tr>
</table>
</body>
</html>