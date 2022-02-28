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
	String category = request.getParameter("category");
	String writer = request.getParameter("writer");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "INSERT INTO qa_tbl VALUES (QA_SEQ.nextval,?,?,?,?,to_char(sysdate,'yyyy.mm.dd HH24:MI:SS'))";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, category);
		psmt.setString(2, writer);
		psmt.setString(3, title);
		psmt.setString(4, content);
		psmt.executeUpdate();
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	response.sendRedirect("../view/freeBoard_View.jsp");
%>
</body>
</html>