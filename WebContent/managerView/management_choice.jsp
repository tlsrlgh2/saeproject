<%@page import="vo.BasicMemberInfo"%>
<%@page import="vo.AccountMemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.AccountMemberInfo"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProjectDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/management_choice.css?ver=6">
<link type="text/css" rel="stylesheet" href="../css/include.css">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">	
	<div class="Content">
		<h2>회원 관리 페이지</h2>
			<form action="../managerView/manager_choice.jsp" method="POST" id="radio">
				<input type="radio" value="basic"  name="member" id="member" checked="checked">일반 회원&nbsp;&nbsp;
				<input type="radio" value="account" name="member" id="member">파트너사&nbsp;&nbsp;
				<input type="submit" value="조회">&nbsp;&nbsp;
			</form>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>