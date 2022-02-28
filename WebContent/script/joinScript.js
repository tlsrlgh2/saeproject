// 0. 일반회원가입 - 이메일 직접입력 메서드 - 전준표

function checkMail(value){

		var  email2 = frm.email2;

		if( value == 'no'){

			email2.value = '';

			email2.readOnly=true;

			return;

		} else if(value == 'input' ){

			email2.value = '';

			email2.readOnly=false;

			email2.focus();

			return;

		} else {

			email2.value = value;

			email2.readOnly = true;

		}

	}

//2. 일반회원 - 중복확인 메서드 - 전준표
function bIdchk(){
	if(document.frm.id.value == ''){
		alert("아이디를 먼저 입력해주세요.")
		document.frm.id.focus();
	}else{
		window.open("../check/allselect_Check.jsp?id="+document.frm.id.value,"","width=500, height=300");
	}
}


//4. 관리자회원 - 가입코드 체크 - 전준표
function codeChk(){
	if(document.frm.code.value == ''){
		alert("가입코드를 먼저 입력해주세요.");
		document.frm.code.focus();
	}else{
		window.open("../check/mCodeCheck.jsp?code="+document.frm.code.value,"","width=500, height=300");
	}
}


// 5. 관리자 회원 - 아이디 중복체크 - 전준표
function mIdChk(){
	if(document.frm.id.value == ''){
		alert("아이디를 먼저 입력해주세요.");
		document.frm.id.focus();
	}else{
		window.open("../check/allselect_Check.jsp?id="+document.frm.id.value,"","width=500, height=300");
	}
}

// 6. 일반회원 비밀번호 - 일치 불일치 실시간 구현 메서드 - 전준표
function isSame() {
	    var pw = document.frm.userPwd.value;
	    var confirmPW = document.frm.chkPwd.value;
	    if (pw.length < 6 || pw.length > 16) {
	        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	        document.getElementById('userPwd').value=document.getElementById('chkPwd').value='';
	        document.getElementById('same').innerHTML='';
	    }
	    if(document.getElementById('userPwd').value!='' && document.getElementById('chkPwd').value!='') {
	        if(document.getElementById('userPwd').value==document.getElementById('chkPwd').value) {
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.fontSize='9pt';
	            document.getElementById('same').style.color='white';
	            
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.fontSize='9pt';
	            document.getElementById('same').style.color='white';
	        }
	    }else {
			document.getElementById('same').innerHTML='※ 비밀번호는 6~12자로만 입력.';
			document.getElementById('same').style.fontSize='9pt';
			document.getElementById('same').style.color='white';
		}
	}
	
//7. 관리자 회원 비밀번호 - 일치 불일치 실시간 구현 메서드	 = 전준표
function misSame() {
    var pw = document.frm.mPwd.value;
    var confirmPW = document.frm.mChkPwd.value;
    if (pw.length < 6 || pw.length > 16) {
        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
        document.getElementById('mPwd').value=document.getElementById('mChkPwd').value='';
        document.getElementById('same').innerHTML='';
    }
    if(document.getElementById('mPwd').value!='' && document.getElementById('mChkPwd').value!='') {
        if(document.getElementById('mPwd').value==document.getElementById('mChkPwd').value) {
            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
            document.getElementById('same').style.fontSize='9pt';
            document.getElementById('same').style.color='white';
            
        }
        else {
            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
            document.getElementById('same').style.fontSize='9pt';
            document.getElementById('same').style.color='white';
        }
    }else {
		document.getElementById('same').innerHTML='※ 비밀번호는 6~12자로만 입력.';
		document.getElementById('same').style.fontSize='9pt';
		document.getElementById('same').style.color='white';
	}
}	

// 8. 매니저회원가입 - 이메일 직접입력 메서드 - 전준표

function mCheckMail(value){

		var  mEmail2 = frm.mEmail2;

		if( value == 'no'){

			mEmail2.value = '';

			mEmail2.readOnly=true;

			return;

		} else if(value == 'input' ){

			mEmail2.value = '';

			mEmail2.readOnly=false;

			mEmail2.focus();

			return;

		} else {

			mEmail2.value = value;

			mEmail2.readOnly = true;

		}

	}

//basic 정규화
function bcheck(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}

function bvalidate() {
	var re_id = /^[a-zA-Z0-9]{4,12}$/
	var re_aname = /^.{1,5}$/
	var rephone = /^[0-9]{3,4}$/
	var rephone2 = /^[0-9]{4}$/ 
	var re_pw = /^.{6,12}$/ 
    var re_email = /^.{4,12}$/
	var re_email2 = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	
    var id = document.getElementById("id");
    var userPwd = document.getElementById("userPwd");
    var chkPwd = document.getElementById("chkPwd");
    var userName = document.getElementById("userName");
    var email1 = document.getElementById("email1");
    var email2 = document.getElementById("email2");
    var phoneNum2 = document.getElementById("phoneNum2");
    var phoneNum3 = document.getElementById("phoneNum3");
	
    // ------------ 이메일 까지 -----------

    if(!bcheck(re_id,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
		document.frm.id.focus();
        return false;
    }

    if(!bcheck(re_pw,userPwd,"패스워드는 6~12자로만 입력")) {
        return false;
    }

    if(!bcheck(re_pw,chkPwd,"확인 패스워드는 6~12자로만 입력")) {
        return false;
    }	
    if(!bcheck(re_aname, userName, "이름은 1~5자로만 입력")) {
        return false;
    }	
	if(document.frm.year.value == ''|| document.frm.month.value == '' || document.frm.date.value == '' ){
		alert('생년월일을 입력해주세요.');
		return false;
	}
    if(!bcheck(re_email, email1, "이메일은 4~12자로만 입력")) {
        return false;
    }
    if(!bcheck(re_email2, email2, "이메일을 선택 또는 입력해주세요")) {
        return false;
    }
    if(!bcheck(rephone,phoneNum2,"가운데 전화번호는 3~4자의 숫자로만 입력")) {
        return false;
    }	
    
    if(!bcheck(rephone2,phoneNum3,"전화번호 뒷자리는 4자의 숫자로만 입력")) {
        return false;
    }
	
	if(document.frm.postcode.value == ''){
		alert('우편번호를 입력해주세요.');
		return false;
	}
	if(document.frm.address.value == ''){
		alert('주소를 입력해주세요.');
		return false;
	}
	if(document.frm.detailAddress.value == ''){
		alert('상세주소를 입력해주세요.');
		return false;
	}
  	 if(document.frm.gender.value == ''){
		alert('성별을 선택해주세요.');
		return false;
	}
	if(document.frm.stature.value == ''){
		alert('키를 입력해주세요.');
		return false;
	}
	if(document.frm.weight.value == ''){
		alert('몸무게를 입력해주세요.');
		return false;
	}
	if(document.frm.chkPwd.value == '' || document.frm.chkPwd.value != document.frm.userPwd.value){
		alert('비밀번호를 다시 확인해주세요.');
		document.frm.chkPwd.focus();
		return false;
	}
	
	if(document.frm.return_chk.value == ''){
		alert('ID중복확인을 해주세요.');
		return false;
	}

	
	alert("회원가입이 완료되었습니다.");
}

//manager 정규화
function mcheck(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}

function mvalidate() {
	var re_id = /^[a-zA-Z0-9]{4,12}$/
	var re_aname = /^.{1,5}$/
	var rephone = /^[0-9]{3,4}$/
	var rephone2 = /^[0-9]{4}$/ 
	var re_pw = /^.{6,12}$/ 
    var re_email = /^.{4,12}$/
	var re_email2 = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	
    var id = document.getElementById("id");
    var mPwd = document.getElementById("mPwd");
    var mChkPwd = document.getElementById("mChkPwd");
    var mName = document.getElementById("mName");
    var email1 = document.getElementById("email1");
    var email2 = document.getElementById("email2");
    var mPhoneNum2 = document.getElementById("mPhoneNum2");
    var mPhoneNum3 = document.getElementById("mPhoneNum3");
    var code = "sae1234";
    // ------------ 이메일 까지 -----------
    if(document.frm.code.value == ''){
		document.frm.code.focus();
		alert('코드를 입력하여주세요.');
		return false;
	} 
    if(!mcheck(re_id,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }
    
    if(!mcheck(re_pw,mPwd,"패스워드는 6~12자로만 입력")) {
        return false;
    }

    if(!mcheck(re_pw,mChkPwd,"확인 패스워드는 6~12자로만 입력")) {
        return false;
    }	
    if(!mcheck(re_aname, mName, "이름은 1~5자로만 입력")) {
        return false;
    }	
    if(!mcheck(re_email, email1, "이메일은 4~12자로만 입력")) {
        return false;
    }
    if(!mcheck(re_email2, email2, "이메일을 선택 또는 입력해주세요")) {
        return false;
    }
    if(!mcheck(rephone,mPhoneNum2,"가운데 전화번호는 3~4자의 숫자로만 입력")) {
        return false;
    }	
    
    if(!mcheck(rephone2,mPhoneNum3,"전화번호 뒷자리는 4자의 숫자로만 입력")) {
        return false;
    }
   
	if(document.frm.mChkPwd.value == '' || document.frm.mPwd.value != document.frm.mChkPwd.value){
		alert('비밀번호를 다시 확인해주세요.');
		document.frm.chkPwd.focus();
		return false;
	}
	if(document.frm.return_chk.value == ''){
		alert('ID중복확인을 해주세요.');
		return false;
	}
	if(document.frm.return_chk_code.value == ''){
		alert('코드확인을 해주세요.');
		return false;
	}
	
	alert("회원가입이 완료되었습니다.");
}
//다음 주소 검색 - API 전준표
function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }