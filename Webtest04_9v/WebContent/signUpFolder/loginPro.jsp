<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="ez2.logon.LogonDBBean" %>
<%@ page import="util2.CookieBox" %>
<!-- Webtest03_6v -->
<% request.setCharacterEncoding("euc-kr"); %>
<%
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String idchk = request.getParameter("idchk");
	
	LogonDBBean manager = LogonDBBean.getInstance();
	int check = manager.userCheck(id,passwd);
	
	if(check==1){
		session.setAttribute("memId", id);
		if(idchk != null){
			response.addCookie(CookieBox.createCookie("CookiememId", id, "/", 60*30));
		}else{
			response.addCookie(CookieBox.createCookie("CookiememId", "", "/", 0));
		}
		response.sendRedirect("main.jsp");
	}else if(check==0){%>
	<script>
	alert("��й�ȣ�� ���� �ʽ��ϴ�.");
	history.go(-1);
	</script>
<%}else{%>
	<script>
	alert("���̵� ���� �ʽ��ϴ�.");
	history.go(-1);
</script>
<%}%>
