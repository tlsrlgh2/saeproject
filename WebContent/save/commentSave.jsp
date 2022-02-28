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
	String qno = request.getParameter("qno");
	String commentWriter = request.getParameter("commentWriter");
	String comment = request.getParameter("comment");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "INSERT INTO comment_tbl VALUES(comment_seq.nextval,?,?,?,to_char(sysdate,'yyyy.mm.dd hh24:mi'))";
		
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, commentWriter);
		psmt.setString(2, qno);
		psmt.setString(3, comment);
		
		int result = psmt.executeUpdate();
		
		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
		String url = "../load/boardLoad.jsp?qno=" + qno;
		response.sendRedirect(url);
	
	%>

</body>
</html>