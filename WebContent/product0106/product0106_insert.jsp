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
			if(document.p_i_form.productId.value==""){
				alert("상품코드를 입력하세요.");
				document.p_i_form.productId.focus();
			}else if(document.p_i_form.productName.value==""){
				alert("상품명을 입력하세요.");
				document.p_i_form.productName.focus();
			}else if(document.p_i_form.unitprice.value==""){
				alert("가격을 입력하세요.");
				document.p_i_form.unitprice.focus();
			}else{
				document.p_i_form.submit();
			}
		}
		function retry() {
			document.p_i_form.reset();
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>회원 정보 등록 화면</h2>
		<form name="p_i_form" method="post" action="product0106_insert_process.jsp">
			<table id="p_iu_table">
				<tr>
					<th>상품코드</th>
					<td colspan="3"><input type="text" name="productId"></td>
				</tr>
				<tr>
					<th>상품명</th>
					<td colspan="3"><input type="text" name="productName"></td>
				</tr>
				<tr>
					<th>가격</th>
					<td colspan="3"><input type="text" name="unitprice"></td>
				</tr>
				<tr>
					<th>상세정보</th>
					<td colspan="3"><input type="text" name="description"></td>
				</tr>
				<tr>
					<th>제조사</th>
					<td colspan="3"><input type="text" name="manufacturer"></td>
				</tr>
				<tr>
					<th>분류</th>
					<td class="td2"><input type="text" name="category"></td>
					<th>재고수</th>
					<td class="td2"><input type="number" name="unitsInstock"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td colspan="3">
						<input type="radio" name="condition" value="신규제품" checked> 신규제품 
						<input type="radio" name="condition" value="중고제품"> 중고제품
						<input type="radio" name="condition" value="재생제품"> 재생제품 
					</td>
				</tr>
				<tr>
					<td class="btntd" colspan="4">
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
