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
		Connection conn = null;
		PreparedStatement psmt = null;
		
		String id = String.valueOf(session.getAttribute("basicId"));
		
		String sql1 = "DELETE like_tbl WHERE bid = ?";
		
		try{
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql1);
			psmt.setString(1, id);
			int result = psmt.executeUpdate();
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(psmt, conn);
		}
		
		
		String sql2 = "DELETE point_tbl where bid = ? ";
		
		try{
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql2);
			psmt.setString(1, id);
			int result = psmt.executeUpdate();
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(psmt, conn);
		}
		
		
		String sql3 = "DELETE basic_member_tbl WHERE bid = ? " ;
		
		try{
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql3);
			psmt.setString(1, id);
			int result = psmt.executeUpdate();
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(psmt, conn);
		}
		
		String sql4 = "DELETE basket_tbl WHERE bid = ? " ;	
		
		try{
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql4);
			psmt.setString(1, id);
			int result = psmt.executeUpdate();
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(psmt, conn);
		}
		
String sql5 = "DELETE order_tbl WHERE bid = ? " ;	
		
		try{
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql5);
			psmt.setString(1, id);
			int result = psmt.executeUpdate();
			conn.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(psmt, conn);
		}
		
		session.invalidate();
		
		response.sendRedirect("../view/main_View.jsp");
	%>
</body>
</html>