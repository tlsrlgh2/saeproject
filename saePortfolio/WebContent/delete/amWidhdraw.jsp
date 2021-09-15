<%@page import="java.util.List"%>
<%@page import="dao.PartnerDAO"%>
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
		Connection conn = null;
		PreparedStatement psmt = null;
		String id = String.valueOf(session.getAttribute("accountId"));
		
		try{
			String sql = "DELETE like_tbl WHERE pno = ?"; 
			
			conn = DBConnection.getDBconnect();
			conn.setAutoCommit(false);
			psmt = conn.prepareStatement(sql);
			
			PartnerDAO dao = PartnerDAO.getInstance();
			List<String> list = dao.getPno(id);
			
			String a = null;
			
			for(String result : list){
				a = result;
				psmt.setString(1,a);
				psmt.executeUpdate();
			}
			 conn.commit();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			DBConnection.close(psmt, conn);
		}
		
		
		String sql1 = "DELETE product_tbl WHERE aid = ?";
		
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
		
		
		String sql2 = "DELETE account_member_tbl WHERE aid = ? " ;
		
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
		
		session.invalidate();
		
		response.sendRedirect("../view/main_View.jsp");
	%>
</body>
</html>