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
	<%
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String orderdate = request.getParameter("orderdate");
		String tel = request.getParameter("tel");
		String addr = request.getParameter("addr");
		String pay = request.getParameter("pay");
		String cardno = request.getParameter("cardno");
		String prodcount = request.getParameter("prodcount");
		String total = request.getParameter("total");
		
		int UnitsInstock = 0;
		int Prodcount = 0;
		int updatecount = 0;
		
		try{
			String sql = "select unitsInstock,prodcount from product0106,order0106 where productId=? and id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				UnitsInstock = rs.getInt(1);
				Prodcount = rs.getInt(2);	
			}
			
			updatecount = Prodcount-Integer.parseInt(prodcount)+UnitsInstock;
			System.out.println(updatecount);
			
			sql = "update product0106 set unitsInstock=? where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, updatecount);
			pstmt.setString(2, id);
			pstmt.executeUpdate();
			
			
			sql = "update order0106 set name=?,orderdate=?,addr=?,tel=?,pay=?,cardno=?,prodcount=?,total=? where id=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, orderdate);
			pstmt.setString(3, addr);
			pstmt.setString(4, tel);
			pstmt.setString(5, pay);
			pstmt.setString(6, cardno);
			pstmt.setString(7, prodcount);
			pstmt.setString(8, total);
			pstmt.setString(9, id);
			pstmt.executeUpdate();
			
			%><script>
				alert("주문수정이 완료되었습니다.");
				location.href = "/HRD_0106/order0106/order0106_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>
