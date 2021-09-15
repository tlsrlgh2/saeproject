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
	String bId = String.valueOf(session.getAttribute("basicId"));
	String pno = request.getParameter("pno");
	String sql = "INSERT INTO like_tbl VALUES(?,?)";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, pno);
		psmt.setString(2, bId);
		
		conn.commit();
		
		psmt.executeUpdate();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	response.sendRedirect("../load/productLoad.jsp?pno="+pno);
			

%>
</body>
</html>