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
	request.setCharacterEncoding("UTF-8");	

	String bid = request.getParameter("id");
	String rpt = request.getParameter("point1").replaceAll("\\,", "");
	String bank = request.getParameter("accountNum");
	String afterPoint = request.getParameter("point").replaceAll("\\,", "");
	String presult = "요청중";
	
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String sql = "INSERT INTO point_tbl VALUES(point_seq.nextval,?,?,?,?,?,to_char(sysdate,'yyyy.mm.dd HH24:MI:SS'))";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, bid);
		psmt.setString(2, rpt);
		psmt.setString(3, afterPoint);
		psmt.setString(4, bank);
		psmt.setString(5, presult);
		
		psmt.executeUpdate();
		
		conn.commit();
		
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	response.sendRedirect("../basicView/pointComplete_View.jsp");
	
%>
</body>
</html>