<%@page import="dao.ProjectDAO"%>
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
	Connection conn = null;
	PreparedStatement psmt = null;
	
	String bid = request.getParameter("id"); 
	String bpw = request.getParameter("userPwd");
	
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_bpw = dao.encryption_pw(bpw);
	System.out.println("암호화 시작 : "+new_bpw+" 가입비밀번호");
	
	String bpoint = "2000";
	String bname = request.getParameter("userName");
	String bbirth = request.getParameter("year")+"/"+request.getParameter("month")+"/"+request.getParameter("date");
	String bemail = request.getParameter("email1")+"@"+request.getParameter("email2");
	String btel = request.getParameter("phoneNum1")+"-"+request.getParameter("phoneNum2")+"-"+request.getParameter("phoneNum3");
	String bpostcode = request.getParameter("postcode");
	String baddress = request.getParameter("address");
	String bdetailAddress = request.getParameter("detailAddress");
	String bgender = request.getParameter("gender");
	String bheight = request.getParameter("stature");
	String bweight = request.getParameter("weight");
	
	String sql = "INSERT INTO basic_member_tbl VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	
	try{
		conn = DBConnection.getDBconnect();
		
		conn.setAutoCommit(false);
		
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, bid);
		psmt.setString(2, new_bpw);
		psmt.setString(3, bname);
		psmt.setString(4, bbirth);
		psmt.setString(5, bpoint);		
		psmt.setString(6, bemail);
		psmt.setString(7, btel);
		psmt.setString(8, bpostcode);
		psmt.setString(9, baddress);
		psmt.setString(10, bdetailAddress);
		psmt.setString(11, bgender);
		psmt.setString(12, bheight);
		psmt.setString(13, bweight);
		
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