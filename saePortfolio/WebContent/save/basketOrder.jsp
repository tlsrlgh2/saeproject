<%@page import="dao.PartnerDAO"%>
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
	request.setCharacterEncoding("UTF-8");

	String bId = String.valueOf(session.getAttribute("basicId"));
	String[]num = request.getParameterValues("num");
	
	PartnerDAO dao = PartnerDAO.getInstance();
	
	String oaddress = dao.getOAddress(bId);
	
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	//1. 포인트 차감 코드
	int basketTotal = Integer.parseInt(request.getParameter("bp"));
	int bPoint = Integer.parseInt(request.getParameter("bPoint"));
	
	int finalPoint = bPoint - basketTotal;
	
	
	String sessionPoint = String.valueOf(finalPoint).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	
	String sql1 = "UPDATE basic_member_tbl SET bpoint=? WHERE bid = ?";

	try{
		conn = DBConnection.getDBconnect();
   		conn.setAutoCommit(false);
   		psmt = conn.prepareStatement(sql1);
   		psmt.setInt(1, finalPoint);
   		psmt.setString(2, bId);
   		session.setAttribute("bPoint",sessionPoint);
   		psmt.executeUpdate();
   		conn.commit();
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.getDBconnect();
	}
	
	//2. 상품 수량 차감 코드	
	String sql2 = "UPDATE product_tbl SET pAmount = ? ,pbuytotal = ? WHERE pno =?";
	
	try{
		conn = DBConnection.getDBconnect();
   		conn.setAutoCommit(false);
   		psmt = conn.prepareStatement(sql2);
	for(int i = 0 ; i<num.length; i++){
	   String name =  num [i] ;
	   
	   String pNo = request.getParameter("pNo"+name);
	   String pAmount = request.getParameter("pAmount"+name);
	   String oAmount = request.getParameter("oAmount"+name);
	   String buytotal = request.getParameter("pbuytotal"+name);
	   
	   int pbuytotal = Integer.parseInt(buytotal) + Integer.parseInt(oAmount);
	   
	   int total = Integer.parseInt(pAmount) - Integer.parseInt(oAmount);
	   
	   psmt.setInt(1, total);
	   psmt.setInt(2,pbuytotal);
	   psmt.setString(3,pNo);
	   psmt.executeUpdate();
	   conn.commit();
	}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.getDBconnect();
	}
	
	
	//3.주문내역에 저장하는 코드
	String sql3 = "INSERT INTO order_tbl VALUES(order_seq.nextval,?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy.mm.dd HH24:MI:SS'))";
	try{
		
   		conn = DBConnection.getDBconnect();
   		conn.setAutoCommit(false);
   		psmt = conn.prepareStatement(sql3);
   		
	for(int i = 0 ; i<num.length; i++){
	   String name =  num [i] ;
	   
	   String pNo = request.getParameter("pNo"+name);
	   String pName = request.getParameter("pName"+name);
	   String pImage = request.getParameter("pImage"+name);
	   String pPrice = request.getParameter("pPrice"+name).replaceAll("\\,", "");
	   String oAmount = request.getParameter("oAmount"+name);
	   String buyPrice = request.getParameter("buyPrice"+name).replaceAll("\\,", "");
	   
	   	psmt.setString(1, bId);
		psmt.setString(2, pNo);
		psmt.setString(3, pImage);
		psmt.setString(4, pName);
		psmt.setString(5, pPrice);
		psmt.setString(6, oaddress);		
		psmt.setString(7, oAmount);
		psmt.setString(8, buyPrice);

	   	psmt.executeUpdate();
	   conn.commit();
	   	
	   	}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	//4.주문한 장바구니를 비우는 메서드
	
	String sql = "DELETE basket_tbl WHERE pno = ?";
	try{
   		conn = DBConnection.getDBconnect();
   		conn.setAutoCommit(false);
   		psmt = conn.prepareStatement(sql);
   		
	for(int i = 0 ; i<num.length; i++){
	   String name =  num [i] ;
	   String pNo = request.getParameter("pNo"+name);

	   psmt.setString(1, pNo);
	   psmt.executeUpdate();
	   conn.commit();
	   	
	   	}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	response.sendRedirect("../eStore_view/pay_Complete.jsp");
	
%>
</body>
</html>