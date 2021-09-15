<%@page import="db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
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
	String pno = request.getParameter("pno");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	
	//좋아요 테이블 삭제하는 메서드
	String sql1 = "DELETE like_tbl WHERE pno = ?";
		
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql1);
		psmt.setString(1, pno);
		psmt.executeUpdate();
		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	
	
	
	
	//상품테이블 삭제하는 메서드
	String sql2 = "DELETE product_tbl WHERE pno = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql2);
		psmt.setString(1, pno);
		psmt.executeUpdate();
		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	response.sendRedirect("../accountView/account_Product_View.jsp");
%>
</body>
</html>