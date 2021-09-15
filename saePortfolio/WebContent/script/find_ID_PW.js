function chk_tel() {
	
      var RegExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
      var obj = document.getElementsByName("tel")[0]
      if (RegExp.test(obj.value)) {
          alert("특수문자는 입력하실 수 없습니다.");
          obj.value = obj.value.substring(0, obj.value.length - 1);
      }
      
}

function chk_data() {
	if(document.frm.tel.value==''){
		alert('전화번호 입력하세요.');
		document.frm.tel.focus();
		return false;
	} else if(document.frm.email.value==''){
		alert('이메일을 입력하세요.');
		document.frm.email.focus();
		return false;
	}
	
}

function chk_pw() {
	if(document.frm.id.value==''){
		alert('아이디 입력하세요.');
		document.frm.id.focus();
		return false;
	} else if(document.frm.tel.value==''){
		alert('전화번호 입력하세요.');
		document.frm.tel.focus();
		return false;
	}
}

function select_chk() {
	if(document.frm.member.value==''){
		alert('회원 유형을 선택해주세요.');
		return false;
	}
}

function find_end() {
	opener.document.location.href='../view/login_view.jsp';
	window.close();
	
}
function find_end_main() {
	opener.document.location.href='../view/main_View.jsp';
	window.close();
	
}
