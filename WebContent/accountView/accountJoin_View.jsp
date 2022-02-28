<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Health Mania - accountJoin Page</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/join.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/hover.css">
<script type="text/javascript" src="../script/accountScript.js?ver=1"></script>

</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
    <div id="join_form">
        <h2>파트너사 회원가입</h2>
    </div>
    <form action="../save/account_Save.jsp" onsubmit="return validate()" method="POST" name="frm" id="jform">
        <table class="join">
        
            <tr>
                <th>*아이디</th>
                <td><input type="text" name="id" id="id" class="size"></td>
                <td><input type="button" value="*중복체크" id="idbtn" class="idbtn" onclick="aIdchk()"></td>
                <td><input type="hidden" value="" id="return_chk" class="return_chk"></td>
            </tr>
            <tr>
                <th>*비밀번호</th>
                <td><input type="password" name="userPwd" id="userPwd"  minlength="4" maxlength="12" class="size"  onchange="isSame()"></td>
            </tr>
            <tr>
            	<th colspan="2"><span id="chk_password"></span></th>
            </tr>
            <tr>
                <th>*비밀번호 확인</th>
                <td>
                <input type="password" name="chkPwd" id="chkPwd"  minlength="4" maxlength="12" class="size" onchange="isSame()">
                &nbsp;&nbsp;
                <span id="same">※ 비밀번호는 6~12자로만 입력</span>
                </td>
            </tr>
            <tr>
                <th>*상호명</th>
                <td><input type="text" name="userName" id="userName" class="size"></td>
            </tr>
            <tr>
                <th>*회사이메일</th>
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
                <td colspan="2">
                    <p id="msg">*은 필수 입력 사항입니다.</p>
                </td>
            </tr>
            <tr>
                <td colspan="3">
                    <ul class="btn">
                        <li><input class="bt" type="submit" value="회원가입" onclick="return account_joinChk()"></li>
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