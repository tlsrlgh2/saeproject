function loginChk() {
		
		if(document.frm.memberType.value==''){
			alert('회원유형을 선택하세요.');
			return false;
		}
		
		
		if(document.frm.memberId.value==''){
			alert('아이디를 입력하세요.');
			document.frm.memberId.focus();
			return false;
		}
		
		if(document.frm.memberPw.value==''){
			alert('비밀번호를 입력하세요.');
			document.frm.memberPw.focus();
			return false;
		}
		
		return true;
	}

function find_id_pw() {
	window.open("../find_Id_Pw/select_member.jsp","","width=600, height=365");
}