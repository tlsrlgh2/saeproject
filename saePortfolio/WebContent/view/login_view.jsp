<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css?ver=5">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=3">
<link type="text/css" rel="stylesheet" href="../css/login.css?ver=1">
<script type="text/javascript" src="../script/loginScript.js?ver=3"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<section>
    <div id="login_form">
        <h2>회원유형</h2>
    </div>
        <form action="../check/loginCheck.jsp" method="POST" name="frm">
            <ul class="select_mem">
                <li>
                    <span style="color: white;">일반 회원</span> 
                    <input type="radio" name="memberType" id="memberType" value="basic" class=""> 
                </li>
                <li><span style="color: white;"> | </span></li>
                <li>
                    <span style="color: white;">거래처 회원</span>
                    <input type="radio" name="memberType" id="memberType" value="account" class="">
                </li>
                <li><span style="color: white;"> | </span></li>
                <li>
                    <span style="color: white;">관리자</span>
                    <input type="radio" name="memberType" id="memberType" value="manager" class="">
                </li>
            </ul>

            <ul class="input_login">
                <li><input type="text" name="memberId" id="memberId" class="size" placeholder="아이디"></li>
                <li><input type="password" name="memberPw" id="memberPw" class="size" placeholder="비밀번호"></li>
                <li><input type="submit" value="로그인" onclick="return loginChk()"  ></li>
            </ul>
        </form>
        <div class="join"><a href="../view/joinSelect_view.jsp">회원가입</a>&nbsp; | &nbsp;<a class="joinBox" onclick="find_id_pw()" id="find_id_pw">ID/PW찾기</a></div>
</section>	

<jsp:include page="../include/footer.jsp"/>

</body>
</html>