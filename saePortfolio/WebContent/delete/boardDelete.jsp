<%@page import="jdk.nashorn.internal.ir.SetSplitState"%>
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
	String qno = request.getParameter("qno");

	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql2 = "DELETE comment_tbl WHERE qno = ?";
	
try{
		
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql2);
		psmt.setString(1, qno);
		int result = psmt.executeUpdate();
		conn.commit();
		
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	String sql = "DELETE qa_tbl WHERE qno = ?";
	
	try{
		
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, qno);
		int result = psmt.executeUpdate();
		conn.commit();
		
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	
	response.sendRedirect("../view/freeBoard_View.jsp");
%>
</body>
</html>