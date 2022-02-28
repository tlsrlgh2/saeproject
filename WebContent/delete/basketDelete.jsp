<%@page import="java.sql.ResultSet"%>
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
	String[]num = request.getParameterValues("number");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "DELETE basket_tbl WHERE pno = ?";
	try{
   		conn = DBConnection.getDBconnect();
   		conn.setAutoCommit(false);
   		psmt = conn.prepareStatement(sql);
   		
	for(int i = 0 ; i<num.length; i++){
	   String name =  num [i] ;
	   String pNo = request.getParameter("pNo2"+name);

	   psmt.setString(1, pNo);
	   psmt.executeUpdate();
	   conn.commit();
	   	
	   	}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	response.sendRedirect("../eStore_view/Mybasket_View.jsp");
	

%>
</body>
</html>