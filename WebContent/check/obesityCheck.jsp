<%@page import="java.util.ArrayList"%>
<%@page import="vo.ObesityInfo"%>
<%@page import="java.util.List"%>
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
	
	String bWeight = request.getParameter("bweight");
	String bHeight = request.getParameter("bheight");
	
	Double weight = Double.parseDouble(bWeight);
	Double height = Double.parseDouble(bHeight);
	Double height2 = Double.parseDouble(bHeight)/100;
	
	
	
	Double bmi = weight/(height2*height2);
	
	Double result =  Math.round(bmi*100)/100.0;
	
	Double standardWeight = (height-100)*0.9;
	Double result2 =  Math.round(standardWeight*100)/100.0;
	
	
	System.out.println(result);
	System.out.println(standardWeight);
	
		List<ObesityInfo> list = new ArrayList<>();
	
		ObesityInfo oi = new ObesityInfo();
	
		oi.setBmi(result);
		oi.setStandardWeight(result2);
	
		list.add(oi);
	
		session.setAttribute("oInfo", list);
	
		response.sendRedirect("../basicView/obesity_View.jsp");
	
	%>
</body>
</html>