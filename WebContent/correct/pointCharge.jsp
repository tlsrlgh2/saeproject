<%@page import="db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
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
	String bId = request.getParameter("id");
	String afterPoint = request.getParameter("point").replaceAll("\\,", "");
	String pno = request.getParameter("no");
	
	String pResult = "충전완료";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql1 = "UPDATE basic_member_tbl SET bpoint = ? WHERE bid = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql1);
		psmt.setString(1, afterPoint);
		psmt.setString(2, bId);
		psmt.executeUpdate();
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	String sql2 = "UPDATE point_tbl SET presult = ? WHERE pno = ?";
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql2);
		psmt.setString(1, pResult);
		psmt.setString(2, pno);
		psmt.executeUpdate();
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../managerView/manager_Point_View.jsp");
	dispatcher.forward(request, response);
	
%>
</body>
</html>