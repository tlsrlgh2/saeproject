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
	// 멤버조회 라디오 선택 페이지
	String member = request.getParameter("member");
	
	if(member.equals("account")) {
		response.sendRedirect("../load/account_management.jsp");
	}else {
		response.sendRedirect("../load/basic_management.jsp");
	}
	%>
</body>
</html>