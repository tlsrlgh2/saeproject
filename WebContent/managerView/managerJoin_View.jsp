<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/join.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/hover.css">
<script type="text/javascript" src="../script/joinScript.js?ver=7"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div id="join_form">
		<h2>관리자 회원가입</h2>
	</div>
		<form action="../save/mJoinSave.jsp" method="POST" onsubmit="return mvalidate()" name="frm" id="jform">
			<table class="join">
				<tr>
					<th>*관리자 가입코드</th>
					<td colspan="2">
						<input type="text" name="code" id="code" class="code_size">
						<input type="button" value="*코드확인" id="idbtn" class="idbtn" onclick="codeChk()" >
						<td><input type="hidden" value="" id="return_chk_code" class="return_chk_code"></td>
					</td>
				</tr>
				<tr>
					<th>*아이디</th>
					<td><input type="text" name="id" id="id"class="size"></td>
					<td><input type="button" value="*중복체크" id="idbtn" class="idbtn" onclick="mIdChk()"></td>
                	<td><input type="hidden" value="" id="return_chk" class="return_chk"></td>
				</tr>
				<tr>
                	<th>*비밀번호</th>
                	<td><input type="password" name="mPwd" id="mPwd" onchange="misSame()" class="size"></td>
            	</tr>
            	<tr>
                	<th>*비밀번호 확인</th>
                	<td>
                	<input type="password" name="mChkPwd" id="mChkPwd" onchange="misSame()" class="size">
                	&nbsp;&nbsp;<span id="same">※ 비밀번호는 6~12자로만 입력</span>
                	</td>
            	</tr>
            	<tr>
                	<th>*이름</th>
                	<td><input type="text" name="mName" id="mName" class="size"></td>
            	</tr>
            	<tr>
                	<th>*이메일</th>
                	<td>
                		<input type="text" name="mEmail1" id="email1" class="size4">
               			 <span>@</span>
               			 <input type="text" name="mEmail2" id="email2" class="size4" readonly>
                		<select name="mEmail3" id="email3" class="size4" onChange="mCheckMail(frm.mEmail3.options[this.selectedIndex].value)">
                			<option value="no" selected>이메일선택</option>
                			<option value="naver.com">네이버</option>
                			<option value="gmail.com">구글</option>
                			<option value="hanmail.net">한메일</option>
                			<option value="nate.com">네이트</option>
                			<option value="input">직접입력</option>
                		</select>
                	</td>
           		 </tr>
            	<tr>
               		 <th>*전화번호</th>
                	<td>
                		<select name="mPhoneNum1" id="phoneNum1" class="size3">
                			<option value="010">010</option>
                			<option value="070">070</option>
                			<option value="02">02</option>
                			<option value="031">031</option>
                			<option value="032">032</option>
                			<option value="033">033</option>
                			<option value="041">041</option>
                			<option value="042">042</option>
                			<option value="043">043</option>
                			<option value="044">044</option>
                			<option value="045">045</option>
                			<option value="051">051</option>
                			<option value="052">052</option>
                			<option value="053">053</option>
                			<option value="054">054</option>
                			<option value="055">055</option>
                			<option value="061">061</option>
                			<option value="062">062</option>
                			<option value="063">063</option>
                			<option value="064">064</option>
                			</select>
                		-
                		<input type="text" name="mPhoneNum2" id="mPhoneNum2" class="size3">
                		-
                		<input type="text" name="mPhoneNum3" id="mPhoneNum3" class="size3">
                	</td>
           		 </tr>
           		 <tr>
                	<td colspan="2">
                    	<p id="msg">*은 필수 입력 사항입니다.</p>
                	</td>
            	</tr>
            	<tr>
                	<td colspan="3">
                    <ul class="btn">
                        <li><input class="bt" type="submit" value="회원가입" onclick="return mjoinChk()"></li>
                        <li><input class="bt" type="reset" value="다시작성"></li>
                    </ul>
                </td>
           	 </tr>
			</table>
		</form>
</section>
<jsp:include page="../include/footer.jsp"/>



</body>
</html>