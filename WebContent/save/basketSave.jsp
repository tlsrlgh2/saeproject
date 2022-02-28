<%@page import="db.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProductList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int oAmount = Integer.parseInt(request.getParameter("oAmount"));
	String bId = String.valueOf(session.getAttribute("basicId"));
	List<ProductList> list = (ArrayList)session.getAttribute("basketList");
	String pNo = null;
	int pPrice = 0;
	for(ProductList pl : list){
		pNo = pl.getpNo();
		pPrice = Integer.parseInt(pl.getpPrice().replaceAll("\\,", ""));
	}
	
	int totalPrice = oAmount * pPrice;
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "INSERT INTO basket_tbl VALUES(?,?,?,?,?)";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, bId);
		psmt.setString(2, pNo);
		psmt.setInt(3, oAmount);
		psmt.setInt(4, pPrice);
		psmt.setInt(5, totalPrice);
		psmt.executeUpdate();
		
		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	response.sendRedirect("../eStore_view/basket_Choice.jsp");
	
%>
</body>
</html>