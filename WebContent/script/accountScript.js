// 이메일 체크
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


// 거래처 회원가입 정규화
function check(re, what, message) {
    if(re.test(what.value)) {
        return true;
    }
    alert(message);
    what.value = "";
    what.focus();
}

function validate() {
    var re_id = /^[a-zA-Z0-9]{4,12}$/
    var re_aname = /^.{1,20}$/
	var rephone = /^[0-9]{3,4}$/
	var rephone2 = /^[0-9]{4}$/ 
	var re_pw = /^.{6,12}$/ 
    var re_email = /^.{4,12}$/
	var re_email2 = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    	
    var id = document.getElementById("id");
    var userPwd = document.getElementById("userPwd");
    var userName = document.getElementById("userName");
    var chkPwd = document.getElementById("chkPwd");
    var email1 = document.getElementById("email1");
    var email2 = document.getElementById("email2");
    var phoneNum2 = document.getElementById("phoneNum2");
    var phoneNum3 = document.getElementById("phoneNum3");

    // ------------ 이메일 까지 -----------

    if(!check(re_id,id,"아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
        return false;
    }

    if(!check(re_pw,userPwd,"패스워드는 6~12자로만 입력")) {
        return false;
    }

    if(!check(re_pw,chkPwd,"확인 패스워드는 6~12자로만 입력")) {
        return false;
    }	
    if(!check(re_aname, userName, "상호명은 1~20자로만 입력")) {
        return false;
    }	
    if(!check(re_email, email1, "이메일은 4~12자로만 입력")) {
        return false;
    }
    if(!check(re_email2, email2, "이메일을 선택 또는 입력해주세요")) {
        return false;
    }
    if(!check(rephone,phoneNum2,"가운데 전화번호는 3~4자의 숫자로만 입력")) {
        return false;
    }	
    
    if(!check(rephone2,phoneNum3,"전화번호 뒷자리는 4자의 숫자로만 입력")) {
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



// 거래처 중복 아이디체크
function aIdchk(){
	if(document.frm.id.value == ''){
		alert("아이디를 먼저 입력해주세요.")
		document.frm.id.focus();
	}else{
		window.open("../check/allselect_Check.jsp?id="+document.frm.id.value,"","width=500, height=300");
	}
}




	// 거래처 회원 가입 비밀번호 체크
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

	// 거래처 회원 가입 비밀번호 체크
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
	}
}	


