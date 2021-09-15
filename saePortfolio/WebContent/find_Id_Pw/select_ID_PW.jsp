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
<body id="find">
<section>
	<div class="Content">
		<fieldset class="Content">
			<legend class="Content">회원 ID / PW 찾기</legend>
			<input type="button" value="ID찾기" class="check3" onclick="location.href='select_id.jsp'">
			<span>&nbsp;&nbsp;|&nbsp;&nbsp;</span>
			<input type="button" value="PW찾기" class="check3" onclick="location.href='select_pw.jsp'"><br><br>
			<input type="button" value="이전" class="check2" onclick="location.href='select_member.jsp'">
		</fieldset>
	</div>
</section>
</body>
</html>