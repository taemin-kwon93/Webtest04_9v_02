<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="color.jsp" %>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
function begin(){
	document.myform.id.focus();
}
function checkIt(){
	if(!document.myform.id.value){
		alert("�̸��� �Է����� �����̽��ϴ�.");
		document.myform.id.focus();
		return false;
	}
	if(!document.myform.passwd.value){
		alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
		document.myform.passwd.focus();
		return false;
	}
}
</script>
</head>
<body onload="begin()" bgcolor="<%=bodyback_c%>">
<form name="myform" action="loginPro.jsp" method="post" onSubmit="return checkIt()">
<table cellspacing="1" cellpadding="1" width="260" border="1" align="center">
	<tr height="30">
		<td colspan="2" align="middle" bgcolor="<%=title_c %>"><strong>ȸ���α���</strong></td>
	</tr>
	<tr height="30">
		<td width="110" bgcolor="<%=title_c %>" align="center">���̵�</td>
		<td width="150" bgcolor="<%=value_c %>" align="center">
			<input type="text" name="id" size="15" maxlength="12"></td>
	</tr>
		<tr height="30">
		<td width="110" bgcolor="<%=title_c %>" align="center">��й�ȣ</td>
		<td width="150" bgcolor="<%=value_c %>" align="center">
			<input type="passwd" name="passwd" size="15" maxlength="12"></td>
	</tr>
	<tr height="30">
		<td colspan="2" align="middle" bgcolor="<%=title_c %>">
		<input type="submit" value="�α���">
		<input type="reset" value="�ٽ��Է�">
		<input type="button" value="ȸ������" onclick="javascript:window.location='inputForm.jsp'"></td></tr>
</table>
</form>
</body>
</html>