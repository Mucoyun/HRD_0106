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
		<h2>상품 정보 조회</h2>
		<table id="p_s_table">
			<tr>
				<th width="50">No</th>
				<th width="100">상품코드</th>
				<th width="150">상품명</th>
				<th width="100">가격</th>
				<th width="200">상세정보</th>
				<th width="100">분류</th>
				<th width="100">제조사</th>
				<th width="100">재고수</th>
				<th width="100">상태</th>
				<th width="100">구분</th>
			</tr>
			<%
				int no=0;
				try{
					String sql = "select * from product0106";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String productId = rs.getString(1);
						String productName = rs.getString(2);
						String unitprice = rs.getString(3);
						String description = rs.getString(4);
						String category = rs.getString(5);
						String manufacturer = rs.getString(6);
						String unitsInstock = rs.getString(7);
						String condition = rs.getString(8);
						%>
						<tr>
							<td><%=no %></td>
							<td><%=productId %></td>
							<td><%=productName %></td>
							<td><%=unitprice %></td>
							<td><%=description %></td>
							<td><%=category %></td>
							<td><%=manufacturer %></td>
							<td><%=unitsInstock %></td>
							<td><%=condition %></td>
							<td>
								<a href="/HRD_0106/product0106/product0106_update.jsp?send_productId=<%=productId%>">수정</a> /
								<a href="/HRD_0106/product0106/product0106_delete.jsp?send_productId=<%=productId%>"
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