<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ez2.model.Message" %>
<%@ page import="ez2.model.MessageListView" %>
<%@ page import="ez2.service.GetMessageListService" %>
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if(pageNumberStr != null){
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	
	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView viewData = messageListService.getMessageList(pageNumber);
%>

<html>
<head>
<meta charset="EUC-KR">
<title>���� �޼��� ���</title>
</head>
<body>
<form action="writeMessage.jsp" method="post">
�̸�:<input type="text" name="guestName" /><br/>
��ȣ:<input type="password" name="password" /><br/>
�޽���:<textarea name="message" cols="30" row="3"></textarea><br/>
<input type="submit" value="�޽��� �����" />
</form>
<hr>
<% if(viewData.isEmpty()){ %>
��ϵ� �޼����� �����ϴ�.
<%}else{  %>
<table border="1">
<%
	for(Message message : viewData.getMessageList()){
%>
<tr>
	<td>
	�޽��� ��ȣ: <%=message.getId()%><br/>
	�մ� �̸�: <%=message.getGuestName() %><br/>
	�޽���: <%=message.getMessage() %><br/>
	<a href="confirmDeletion.jsp?messageId=<%=message.getId()%>">[�����ϱ�]</a>
	</td>
</tr>
<%} %>
</table>
<% for(int i=1; i<=viewData.getPageTotalCount(); i++){ %>
<a href="list.jsp?page=<%=i%>">[<%=i%>]</a>
<%}%>
<%}%>
</body>
</html>