<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Mania - MemberJoin Page</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/join.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/hover.css">
<script type="text/javascript" src="../script/joinScript.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<section>
    <div id="join_form">
        <h2>일반회원가입</h2>
    </div>
    <form action="../save/joinSave.jsp" onsubmit="return bvalidate()" method="POST" name="frm" id="jform">
        <table class="join">
        
            <tr>
                <th>*아이디</th>
                <td><input type="text" name="id" id="id" class="size"></td>
                <td><input type="button" value="*중복체크" id="idbtn" class="idbtn" onclick="bIdchk()"></td>
                <td><input type="hidden" value="" id="return_chk" class="return_chk"></td>
            </tr>
            <tr>
                <th>*비밀번호</th>
                <td><input type="password" name="userPwd" id="userPwd" class="size" onchange="isSame()"></td>
            </tr>
            <tr>
                <th>*비밀번호 확인</th>
                <td>
                <input type="password" name="chkPwd" id="chkPwd" class="size" onchange="isSame()">
                &nbsp;&nbsp;<span id="same">※ 비밀번호는 6~12자로만 입력</span>
                </td>
            </tr>
            <tr>
                <th>*이름</th>
                <td><input type="text" name="userName" id="userName" class="size"></td>
            </tr>
            <tr>
                <th>*생년월일</th>
                <td>
                	<input type="number" name="year" id="year" class="size2" min="1920" max="2100">년
                	<select name="month" id="month" class="size">
                		<option value="1">1</option>
                		<option value="2">2</option>
                		<option value="3">3</option>
                		<option value="4">4</option>
                		<option value="5">5</option>
                		<option value="6">6</option>
                		<option value="7">7</option>
                		<option value="8">8</option>
                		<option value="9">9</option>
                		<option value="10">10</option>
                		<option value="11">11</option>
                		<option value="12">12</option>
                	</select>월
                	<input type="number" name="date" id="date"value="date" class="size3" min="1" max="31">일
                </td>
            </tr>
            <tr>
                <th>*이메일</th>
                <td>
                <input type="text" name="email1" id="email1" class="size4">
                <span>@</span>
                <input type="text" name="email2" id="email2" class="size4" readonly>
                <select name="emaii3" id="email3" class="size4" onChange="checkMail(frm.email3.options[this.selectedIndex].value)">
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
                <select name="phoneNum1" id="phoneNum1" class="size3">
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
                <input type="text" name="phoneNum2" id="phoneNum2" class="size3">
                -
                <input type="text" name="phoneNum3" id="phoneNum3" class="size3">
                </td>
            </tr>
             <tr>
                <th>*주소</th>
                <td>
                    <input type="text" name="postcode" id="postcode" placeholder="우편번호" class="postcode">
					<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="daumPostcode"><br>
					<input type="text" name="address"id="address" placeholder="주소" class="address"><br>
					<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" class="detailAddress">
					<input type="text" id="extraAddress" placeholder="참고항목" class="extraAddress" readonly>
                </td>
            </tr>
            <tr>
                <th>*성별</th>
                <td>
                    <input type="radio" name="gender" id="gender"  value="m">남성
                    <input type="radio" name="gender" id="gender"  value="w">여성
                </td>
            </tr>
            <tr>
                <th>*키</th>
                <td><input type="number" name="stature" id="stature" class="" min="100" max="300"> cm</td>
            </tr>
            <tr>
                <th>*몸무게</th>
                <td><input type="number" name="weight" id="weight" class="" min="0" max="200"> kg</td>
            </tr>
            
            <tr>
                <td colspan="2">
                    <p id="msg">*은 필수 입력 사항입니다.</p>
                    <p id="msg">회원가입시 2000 Point가 제공 됩니다.</p>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <ul class="btn">
                        <li><input class="bt" type="submit" value="회원가입"></li>
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