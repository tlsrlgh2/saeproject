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
	String qNo = request.getParameter("qNo2");
	String cNo = request.getParameter("cNo");
	String bid = request.getParameter("bid2");
	String aid = request.getParameter("aid2");
	String mid = request.getParameter("mid2");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "DELETE comment_tbl WHERE cno = ? AND cname= ?";
	
	try{
		
		String cName;
		
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, cNo);
		if(!bid.equals("null")){
			cName = bid;
			psmt.setString(2, cName);
		}else if(!aid.equals("null")){
			cName = aid;
			psmt.setString(2, cName);
		}else if(!mid.equals("null")){
			cName = mid;
			psmt.setString(2, cName);
		}else {
			System.out.println("commentDelete.jsp 에러 발생");
		}
		
		psmt.executeUpdate();
		
		conn.commit();
		
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	String url = "../load/boardLoad.jsp?qno=" + qNo;
	response.sendRedirect(url);
	
%>
</body>
</html>