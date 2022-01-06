<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
</head>
<body>
	<%@ page import="java.sql.*" %>
	<%
		request.setCharacterEncoding("utf-8");
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String url = "jdbc:oracle:thin:@//localhost:1521/xe";
			String user = "system";
			String pwd = "1234";
			String jdbc_dirver = "oracle.jdbc.OracleDriver";
			
			Class.forName(jdbc_dirver);
			
			conn = DriverManager.getConnection(url, user, pwd);
			
			System.out.println("DB OK");
			
		}catch(SQLException e){
			System.out.println("DB NO");
			e.printStackTrace();
		}
	%>
</body>
</html>