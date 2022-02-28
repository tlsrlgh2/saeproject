function delete_basic_Memeber() {
		
		var question = confirm('회원을 탈퇴 시키시겠습니까?');
		
		if(question) {
			alert('탈퇴처리 완료 되었습니다')
			
		}else {
			alert('취소하였습니다')
			return false;
		}
	}
	
function delete_account_Memeber() {
	
	var question = confirm('회원을 탈퇴 시키시겠습니까?');
	
	if(question) {
		alert('탈퇴처리 완료 되었습니다')
	}else {
		alert('취소하였습니다')
		return false;
	}
}