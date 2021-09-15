<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBConnection"%>
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
	
	String mId = request.getParameter("id"); 
	String mPw = request.getParameter("mPwd");
	
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_mPw = dao.encryption_pw(mPw);
	System.out.println("암호화 시작 : "+new_mPw+" 가입비밀번호");
	
	String mName = request.getParameter("mName");
	String mEmail = request.getParameter("mEmail1")+"@"+request.getParameter("mEmail2");
	String mTel = request.getParameter("mPhoneNum1")+"-"+request.getParameter("mPhoneNum2")+"-"+request.getParameter("mPhoneNum3");
	
	
	String sql = "INSERT INTO manager_member_tbl VALUES(?,?,?,?,?)";
	
	try{
		conn = DBConnection.getDBconnect();
		
		conn.setAutoCommit(false);
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, mId);
		psmt.setString(2, new_mPw);
		psmt.setString(3, mName);
		psmt.setString(4, mEmail);
		psmt.setString(5, mTel);
	
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