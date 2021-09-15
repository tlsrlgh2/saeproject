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
	
	String pNo = request.getParameter("pNo");
	String pImage = request.getParameter("imageSelector");
	String pName = request.getParameter("pName");
	String pPrice = request.getParameter("pPrice").replaceAll("\\,", "");
	String pContent = request.getParameter("pContent");
	String pAmount = request.getParameter("pAmount");
	
	Connection conn = null;
	PreparedStatement psmt = null;
	
	try{
		conn = DBConnection.getDBconnect();
			if(pImage.equals("")){
			
				conn.setAutoCommit(false);
				String sql = "UPDATE product_tbl SET pname = ? , pprice=? , pcontent = ? , pamount = ? WHERE pno = ? ";
				System.out.println("정상적으로 작동합니다.");
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, pName);
				psmt.setString(2, pPrice);
				psmt.setString(3, pContent);
				psmt.setString(4, pAmount);
				psmt.setString(5, pNo);
				psmt.executeUpdate();
			
			conn.commit();
						
		}else{
				conn.setAutoCommit(false);
				String sql = "UPDATE product_tbl set pimage = ? ,pname = ? ,pprice=?,pcontent = ? , pamount = ? WHERE pno = ? ";	
				psmt = conn.prepareStatement(sql);
			
				psmt.setString(1, pImage);
				psmt.setString(2, pName);
				psmt.setString(3, pPrice);
				psmt.setString(4, pContent);
				psmt.setString(5, pAmount);
				psmt.setString(6, pNo);
			
				psmt.executeUpdate();
			
				conn.commit();
			
		}
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close(psmt, conn);
	}
	
	
	response.sendRedirect("../accountView/account_Product_View.jsp");
	

%>
</body>
</html>