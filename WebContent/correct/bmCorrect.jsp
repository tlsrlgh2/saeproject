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
	String bId = request.getParameter("id");
	String bPw = request.getParameter("bPw");
	
	System.out.println(bPw);
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_bpw = dao.encryption_pw(bPw);
	System.out.println(new_bpw);
	
	System.out.println("암호화 시작 : "+new_bpw+" 가입비밀번호");

	
	String bEmail = request.getParameter("bEmail1")+"@"+request.getParameter("bEmail2");
	String bTel = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+ request.getParameter("phoneNum3");
	String bBirth = request.getParameter("year")+"-"+request.getParameter("month")+"-"+request.getParameter("date");
	String bHeight = request.getParameter("bHeight");
	String bWeight = request.getParameter("bWeight");
	String bpostcode = request.getParameter("postcode");
	String baddress = request.getParameter("address");
	String bdetailAddress = request.getParameter("detailAddress");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String sql = "UPDATE basic_member_tbl SET bpw=?,bemail=?,btel=?,bpostcode=?,baddress=?,bdetailaddress=?,bbirth=?,bheight=?,bweight=? WHERE bid = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, new_bpw);
		psmt.setString(2, bEmail);
		psmt.setString(3, bTel);
		psmt.setString(4, bpostcode);
		psmt.setString(5, baddress);
		psmt.setString(6, bdetailAddress);
		psmt.setString(7, bBirth);
		psmt.setString(8,bHeight);
		psmt.setString(9, bWeight);
		psmt.setString(10, bId);
		
		psmt.executeUpdate();
		
		conn.commit();
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);	
	}
	session.setAttribute("basicPw", new_bpw);
	session.setAttribute("basicWeight",bWeight);
	session.setAttribute("basicHeight",bHeight);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../view/main_View.jsp");
	dispatcher.forward(request, response);
	%>
</body>
</html>