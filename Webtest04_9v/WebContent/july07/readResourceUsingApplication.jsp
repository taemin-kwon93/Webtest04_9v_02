<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.*" %>
<! DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�⺻ ��ü ����Ͽ� �ڿ��б�</title></head>
<body>
<%
	String resourcePath = "\\july07\\message\\notice\\notice.txt";
%>
�ڿ��� ���� ���;<br>
<%= application.getRealPath(resourcePath) %>
<br>
---------<br>
<%= resourcePath %>�� ����<br>
---------<br>

<%
	BufferedReader br = null;
	char[] buff = new char[512];
	int len = -1;
	
	try{
		br = new BufferedReader(
			new InputStreamReader(
			application.getResourceAsStream(resourcePath) ));
		while((len = br.read(buff))!= -1){
			out.print(new String(buff, 0, len));
		}
	}catch(IOException ex){
		out.println("���� �߻�: "+ex.getMessage());
	}finally{
		if(br != null)try{br.close();}catch(IOException ex){}
	}
%>

</body>
</html>