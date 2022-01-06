<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title></title>
	<style>
		#o_iu_table tr{
			height: 40px;
		}#o_iu_table th{
			width: 200px;
		}#o_iu_table td{
			width: 300px;
		}
		
		#o_iu_table input[type="text"]{
			height: 40px;
			width: 300px;
		}#o_iu_table input[type="number"]{
			height: 40px;
			width: 300px;
		}#o_iu_table input[type="date"]{
			height: 40px;
			width: 300px;
		}#o_iu_table input[type="radio"]{
			margin-left: 20px;
		}#o_iu_table .btntd{
			text-align: center;
		}#o_iu_table button{
			height: 40px;
			width: 150px;
		}#o_iu_table .td2 [type="text"]{
			height: 40px;
			width: 100%;
		}
		
	</style>
	<script>
		function check() {
			if(document.o_u_form.id.value==""){
				alert("상품코드를 입력하세요.");
				document.o_u_form.id.focus();
			}else if(document.o_u_form.name.value==""){
				alert("주문자 이름을 입력하세요.");
				document.o_u_form.name.focus();
			}else if(document.o_u_form.addr.value==""){
				alert("가격을 입력하세요.");
				document.o_u_form.addr.focus();
			}else{
				document.o_u_form.submit();
			}
		}
		function retry() {
			location.href="/HRD_0106/order0106/order0106_select.jsp";
		}
		
		function inid() {
			document.o_u_form.submit();
		}
		
		function cnc1() {
			document.o_u_form.cardno.value="";
			document.o_u_form.cardno.readOnly=true;
		}
		function cnc2() {
			document.o_u_form.cardno.value="";
			document.o_u_form.cardno.readOnly=false;
			
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_id = request.getParameter("send_id");
		String send_name = request.getParameter("send_name");
	
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String orderdate = request.getParameter("orderdate");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String pay = request.getParameter("pay");
		String cardno = request.getParameter("cardno");
		String prodcount = request.getParameter("prodcount");
		String total = request.getParameter("total");
		
		String unitprice = "0";
		int unitsInstock = 0;
		
		try{
			if(send_id!=null){
				String sql = "select id,name,to_char(orderdate,'yyyy-mm-dd'),tel,addr,pay,cardno,prodcount,total from order0106 where id=? and name=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, send_id);
				pstmt.setString(2, send_name);
				rs = pstmt.executeQuery();
				if(rs.next()){
					id = rs.getString(1);
					name = rs.getString(2);
					orderdate = rs.getString(3);
					tel = rs.getString(4);
					addr = rs.getString(5);
					pay = rs.getString(6);
					cardno = rs.getString(7);
					prodcount = rs.getString(8);
					total = rs.getString(9);
					
				}else{
					%><script>
						alert("해당 주문정보가 없습니다.");
						history.back(-1);
					</script><%
				}
			}
		
			String sql = "select productId,unitprice,unitsInstock from product0106 where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				id = rs.getString(1);
				unitprice = rs.getString(2); 
				unitsInstock = rs.getInt(3);
				System.out.println("prodcount : "+prodcount);
				System.out.println("unitsInstock : "+unitsInstock);
				if(id!=null&&prodcount!=null&&(Integer.parseInt(prodcount)+unitsInstock)<0){
					%><script>
						alert("재고수보다 많습니다.");
						inid();
					</script><%
					prodcount=Integer.toString(unitsInstock);
				}else{
					%><script>
						//alert("상품코드가 선택되었습니다.");
						inid();
					</script><%
				}
			}else{
				System.out.println(prodcount);
				System.out.println(unitsInstock);
				
				if(id!=null&&prodcount!=null){
					%><script>
						alert("상품코드를 먼저 입력하세요.");
						inid();
					</script><%
					prodcount="0";
				}else if(id!=null&&prodcount==null){
					%><script>
						alert("등록되지 않은 상품코드입니다.");
						inid();
					</script><%
					id="";
				}else{
					id="";
				}
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(id==null){ id=""; }
		if(name==null){ name=""; }
		if(orderdate==null){ orderdate="2022-01-06"; }
		if(tel==null){ tel=""; }
		if(addr==null){ addr=""; }
		if(pay==null){ pay=""; }
		if(cardno==null){ cardno=""; }
		if(prodcount==null){ prodcount="0"; }
	
		if(total==null){ total="0"; }
		else{ total = Integer.toString(Integer.parseInt(prodcount)*Integer.parseInt(unitprice)); }
	%>
	
	<section>
		<h2>회원 정보 등록 화면</h2>
		<form name="o_u_form" method="post" action="order0106_update.jsp">
			<table id="o_iu_table">
				<tr>
					<th>상품코드</th>
					<td><input type="text" name="id" value="<%=id %>" onchange="inid();" readonly></td>
					<th>주문자 이름</th>
					<td><input type="text" name="name" value="<%=name %>" readonly></td>
				</tr>
				<tr>
					<th>주문 날짜</th>
					<td><input type="date" name="orderdate" value="<%=orderdate %>"></td>
					<th>전화 번호</th>
					<td><input type="text" name="tel" value="<%=tel %>"></td>
				</tr>
				<tr>
					<th>배달 주소</th>
					<td class="td2" colspan="3"><input type="text" name="addr" value="<%=addr %>"></td>
				</tr>
				<tr>
					<th>결제방법</th>
					<td>
						<input type="radio" name="pay" value="1" checked onclick="cnc1();"> 현금 
						<input type="radio" name="pay" value="2" onclick="cnc2();"> 카드
					</td>
					<th>카드번호</th>
					<td><input type="text" name="cardno" value="<%=cardno %>" readonly></td>
				</tr>
				<tr>
					<th>주문상품수</th>
					<td><input type="number" name="prodcount" value="<%=prodcount %>"  onchange="inid();"></td>
					<th>주문금액</th>
					<td><input type="number" name="total" value="<%=total %>" readonly></td>
				</tr>
				<tr>
					<td class="btntd" colspan="4">
						<button type="button" onclick="check();">주문수정</button>
						<button type="button" onclick="retry();">뒤로</button>
					</td>
				</tr>
			</table>
		</form>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>
