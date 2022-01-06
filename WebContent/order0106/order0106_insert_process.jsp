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
		int unitsInstock = 0;
		int updatecount = 0;
		
		try{
			String sql = "insert into order0106 values(?,?,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			pstmt.setString(3, orderdate);
			pstmt.setString(4, addr);
			pstmt.setString(5, tel);
			pstmt.setString(6, pay);
			pstmt.setString(7, cardno);
			pstmt.setString(8, prodcount);
			pstmt.setString(9, total);
			pstmt.executeUpdate();
			
			
			sql = "select unitsInstock from product0106 where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()){
				unitsInstock = rs.getInt(1);
			}
			updatecount = unitsInstock - Integer.parseInt(prodcount);
			System.out.println(updatecount);
			sql = "update product0106 set unitsInstock=? where productId=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, updatecount);
			pstmt.setString(2, id);
			
			%><script>
				alert("주문이 완료되었습니다.");
				location.href = "/HRD_0106/order0106/order0106_select.jsp";
			</script><%
			
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
</body>
</html>
