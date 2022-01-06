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
			if(document.m_i_form.id.value==""){
				alert("아이디를 입력하세요.");
				document.m_i_form.id.focus();
			}else if(document.m_i_form.name.value==""){
				alert("이름을 입력하세요.");
				document.m_i_form.name.focus();
			}else if(document.m_i_form.password.value==""){
				alert("패스워드를 입력하세요.");
				document.m_i_form.password.focus();
			}else{
				document.m_i_form.action = "member0106_insert_process.jsp";
				document.m_i_form.submit();
			}
		}
		function retry() {
			document.m_i_form.reset();
		}
		function inid() {
			document.m_i_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String password = request.getParameter("password");
		String gender = request.getParameter("gender");
		String birth = request.getParameter("birth");
		String mail1 = request.getParameter("mail1");
		String mail2 = request.getParameter("mail2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String address = request.getParameter("address");
		String nickname = request.getParameter("nickname");
		
		try{
			String sql = "select id from member0106 where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				%><script>
					alert("이미 사용중인 아이디 입니다.");
					inid();
				</script><%
				id="";
			}else{
				if(id!=null){
					%><script>
						alert("사용가능한 아이디 입니다.");
						inid();
					</script><%
				}else{
					id="";
				}
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(id==null){ id=""; }
		if(name==null){ name=""; }
		if(password==null){ password=""; }
		if(gender==null){ gender="남성"; }
		if(birth==null){ birth="2022-01-06"; }
		if(mail1==null){ mail1=""; }
		if(mail2==null){ mail2="naver.com"; }
		if(phone1==null){ phone1="010"; }
		if(phone2==null){ phone2=""; }
		if(phone3==null){ phone3=""; }
		if(address==null){ address=""; }
		if(nickname==null){ nickname=""; }
	%>
	<section>
		<h2>회원 정보 등록 화면</h2>
		<form name="m_i_form" method="post" action="member0106_insert.jsp">
			<table id="m_iu_table">
				<tr>
					<th>아이디</th>
					<td><input type="text" name="id" onchange="inid();" value="<%=id%>"></td>
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
						<button type="button" onclick="check();">회원등록</button>
						<button type="button" onclick="retry();">다시작성</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
