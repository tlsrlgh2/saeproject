function logout() {
	alert('안전하게 로그아웃 되었습니다.');
	location.href = "../logout/logOut.jsp";
}

function find_id_pw() {
	window.open("../find_Id_Pw/select_member.jsp","","width=600, height=365");
}
