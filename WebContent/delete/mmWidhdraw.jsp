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
		
		String id = String.valueOf(session.getAttribute("managerId"));
		
		String sql = "DELETE manager_member_tbl WHERE mid = ? " ;
		
		try{
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql);
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