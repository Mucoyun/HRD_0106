<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>회원 정보 조회</h2>
		<table id="m_s_table">
			<tr>
				<th width="100">Id</th>
				<th width="100">성명</th>
				<th width="100">패스워드</th>
				<th width="50">성별</th>
				<th width="200">생년월일</th>
				<th width="200">이메일</th>
				<th width="200">휴대폰</th>
				<th width="200">주소</th>
				<th width="100">닉네임</th>
				<th width="100">구분</th>
			</tr>
			<%
				try{
					String sql = "select * from member0106";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String password = rs.getString(2);
						String name = rs.getString(3);
						String gender = rs.getString(4);
						String birth = rs.getString(5);
						String mail = rs.getString(6);
						String phone = rs.getString(7);
						String address = rs.getString(8);
						String nickname = rs.getString(9);
						%>
						<tr>
							<td><%=id %></td>
							<td><%=name %></td>
							<td><%=password %></td>
							<td><%=gender %></td>
							<td><%=birth %></td>
							<td><%=mail %></td>
							<td><%=phone %></td>
							<td><%=address %></td>
							<td><%=nickname %></td>
							<td>
								<a href="/HRD_0106/member0106/member0106_update.jsp?send_id=<%=id%>">수정</a> /
								<a href="/HRD_0106/member0106/member0106_delete.jsp?send_id=<%=id%>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){
									return false }">삭제</a>
							</td>
						</tr>
						<%
					}
					
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>