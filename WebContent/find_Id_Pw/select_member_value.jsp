<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPageCheck.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPageScript.js"></script>
</head>
<body>
	<%
		String member = request.getParameter("member");
		
		session.setAttribute("member", member);
		System.out.println(member);
		response.sendRedirect("../find_Id_Pw/select_ID_PW.jsp");
		
	%>
</body>
</html>