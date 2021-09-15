<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPageCheck.css?ver=5">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPageScript.js?ver=1"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Content">
		<fieldset>
			<%if(session.getAttribute("basicId")!=null) {%>
				<%System.out.println(session.getAttribute("basic")); %>
				<%System.out.println(session.getAttribute("accountId")); %>
				<%System.out.println(session.getAttribute("managerId")); %>
			<form action="../check/bMyPageChk.jsp" method="post" name="frm">
				<legend>MyPage</legend>
				<p>비밀번호 확인</p>
				<input type="password" name="pwChk" placeholder="비밀번호를 입력하세요.">
				<br>
				<input type="submit" value="확인" class="check" onclick="return myPageNullChk()">
			</form>
			<%} else if(session.getAttribute("accountId")!=null) {%>
			<%System.out.println(session.getAttribute("basic")); %>
				<%System.out.println(session.getAttribute("accountId")); %>
				<%System.out.println(session.getAttribute("managerId")); %>
			<form action="../check/aMyPageChk.jsp" method="post" name="frm">
				<legend>MyPage</legend>
				<p>비밀번호 확인</p>
				<input type="password" name="pwChk" placeholder="비밀번호를 입력하세요.">
				<br>
				<input type="submit" value="확인" class="check" onclick="return myPageNullChk()">
			</form>
			<%} else if(session.getAttribute("managerId")!=null) {%>
			<%System.out.println(session.getAttribute("basic")); %>
				<%System.out.println(session.getAttribute("accountId")); %>
				<%System.out.println(session.getAttribute("managerId")); %>
			<form action="../check/mMyPageChk.jsp" method="post" name="frm">
				<legend>MyPage</legend>
				<p>비밀번호 확인</p>
				<input type="password" name="pwChk" placeholder="비밀번호를 입력하세요.">
				<br>
				<input type="submit" value="확인" class="check" onclick="return myPageNullChk()">
			</form>
			<%}%>
		</fieldset>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>