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

	String bPoint = request.getParameter("bPoint");
	
	String aName = request.getParameter("aName");
	String aId = request.getParameter("aId");
	String pAmount = request.getParameter("pAmount");
	
	String bId = request.getParameter("bId");
	String pNo = request.getParameter("pNo");
	String pImage = request.getParameter("pImage");
	String pName = request.getParameter("pName");
	String pPrice = request.getParameter("pPrice").replaceAll("\\,", "");
	String oAmount = request.getParameter("buyAmount");
	String buyTotal = request.getParameter("pBuyTotal");
	
	PartnerDAO dao = PartnerDAO.getInstance();
	
	String oaddress = dao.getOAddress(bId);
	
	System.out.println(bId);
	System.out.println(oaddress);
	
	String buyPrice = request.getParameter("buyPrice"); //hidden Type
	
	
	
	
	
	Connection conn = null;
	PreparedStatement psmt= null;
	
	//일반회원 포인트 차감
	String sql1 = "UPDATE basic_member_tbl SET bpoint = ? WHERE bid = ?";
	int totalPrice = Integer.parseInt(bPoint) - Integer.parseInt(buyPrice);
	
	String ttp = String.valueOf(totalPrice).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
	try{
		
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql1);
		psmt.setInt(1, totalPrice);
		session.setAttribute("bPoint", ttp);
		psmt.setString(2, bId);
		psmt.executeUpdate();
		conn.commit();
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	//상품테이블 판매수 증가 및 수량 감소
	
	String sql2 = "UPDATE product_tbl SET pbuytotal = ?,pamount = ? WHERE pNo = ?";
	int pBuyTotal = Integer.parseInt(buyTotal)+Integer.parseInt(oAmount);
	int result = Integer.parseInt(pAmount) - Integer.parseInt(oAmount);
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql2);
		psmt.setInt(1, pBuyTotal);
		psmt.setInt(2, result);
		psmt.setString(3, pNo);
		psmt.executeUpdate();
		conn.commit();
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	//주문내역 테이블 저장
	String sql3 = "INSERT INTO order_tbl VALUES(order_seq.nextval,?,?,?,?,?,?,?,?,to_char(sysdate,'yyyy.mm.dd HH24:MI:SS'))";
	
	try{
		conn = DBConnection.getDBconnect();
		conn.setAutoCommit(false);
		psmt = conn.prepareStatement(sql3);
		psmt.setString(1, bId);
		psmt.setString(2, pNo);
		psmt.setString(3, pImage);
		psmt.setString(4, pName);
		psmt.setString(5, pPrice);
		psmt.setString(6, oaddress);
		psmt.setString(7, oAmount);
		psmt.setString(8, buyPrice);
		psmt.executeUpdate();
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(psmt, conn);
	}
	
	response.sendRedirect("../eStore_view/pay_Complete.jsp");
%>


</body>
</html>