<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.DriverManager" %><!--JDBC�� ���� ������ ��Ƽ�� -->
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�����</title>
</head>
<body>
MEMBER ���̺��� ����
<table width="100%" border="1"><!-- ���̺��� �����Ѵ�. ����. �׵θ� -->
<tr><!-- ���̺� ���� ����� -->
	<td>�̸�</td><td>���̵�</td><td>�̸���</td><td>������ư</td><!-- �� �������� �̸�, ���̵�, �̸����� �ִ´�. -->
</tr><!--[�̸�|���̵�|�̸���] �̷������� ����� ���Ŵ�  -->
<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//Class.forName�� �̿��� ����Ŭ����̹���
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:XE";
		String dbUser = "ezz";
		String dbPass="oracle";
		
		String query
		="select * from MEMBER order by MEMBERID";
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt = conn.createStatement();
		rs = stmt.executeQuery(query);
		
		while(rs.next()){
%>
<tr>
	<td><%= rs.getString("NAME") %></td>
	<td><a href="viewMember.jsp?memberID=<%=rs.getString("MEMBERID")%>">
	<%= rs.getString("MEMBERID") %></a></td>
	<td><%= rs.getString("EMAIL") %></td>
	<td><a href="delete_01.jsp?sendid=<%= rs.getString("MEMBERID") %>">����</a></td>
</tr>
<%
		}
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
		if(rs != null)try {rs.close();}catch(SQLException ex){}
		if(stmt != null)try{stmt.close();}catch(SQLException ex){}
		if(conn != null)try{conn.close();}catch(SQLException ex){}
	}

%>

</table>
</body>
</html>