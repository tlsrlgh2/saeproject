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
	String pw = String.valueOf(session.getAttribute("basicPw"));
	String pwChk = request.getParameter("pwChk");
	if(pw.equals(pwChk)){
		out.println("<script>");
		out.println("alert('비밀번호가 일치합니다.')");
		out.println("location.href='../basicView/myPage_View.jsp'");
		out.println("</script>");
	}
	out.println("<script>");
	out.println("alert('비밀번호가 일치하지 않습니다.')");
	out.println("location.href='../basicView/basicMypageCheck_View.jsp'");
	out.println("</script>");
%>
</body>
</html>