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
	String mId = request.getParameter("id");
	String mPw = request.getParameter("mPw");

	System.out.println(mPw);
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_mpw = dao.encryption_pw(mPw);
	System.out.println(new_mpw);
	
	System.out.println("암호화 시작 : "+new_mpw+" 가입비밀번호");
	
	
	String mEmail = request.getParameter("mEmail1")+"@"+request.getParameter("mEmail2");
	String mTel = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+ request.getParameter("phoneNum3");
	
	System.out.println(mId);
	System.out.println(new_mpw);
	System.out.println(mTel);
	System.out.println(mEmail);
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "UPDATE manager_member_tbl SET mtel=?,mPw=?,mEmail=? WHERE mid = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mTel);
		psmt.setString(2, new_mpw);
		psmt.setString(3, mEmail);
		psmt.setString(4, mId);
		
		psmt.executeUpdate();
		
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);	
	}
	session.setAttribute("managerPw", new_mpw);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../view/main_View.jsp");
	dispatcher.forward(request, response);
	%>
</body>
</html>