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
<script type="text/javascript" src="../script/find_ID_PW.js?ver=6"></script>
<style type="text/css">
</style>
</head>
<body id="find">
<section>
	<div class="Content">
		<fieldset class="Content">
			<form action="find_pw.jsp" method="POST" name="frm">
				<table>
					<tr>
						<th colspan="2" id="select"><h1>회원 PW 찾기</h1></th>
					</tr>
					<tr>
						<th id="select"><p>아이디 입력 해주세요</p></th>
						<th id="select"><input type="text" id="id" name="id"></th>
					</tr>
					<tr>
						<th id="select"><p>핸드폰번호 입력 해주세요</p></th>
						<th id="select">
							<input type="text" id="tel" minlength="9"  maxlength="11" name="tel" onkeydown="chk_tel()" onkeyup="chk_tel()" placeholder="ex) 01012345678">
						</th>
					</tr>
					<tr>
						<th colspan="2" id="select">
						<input type="submit" value="확인" class="check2" onclick="return chk_pw()">
						<input type="button" value="이전" class="check2" onclick="location.href='select_ID_PW.jsp'">
						</th>
					</tr>
				</table>
			</form>
		</fieldset>
	</div>
</section>
</body>
</html>