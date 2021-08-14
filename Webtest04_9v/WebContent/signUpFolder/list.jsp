<%@ page contentType="text/html; charset=euc-kr" %> 
<%@ page import="ez2.logon.*"%>
<%@ page import="java.text.*"%> 
<%@ page import="java.util.*"%>
<%@ include file="color.jsp"%>          
<%!
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%> 
<%
	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1;
	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}
    	
    int startRow = (pageNumber * 10) - 9; 
    int endRow = pageNumber * pageSize; 
    int count = 0;
    int number=0;

    List memberList = null;
    LogonDBBean dbPro = LogonDBBean.getInstance();   
    count = dbPro.selectCount(); 
    if (count > 0) {
    	memberList = dbPro.getMemberList(startRow, endRow);
    }

	number=count-(pageNumber-1)*pageSize;
	
%>

<html>
<head>
<title>ȸ�� ���</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>"> 
<center><b>�۸��(��ü ��:<%=count%>)</b>
<table width="1000">
<tr>
    <td align="right" bgcolor="<%=value_c%>">
    <a href="inputForm.jsp">ȸ������</a>
    </td>
</table>

<%
    if (count == 0) {
%>
<table width="1000" border="1" cellpadding="0" cellspacing="0">
<tr>
    <td align="center">
    ������ ȸ���� �����ϴ�.
    </td>
</tr>    
</table>

<%  } else {    %>
<table border="1" width="1000" cellpadding="0" cellspacing="0" align="center">
    <tr height="30" bgcolor="<%=value_c%>">
      <td align="center"  width="50"  >�� ȣ</td>
      <td align="center"  width="100" >ID</td>
      <td align="center"  width="100" >�̸�</td>
      <td align="center"  width="150" >�ֹι�ȣ</td>
      <td align="center"  width="150" >�̸���</td>
      <td align="center"  width="50" >�����ȣ</td>  
      <td align="center"  width="150" >�ּ�</td> 
      <td align="center"  width="100" >������</td>
      <td align="center"  width="50" >��й�ȣ</td>
      <td align="center"  width="100" >
      ����/����
      </td>
    </tr>
<% 
        for (int i = 0 ; i < memberList.size() ; i++) {
          LogonDataBean article = (LogonDataBean)memberList.get(i);
          
%>
   <tr height="30"> 
    <td align="center"  width="50" > <%=number--%></td>
    <td align="center"  width="100" ><%=article.getId()%></td>
    <td align="center"  width="100"><%=article.getName()%></td>
    <td align="center"  width="150"><%=article.getJumin1()%>-<%=article.getJumin2()%></td>
    <td align="center"  width="150"><%=article.getEmail()%></td>
    <td align="center" width="50" ><%=article.getZipcode()%></td>
    <td align="center"  width="150"><%=article.getAddress()%></td>
    <td align="center" width="100" ><%=sdf.format(article.getReg_date())%></td>
    <td align="center"  width="50"><%=article.getPasswd()%></td>
    <td align="center"  width="100" >
    <a href="modifyForm.jsp?id=<%=article.getId() %>">����</a>/<a href="deletePro.jsp?id=<%=article.getId() %>&passwd=<%=article.getPasswd()%>">����</a>
  </tr>
     <%}%>
</table>
<%}%>
<%--����¡!!! --%>
<%
    if (count > 0) {
    //��ü �������� ���� ����
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);

        int startPage = (int)(pageNumber/5)*5+1; // 11
		int pageBlock=5;
        int endPage = startPage + pageBlock-1; // 11+5-1 =15
        if (endPage > pageCount) endPage = pageCount;
       
        if (startPage > 5) {    %>
        <a href="list.jsp?page=<%= startPage - 5 %>">[����]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        <a href="list.jsp?page=<%= i %>">[<%= i %>]</a>
<%
        }
        if (endPage < pageCount) {  %>
        <a href="list.jsp?page=<%= startPage + 5 %>">[����]</a>
<%
        }
    }
%>
</center>
</body>
</html>
