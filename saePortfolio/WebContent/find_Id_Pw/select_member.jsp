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
<script type="text/javascript" src="../script/find_ID_PW.js?ver=7"></script>
</head>
<body id="find">
<section>
	<div class="Content">
		<fieldset class="Content">
			<legend class="Content">회원 유형을 선택해주세요</legend>
				<form action="select_member_value.jsp" method="POST" name="frm">
					<input type="radio" name="member" id="basic" value="basic"> 일반회원&nbsp;&nbsp;|&nbsp;&nbsp;
					<input type="radio" name="member" id="account" value="account"> 파트너사 &nbsp;&nbsp;|&nbsp;&nbsp;
					<input type="radio" name="member" id="manager" value="manager"> 관리자<br><br>
					<input type="submit" value="확인" class="check2" onclick="return select_chk()">
				</form>	
		</fieldset>
	</div>
</section>
</body>
</html>