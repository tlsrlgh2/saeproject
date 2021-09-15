<%@page import="db.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
	request.setCharacterEncoding("UTF-8");

	String pImg = request.getParameter("imageSelector");
	String aId = request.getParameter("aId");
	String pPrice = request.getParameter("pPrice").replaceAll("\\,", "");
	String pContent = request.getParameter("pContent");
	String pName = request.getParameter("pName");
	String pAmount = request.getParameter("pAmount");
	String pBuyTotal = "0";
	
	System.out.println(aId);
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "INSERT INTO product_tbl VALUES(product_seq.nextval,?,?,?,?,?,?,?)";
	
	try{
		conn = DBConnection.getDBconnect();
		
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		
		psmt.setString(1, pImg);
		psmt.setString(2, aId);
		psmt.setString(3, pName);
		psmt.setString(4, pPrice);
		psmt.setString(5, pContent);
		psmt.setString(6, pAmount);
		psmt.setString(7, pBuyTotal);
		
		psmt.executeUpdate();
		
		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	response.sendRedirect("../view/main_View.jsp");
%>
</body>
</html>