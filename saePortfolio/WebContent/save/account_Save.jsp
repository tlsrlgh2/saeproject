<%@page import="db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="dao.ProjectDAO"%>
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
	
	String aid = request.getParameter("id"); 
	String apw = request.getParameter("userPwd");
	
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_apw = dao.encryption_pw(apw);
	System.out.println("암호화 시작 : "+new_apw+" 가입비밀번호");
	
	String aname = request.getParameter("userName");
	String aemail = request.getParameter("email1") +"@"+request.getParameter("email2");
	String atel = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+request.getParameter("phoneNum3");
	
	String sql = "INSERT INTO account_member_tbl VALUES(?,?,?,?,?)";
	
	try{
		conn = DBConnection.getDBconnect();
		
		conn.setAutoCommit(false);
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, aid);
		psmt.setString(2, new_apw);
		psmt.setString(3, aname);
		psmt.setString(4, aemail);
		psmt.setString(5, atel);
		
		int result = psmt.executeUpdate();
		
		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	response.sendRedirect("../view/main_View.jsp");
%>
</body>
</html>