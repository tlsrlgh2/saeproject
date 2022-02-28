z<%@page import="vo.ProductList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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

//상품 상세보기 불러오는 코드
	String bId = String.valueOf(session.getAttribute("basicId"));
 String pno = request.getParameter("pno");
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	List<ProductList> list = new ArrayList<>();
	
	String sql = "SELECT a.pno,a.pimage,a.aid,a.pname,a.pprice,a.pcontent,a.pamount,a.pbuytotal,b.aname FROM product_tbl a join account_member_tbl b on a.aid = b.aid WHERE a.pno = ?";
	
	try{
		conn = DBConnection.getDBconnect();
		psmt = conn.prepareStatement(sql);
		psmt.setString(1, pno);
		psmt.executeUpdate();
		
		rs = psmt.executeQuery();
		
		while(rs.next()){
			ProductList pl = new ProductList();
			pl.setpNo(rs.getString("pno"));
			pl.setpName(rs.getString("pname"));
			pl.setAname(rs.getString("aname"));
			pl.setaId(rs.getString("aid"));
			pl.setpImage(rs.getString("pimage"));
			pl.setpContent(rs.getString("pcontent"));
			pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
			pl.setpAmount(rs.getString("pamount"));
			pl.setpBuyTotal(rs.getString("pbuytotal"));
			
			list.add(pl);
		}
		
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs, psmt, conn);
	}
	
	request.setAttribute("productDetail",list);
	session.setAttribute("basketList", list);
	
	
	//좋아요수가 있는지 체크하는 메서드
	
	String sql2 = "SELECT bid FROM like_tbl WHERE bid = ? AND pno = ?";
	
	int result = -1;
	
	try{
		conn = DBConnection.getDBconnect();
		psmt = conn.prepareStatement(sql2);
		psmt.setString(1, bId);
		psmt.setString(2, pno);
		
		psmt.executeUpdate();
		rs = psmt.executeQuery();
		
		if(rs.next()) {
			System.out.println("좋아요를 눌렀습니다.");
			result = 0;
		}else {
			System.out.println("좋아요를 누르지 않았습니다.");
			result = 1;
		}
		
	}catch(Exception e){
		
	}finally{
		DBConnection.close(rs, psmt, conn);
	}
	
		request.setAttribute("result", result);
	
	
	//좋아요수 불러오는 코드
	
	String sql3 = "SELECT count(*) FROM like_tbl WHERE pno = ?";
	int count = -1;
	try{
		conn = DBConnection.getDBconnect();
		psmt = conn.prepareStatement(sql3);
		psmt.setString(1, pno);
		rs = psmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt(1);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs, psmt, conn);
	}
	
	request.setAttribute("like",count);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../eStore_view/productDetail.jsp");
	dispatcher.forward(request, response);
%>
</body>
</html>