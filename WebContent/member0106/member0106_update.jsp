<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		#m_iu_table tr{
			height: 30px;
		}#m_iu_table th{
			width: 200px;
		}#m_iu_table td{
			width: 800px;
		}
		
		#m_iu_table input[type="text"]{
			height: 30px;
			width: 250px;
		}#m_iu_table input[type="date"]{
			height: 30px;
			width: 250px;
		}#m_iu_table input[type="password"]{
			height: 30px;
			width: 250px;
		}#m_iu_table input[type="radio"]{
			margin-left: 20px;
		}#m_iu_table select{
			height: 30px;
			width: 200px;
		}#m_iu_table .btntd{
			text-align: center;
		}#m_iu_table button{
			height: 30px;
			width: 150px;
		}
		
	</style>
	<script>
		function check() {
			if(document.m_u_form.id.value==""){
				alert("아이디를 입력하세요.");
				document.m_u_form.id.focus();
			}else if(document.m_u_form.name.value==""){
				alert("이름을 입력하세요.");
				document.m_u_form.name.focus();
			}else if(document.m_u_form.password.value==""){
				alert("패스워드를 입력하세요.");
				document.m_u_form.password.focus();
			}else{
				document.m_u_form.action = "member0106_update_process.jsp";
				document.m_u_form.submit();
			}
		}
		function retry() {
			history.back(-1);
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
	
		String id = "";
		String password = "";
		String name = "";
		String gender = "";
		
		String birth = "";
		String mail = "";
		String phone = "";
		String address = "";
		String nickname = "";
		
		String Mail[] = {};
		String mail1 = "";
		String mail2 = "";
		
		String Phone[] = {};
		String phone1 = "";
		String phone2 = "";
		String phone3 = "";
		
		try{
			String sql = "select id,password,name,gender,to_char(birth,'yyyy-mm-dd'),mail,phone,address,nickname from member0106 where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, send_id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				password = rs.getString(2);
				name = rs.getString(3);
				gender = rs.getString(4);
				birth = rs.getString(5);
				mail = rs.getString(6);
				phone = rs.getString(7);
				address = rs.getString(8);
				nickname = rs.getString(9);
				
				Mail = mail.split("@");
				mail1 = Mail[0];
				mail2 = Mail[1];
				
				Phone = phone.split("-");
				phone1 = Phone[0];
				phone2 = Phone[1];
				phone3 = Phone[2];
				
			}else{
				%><script>
					alert("해당 회원정보가 없습니다.");
					history.back(-1);
				</script><%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>회원 정보 변경 화면</h2>
		<form name="m_u_form" method="post" action="member0106_update.jsp">
			<table id="m_iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" onchange="inid();" value="<%=id%>" readonly></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" value="<%=name%>"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="password" value="<%=password%>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="gender" value="남성" <%if(gender.equals("남성")){%> checked <%} %>> 남 
						<input type="radio" name="gender" value="여성" <%if(gender.equals("여성")){%> checked <%} %>> 여 
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td><input type="date" name="birth" value="<%=birth%>"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input type="text" name="mail1" value="<%=mail1%>"> @
						<select name="mail2">
							<option value="naver.com" <%if(mail2.equals("naver.com")){%> selected <%} %>>naver.com</option>
							<option value="nate.com" <%if(mail2.equals("nate.com")){%> selected <%} %>>nate.com</option>
							<option value="gmail.com" <%if(mail2.equals("gmail.com")){%> selected <%} %>>gmail.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>핸드폰</th>
					<td>
						<select name="phone1">
							<option value="010" <%if(phone1.equals("010")){%> selected <%} %>>010</option>
							<option value="011" <%if(phone1.equals("011")){%> selected <%} %>>011</option>
							<option value="070" <%if(phone1.equals("070")){%> selected <%} %>>070</option>
						</select>-
						<input type="text" name="phone2" value="<%=phone2%>" maxlength="4">-
						<input type="text" name="phone3" value="<%=phone3%>" maxlength="4">
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" value="<%=address%>"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input type="text" name="nickname" value="<%=nickname%>"></td>
				</tr>
				<tr>
					<td class="btntd" colspan="2">
						<button type="button" onclick="check();">회원수정</button>
						<button type="button" onclick="retry();">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
