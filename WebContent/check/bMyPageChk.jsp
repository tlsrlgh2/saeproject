<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="dao.ProjectDAO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String pw = String.valueOf(session.getAttribute("basicPw"));
	System.out.println(pw+" session값 비밀번호");
	String pwChk = request.getParameter("pwChk");
	
	ProjectDAO dao = ProjectDAO.getInstance();
	String new_pwChk = dao.encryption_pw(pwChk);
	System.out.println("암호화 시작 : "+new_pwChk+" 가입비밀번호");

	System.out.println("순수 입력 pw "+pwChk+" 체크값 비밀번호");
	if(pw.equals(new_pwChk)){
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