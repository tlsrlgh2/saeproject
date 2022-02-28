<%@page import="db.DBConnection"%>
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
	String aId = request.getParameter("id");
	String aPw = request.getParameter("aPw");
	
	System.out.println(aPw);
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_apw = dao.encryption_pw(aPw);
	System.out.println(new_apw);
	
	System.out.println("암호화 시작 : "+new_apw+" 가입비밀번호");
	
	
	String aEmail = request.getParameter("aEmail1")+"@"+request.getParameter("aEmail2");
	String aTel = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+ request.getParameter("phoneNum3");
	
	System.out.println(aId);
	System.out.println(new_apw);
	System.out.println(aTel);
	System.out.println(aEmail);
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "UPDATE account_member_tbl SET atel=?,aPw=?,aEmail=? WHERE aid = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, aTel);
		psmt.setString(2, new_apw);
		psmt.setString(3, aEmail);
		psmt.setString(4, aId);
		
		psmt.executeUpdate();
		
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);	
	}
	session.setAttribute("accountPw", new_apw);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../view/main_View.jsp");
	dispatcher.forward(request, response);
	%>
</body>
</html>