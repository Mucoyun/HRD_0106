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
	<%
		int no=0;
		try{
			String sql = "select count(*) from order0106";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>상품 정보 조회</h2>
		<p id="no">총 <%=no %>개의 주문이 있습니다.</p>
		<table id="o_s_table">
			<tr>
				<th width="100">상품코드</th>
				<th width="100">주문자 이름</th>
				<th width="100">주문날짜</th>
				<th width="200">배달주소</th>
				<th width="200">전화번호</th>
				<th width="100">결제방법</th>
				<th width="100">카드번호</th>
				<th width="100">주문상품수</th>
				<th width="100">판매가격</th>
				<th width="100">총금액</th>
				<th width="100">구분</th>
			</tr>
			<%
				try{
					String sql = "select id,name,orderdate,addr,tel,pay,cardno,prodcount,b.unitprice,total from order0106 a, product0106 b where a.id=b.productId";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						String id = rs.getString(1);
						String name = rs.getString(2);
						String orderdate = rs.getString(3);
						String addr = rs.getString(4);
						String tel = rs.getString(5);
						String pay = rs.getString(6);
						String cardno = rs.getString(7);
						String prodcount= rs.getString(8);
						String unitprice= rs.getString(9);
						String total= rs.getString(10);
						%>
						<tr>
							<td><%=id %></td>
							<td><%=name %></td>
							<td><%=orderdate %></td>
							<td><%=addr %></td>
							<td><%=tel %></td>
							<td><%=pay %></td>
							<td><%=cardno %></td>
							<td><%=prodcount %></td>
							<td><%=unitprice %></td>
							<td><%=total %></td>
							<td>
								<a href="/HRD_0106/order0106/order0106_update.jsp?send_id=<%=id%>&send_name=<%=name%>">수정</a> /
								<a href="/HRD_0106/order0106/order0106_delete.jsp?send_id=<%=id%>"
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