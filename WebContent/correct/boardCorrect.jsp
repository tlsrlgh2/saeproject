<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="db.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");	
	
	String title = request.getParameter("title");
	String qno = request.getParameter("qno");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "UPDATE qa_tbl SET qtitle=?,qcontent=? WHERE qno = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, title);
		psmt.setString(2, content);
		psmt.setString(3, qno);
		
		psmt.executeUpdate();
		
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);	
	}
	response.sendRedirect("../load/boardLoad.jsp?qno="+qno);
%>
</body>
</html>