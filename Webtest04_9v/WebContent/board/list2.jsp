<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="ez2.board.BoardDBBean"%>
<%@ page import="ez2.board.BoardDataBean"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ include file="color.jsp"%>
<!-- �Խ����۾� list���繰-->
<%!
    int pageSize = 5;
    SimpleDateFormat sdf =
        new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>

<%
    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    System.out.println(currentPage);
    int startRow = (currentPage * 5) - 4;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List articleList = null;
    BoardDBBean dbPro = BoardDBBean.getInstance();
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
    }

number=count-(currentPage-1)*pageSize;//�۹�ȣ�� ������� ���Ľ����ش�.
           // 11 -(2-1)*3 =8
%>
<html>
<head>
<title>�Խ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
	<center>
		<b>�۸��(��ü ��:<%=count%>)
		</b>
		<table width="700">
			<tr>
				<td align="right" bgcolor="<%=value_c%>"><a
					href="writeForm.jsp">�۾���</a></td>
		</table>

		<%
    if (count == 0) {
%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">�Խ��ǿ� ����� ���� �����ϴ�.</td>
		</table>

		<%  } else {    %>
		<table border="1" width="700" cellpadding="0" cellspacing="0"
			align="center">
			<tr height="30" bgcolor="<%=value_c%>">
				<td align="center" width="50">�� ȣ</td>
				<td align="center" width="250">�� ��</td>
				<td align="center" width="100">�ۼ���</td>
				<td align="center" width="150">�ۼ���</td>
				<td align="center" width="50">�� ȸ</td>
				<td align="center" width="100">IP</td>
			</tr>
			<% 
        for (int i = 0 ; i < articleList.size() ; i++) {
          BoardDataBean article = (BoardDataBean)articleList.get(i);
%>
			<tr height="30">
				<!-- �� ���� Ŭ���ϸ� ������ ���� â���� �Ѿ -->
				<td align="center" width="50"><%=number--%></td>
				<td width="250">
					<%
      int wid=0;
      if(article.getRe_level()>0){ //�亯���̶��...
        wid=5*(article.getRe_level());
%> <img src="images/level.gif" width="<%=wid%>" height="16"> <img
					src="images/re.gif"> <%}else{%> <img src="images/level.gif"
					width="<%=wid%>" height="16"> <%}%> <a
					href="content.jsp?num=<%=article.getNum()%>&pageNum=<%=currentPage%>">
						<!-- �� ����(article.getSubject) Ŭ���ϸ� content�� �Ѿ�� --> <%=article.getSubject()%></a>
					<% if(article.getReadcount()>=20){%><!-- ��ȸ��20�̻��̸� hot.gif���� --> <img
					src="images/hot.gif" border="0" height="16">
					<%}%>
				</td>
				<td align="center" width="100"><a
					href="mailto:<%=article.getEmail()%>"><%=article.getWriter()%></a></td>
				<td align="center" width="150"><%= sdf.format(article.getReg_date())%></td>
				<td align="center" width="50"><%=article.getReadcount()%></td>
				<td align="center" width="100"><%=article.getIp()%></td>
			</tr>
			<!--  -->
			<%}%>
		</table>
		<%}%>

		<%
    if (count > 0) {//����¡�ڵ� ������
    //��ü �������� ���� ����
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);

        int startPage = (int)(currentPage/5)*5+1;
int pageBlock=5;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
       
        if (startPage > 5) {    %>
		<a href="list.jsp?pageNum=<%= startPage - 5 %>">[����]</a>
		<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
		<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]
		</a>
		<%
        }
        if (endPage < pageCount) {  %>
		<a href="list.jsp?pageNum=<%= startPage + 5 %>">[����]</a>
		<%
        }
    }
%>
	</center>
</body>
</html>