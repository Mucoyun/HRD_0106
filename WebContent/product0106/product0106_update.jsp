<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		#p_iu_table tr{
			height: 30px;
		}#p_iu_table th{
			width: 200px;
		}#p_iu_table td{
			width: 800px;
		}
		
		#p_iu_table input[type="text"]{
			height: 30px;
			width: 700px;
		}#p_iu_table input[type="number"]{
			height: 30px;
			width: 200px;
		}#p_iu_table input[type="radio"]{
			margin-left: 20px;
		}#p_iu_table .btntd{
			text-align: center;
		}#p_iu_table button{
			height: 30px;
			width: 150px;
		}#p_iu_table .td2{
			height: 30px;
			width: 200px !important;
		}#p_iu_table .td2 > input[type="text"]{
			height: 30px;
			width: 200px !important;
		}
		
	</style>
	<script>
		function check() {
			if(document.p_u_form.productId.value==""){
				alert("상품코드를 입력하세요.");
				document.p_u_form.productId.focus();
			}else if(document.p_u_form.productName.value==""){
				alert("상품명을 입력하세요.");
				document.p_u_form.productName.focus();
			}else if(document.p_u_form.unitprice.value==""){
				alert("가격을 입력하세요.");
				document.p_u_form.unitprice.focus();
			}else{
				document.p_u_form.submit();
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
		String send_productId = request.getParameter("send_productId");
	
		String productId = "";
		String productName = "";
		String unitprice = "";
		String description = "";
		String category = "";
		String manufacturer = "";
		String unitsInstock = "";
		String condition = "";
		
		try{
			String sql = "select * from product0106 where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, send_productId);
			rs = pstmt.executeQuery();
			if(rs.next()){
				productId = rs.getString(1);
				productName = rs.getString(2);
				unitprice = rs.getString(3);
				description = rs.getString(4);
				category = rs.getString(5);
				manufacturer = rs.getString(6);
				unitsInstock = rs.getString(7);
				condition = rs.getString(8);
			}else{
				%><script>
					alert("해당 상품정보가 없습니다.");
					history.back(-1);
				</script><%
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	
	<section>
		<h2>상품 정보 변경 화면</h2>
		<form name="p_u_form" method="post" action="product0106_update_process.jsp">
			<table id="p_iu_table">
				<tr>
					<th>상품코드</th>
					<td colspan="3"><input type="text" name="productId" value="<%=productId %>" readonly></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="3"><input type="text" name="productName" value="<%=productName %>"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td colspan="3"><input type="text" name="unitprice" value="<%=unitprice %>"></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td colspan="3"><input type="text" name="description" value="<%=description %>"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td colspan="3"><input type="text" name="manufacturer" value="<%=manufacturer %>"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td class="td2"><input type="text" name="category" value="<%=category %>"></td>
					<th>재고수</th>
					<td class="td2"><input type="number" name="unitsInstock" value="<%=unitsInstock %>"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="3">
						<input type="radio" name="condition" value="신규제품" <%if(condition.equals("신규제품")){%> checked <%} %>> 신규제품 
						<input type="radio" name="condition" value="중고제품" <%if(condition.equals("중고제품")){%> checked <%} %>> 중고제품
						<input type="radio" name="condition" value="재생제품" <%if(condition.equals("재생제품")){%> checked <%} %>> 재생제품 
					</td>
				</tr>
				<tr>
					<td class="btntd" colspan="4">
						<button type="button" onclick="check();">상품수정</button>
						<button type="button" onclick="retry();">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
