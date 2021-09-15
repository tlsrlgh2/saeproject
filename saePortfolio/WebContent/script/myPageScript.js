function myPageNullChk(){
	if(document.frm.pwChk.value == ''){
		alert('비밀번호를 입력해주세요.');
		document.frm.pwChk.focus();
		return false;
	}
	return true;
}
//일반회원 이메일 수정 체크 메서드
function checkMail(value){

		var  bEmail2 = frm.bEmail2;

		if( value == 'no'){

			bEmail2.value = '';

			bEmail2.readOnly=true;

			return;

		} else if(value == 'input' ){

			bEmail2.value = '';

			bEmail2.readOnly=false;

			bEmail2.focus();

			return;

		} else {

			bEmail2.value = value;

			bEmail2.readOnly = true;

		}

	}
	
	
function bmNullChk(){
	if(document.frm.bPw.value == ''){
		alert('수정할 비밀번호를 입력하세요.');
		document.frm.bPw.focus();
		return false;
	}
	if(document.frm.bPwChk.value=='' || document.frm.bPwChk.value!=document.frm.bPw.value){
		alert('비밀번호를 재확인 해주세요.');
		document.frm.bPwChk.focus();
		return false;
	}
	if(document.frm.bEmail1.value == ''||document.frm.bEmail2.value == ''){
		alert('수정할 이메일을 입력 해주세요.');
		return false;
	}
	if(document.frm.phoneNum1.value == ''||document.frm.phoneNum2.value == ''||document.frm.phoneNum3.value == ''){
		alert('수정할 전화번호를 입력 해주세요.');
		return false;
	}
	if(document.frm.year.value == ''||document.frm.month.value == ''||document.frm.date.value == ''){
		alert('수정할 생년월일을 입력 해주세요.');
		return false;
	}
	if(document.frm.bHeight.value == ''){
		alert('수정할 키를 입력해주세요.');
		document.frm.bHeight.focus();
		return false;
	}
	if(document.frm.bWeight.value == ''){
		alert('수정할 몸무게를 입력해주세요.');
		document.frm.bWeight.focus();
		return false;
	}
	alert('수정이 완료 되었습니다.');
	return true;
}

//비밀번호 일치 불일치 확인 메서드
function isSame() {
	    var pw = document.frm.bPw.value;
	    var confirmPW = document.frm.bPwChk.value;
	    if (pw.length < 6 || pw.length > 16) {
	        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	        document.getElementById('bPw').value=document.getElementById('bPwChk').value='';
	        document.getElementById('same').innerHTML='';
	    }
	    if(document.getElementById('bPw').value!='' && document.getElementById('bPwChk').value!='') {
	        if(document.getElementById('bPw').value==document.getElementById('bPwChk').value) {
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.fontSize='9pt';
	            document.getElementById('same').style.color='black';
	            
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.fontSize='9pt';
	            document.getElementById('same').style.color='black';
	        }
	    }
	}
	
	function bmWithdraw() {
			var chk = document.frm.accept.checked;
			if(!chk){
				alert('회원탈퇴 안내를 숙지하고 동의에 체크해주세요.');
				return false;
			}
			 if (confirm("Helth Mania 회원을 탈퇴합니다.") == true){    //확인
				 alert('성공적으로 탈퇴하였습니다.');
			     document.frm.submit();
			 }else{   //취소
			     return false;
			 }	
		}
	
	
	
	
// account mypage js
	
	function myPageNullChk(){
		
		if(document.frm.pwChk.value == ''){
			alert('비밀번호를 입력해주세요.');
			document.frm.pwChk.focus();
			return false;
		}
		return true;
	}
	
	
	//일반회원 이메일 수정 체크 메서드
	function aCheckMail(value){

		var  aEmail2 = frm.aEmail2;

		if( value == 'no'){

			aEmail2.value = '';

			aEmail2.readOnly=true;

			return;

		} else if(value == 'input' ){

			aEmail2.value = '';

			aEmail2.readOnly=false;

			aEmail2.focus();

			return;

		} else {

			aEmail2.value = value;

			aEmail2.readOnly = true;

		}

	}
		
		
	function bmNullChk(){
		if(document.frm.aPw.value == ''){
			alert('수정할 비밀번호를 입력하세요.');
			document.frm.bPw.focus();
			return false;
		}
		if(document.frm.aPwChk.value=='' || document.frm.aPwChk.value!=document.frm.aPw.value){
			alert('비밀번호를 재확인 해주세요.');
			document.frm.bPwChk.focus();
			return false;
		}
		if(document.frm.aEmail1.value == ''||document.frm.aEmail2.value == ''){
			alert('수정할 이메일을 입력 해주세요.');
			return false;
		}
		if(document.frm.phoneNum1.value == ''||document.frm.phoneNum2.value == ''||document.frm.phoneNum3.value == ''){
			alert('수정할 전화번호를 입력 해주세요.');
			return false;
		}
		alert('수정이 완료 되었습니다.');
		return true;
	}

	//비밀번호 일치 불일치 확인 메서드
	function aisSame() {
		    var pw = document.frm.aPw.value;
		    var confirmPW = document.frm.aPwChk.value;
		    if (pw.length < 6 || pw.length > 16) {
		        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
		        document.getElementById('aPw').value=document.getElementById('aPwChk').value='';
		        document.getElementById('same').innerHTML='';
		    }
		    if(document.getElementById('aPw').value!='' && document.getElementById('aPwChk').value!='') {
		        if(document.getElementById('aPw').value==document.getElementById('aPwChk').value) {
		            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
		            document.getElementById('same').style.fontSize='9pt';
		            document.getElementById('same').style.color='black';
		            
		        }
		        else {
		            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
		            document.getElementById('same').style.fontSize='9pt';
		            document.getElementById('same').style.color='black';
		        }
		    }
		}
		
		function bmWithdraw() {
				var chk = document.frm.accept.checked;
				if(!chk){
					alert('회원탈퇴 안내를 숙지하고 동의에 체크해주세요.');
					return false;
				}
				 if (confirm("Helth Mania 회원을 탈퇴합니다.") == true){    //확인
					 alert('성공적으로 탈퇴하였습니다.');
				     document.frm.submit();
				 }else{   //취소
				     return false;
				 }	
			}
		
//// manager js
function myPageNullChk(){
	
	if(document.frm.pwChk.value == ''){
		alert('비밀번호를 입력해주세요.');
		document.frm.pwChk.focus();
		return false;
	}
	return true;
}


//일반회원 이메일 수정 체크 메서드
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
	
//비밀번호 일치 불일치 확인 메서드
function misSame() {
	    var pw = document.frm.mPw.value;
	    var confirmPW = document.frm.mPwChk.value;
	    if (pw.length < 6 || pw.length > 16) {
	        window.alert('비밀번호는 6글자 이상, 16글자 이하만 이용 가능합니다.');
	        document.getElementById('mPw').value=document.getElementById('mPwChk').value='';
	        document.getElementById('same').innerHTML='';
	    }
	    if(document.getElementById('mPw').value!='' && document.getElementById('mPwChk').value!='') {
	        if(document.getElementById('mPw').value==document.getElementById('mPwChk').value) {
	            document.getElementById('same').innerHTML='비밀번호가 일치합니다.';
	            document.getElementById('same').style.fontSize='9pt';
	            document.getElementById('same').style.color='black';
	            
	        }
	        else {
	            document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
	            document.getElementById('same').style.fontSize='9pt';
	            document.getElementById('same').style.color='black';
	        }
	    }
	}
	
	function bmWithdraw() {
			var chk = document.frm.accept.checked;
			if(!chk){
				alert('회원탈퇴 안내를 숙지하고 동의에 체크해주세요.');
				return false;
			}
			 if (confirm("Helth Mania 회원을 탈퇴합니다.") == true){    //확인
				 alert('성공적으로 탈퇴하였습니다.');
			     document.frm.submit();
			 }else{   //취소
			     return false;
			 }	
		}
	
	function pointChk(cnt) {
		var point = document.getElementById('point');
		var id = document.getElementById('id');
		var no = document.getElementById('no');
		var pColor = document.getElementById('pColor'+cnt);
		var result = '충전완료';
				point.value = document.getElementById('afp'+cnt).value
				no.value = document.getElementById('pno'+cnt).value
				id.value = document.getElementById('bid' +cnt).value;
				
				
				
				if(document.getElementById('pResult'+cnt).value == result){
					alert('이미 충전이 완료되었습니다.');
					return false;
				}else{
				if(confirm("포인트 충전을 수락하겠습니까?") == true){    //확인
					 alert('성공적으로 충전되었습니다.');
				     document.frm.submit();
				 }else{   //취소
				     return false;
				 }	
				
			}
	}
	
	// account 정규화
	function check(re, what, message) {
	    if(re.test(what.value)) {
	        return true;
	    }
	    alert(message);
	    what.value = "";
	    what.focus();
	}
	
	function validate() {
		var rephone = /^[0-9]{3,4}$/
		var rephone2 = /^[0-9]{4}$/ 
		var re_pw = /^.{6,12}$/ 
	    var re_email = /^.{4,12}$/
		var re_email2 = /[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	    	
	    var aPw = document.getElementById("aPw");
	    var aPwChk = document.getElementById("aPwChk");
	    var aEmail1 = document.getElementById("aEmail1");
	    var aEmail2 = document.getElementById("aEmail2");
	    var phoneNum2 = document.getElementById("phoneNum2");
	    var phoneNum3 = document.getElementById("phoneNum3");


	    if(!check(re_pw,aPw,"패스워드는 6~12자로만 입력")) {
	        return false;
	    }

	    if(!check(re_pw,aPwChk,"확인 패스워드는 6~12자로만 입력")) {
	        return false;
	    }	
	    if(!check(re_email, aEmail1, "이메일은 4~12자로만 입력")) {
	        return false;
	    }
	    if(!check(re_email2, aEmail2, "이메일을 선택 또는 입력해주세요")) {
	        return false;
	    }
	    if(!check(rephone,phoneNum2,"가운데 전화번호는 3~4자의 숫자로만 입력")) {
	        return false;
	    }	
	    
	    if(!check(rephone2,phoneNum3,"전화번호 뒷자리는 4자의 숫자로만 입력")) {
	        return false;
	    }
		
		if(document.frm.aPwChk.value == '' || document.frm.aPw.value != document.frm.aPwChk.value){
			alert('비밀번호 와 비밀번호 확인이 다릅니다.');
			return false;
		}
		
		alert('수정이 완료 되었습니다.');
		return true;
		
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

		var year_ = /^[0-9]{4}$/
		var date_ = /^[0-9]{1,2}$/	
		var weight = /^[0-9]{2,3}$/	
		var height = /^[0-9]{3}$/	
		
		
	    var bPw = document.getElementById("bPw");
	    var bPwChk = document.getElementById("bPwChk");
	    var bEmail1 = document.getElementById("bEmail1");
	    var bEmail2 = document.getElementById("bEmail2");
	    var phoneNum2 = document.getElementById("phoneNum2");
	    var phoneNum3 = document.getElementById("phoneNum3");
	    var year2 = document.getElementById("year");
	    var date2 = document.getElementById("date");
	    var bHeight = document.getElementById("bHeight");
	    var bWeight = document.getElementById("bWeight");

	    // ------------ 이메일 까지 -----------
	    if(!bcheck(re_pw,bPw,"패스워드는 6~12자로만 입력")) {
	        return false;
	    }

	    if(!bcheck(re_pw,bPwChk,"확인 패스워드는 6~12자로만 입력")) {
	        return false;
	    }
	    if(!bcheck(year_,year2,"년도는 4자의 숫자로만 입력")) {
	        return false;
	    } 
	    if(!bcheck(date_,date2,"일자는 1~2자의 숫자로만 입력")) {
	        return false;
	    }
	    if(!bcheck(re_email, bEmail1, "이메일은 4~12자로만 입력")) {
	        return false;
	    }
	    if(!bcheck(re_email2, bEmail2, "이메일을 선택 또는 입력해주세요")) {
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
		
	    if(!bcheck(height,bHeight,"키는 3자의 숫자로만 입력")) {
	        return false;
	    }
	    if(!bcheck(weight,bWeight,"몸무게는 2~3자의 숫자로만 입력")) {
	        return false;
	    } 
	    
		if(document.frm.bPwChk.value == '' || document.frm.bPw.value != document.frm.bPwChk.value){
			alert('비밀번호를 다시 확인해주세요.');
			document.frm.chkPwd.focus();
			return false;
		}
		alert("수정이 완료되었습니다.");
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

		var year_ = /^[0-9]{4}$/
		var date_ = /^[0-9]{1,2}$/	
		var weight = /^[0-9]{2,3}$/	
		var height = /^[0-9]{3}$/	
		
		
	    var mPw = document.getElementById("mPw");
	    var mPwChk = document.getElementById("mPwChk");
	    var mEmail1 = document.getElementById("mEmail1");
	    var mEmail2 = document.getElementById("mEmail2");
	    var phoneNum2 = document.getElementById("phoneNum2");
	    var phoneNum3 = document.getElementById("phoneNum3");

	    // ------------ 이메일 까지 -----------
	    if(!mcheck(re_pw,mPw,"패스워드는 6~12자로만 입력")) {
	        return false;
	    }

	    if(!mcheck(re_pw,mPwChk,"확인 패스워드는 6~12자로만 입력")) {
	        return false;
	    }
	    if(!mcheck(re_email, mEmail1, "이메일은 4~12자로만 입력")) {
	        return false;
	    }
	    if(!mcheck(re_email2, mEmail2, "이메일을 선택 또는 입력해주세요")) {
	        return false;
	    }
	    if(!mcheck(rephone,phoneNum2,"가운데 전화번호는 3~4자의 숫자로만 입력")) {
	        return false;
	    }	
	    
	    if(!mcheck(rephone2,phoneNum3,"전화번호 뒷자리는 4자의 숫자로만 입력")) {
	        return false;
	    }
	    
		if(document.frm.mPwChk.value == '' || document.frm.mPw.value != document.frm.mPwChk.value){
			alert('비밀번호를 다시 확인해주세요.');
			document.frm.mPwChk.focus();
			return false;
		}
		alert("수정이 완료되었습니다.");
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
				document.getElementById("detailAddress").value = '';
                document.getElementById("detailAddress").focus();
            }
        }).open();
    }