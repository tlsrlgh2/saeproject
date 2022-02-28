function boardPermit() {
		var bId = document.getElementById('bId').value;
		var aId = document.getElementById('aId').value;
		var mId = document.getElementById('mId').value;
		if(bId == 'null' & aId == 'null' & mId == 'null'){
			alert('비회원은 이용할 수 없습니다.')
			alert('Helth Mania 회원가입페이지로 이동합니다.');
			location.href = '../view/joinSelect_view.jsp';
		}else{
			location.href = '../board_view/boardWriter_View.jsp'; 
		}
	}
	//댓글작성 null 체크 스크립트
	function commentChk() {
		if(document.frm.commentWriter.value ==''){
			alert('작성자를 입력해주세요.');
			document.frm.commentWriter.focus();
			return false;
		}
		
		if(document.frm.comment.value == ''){
			alert('댓글내용을 입력해주세요.');
			document.frm.comment.focus();
			return false;
		}
		if(document.frm.commentPw.value ==''){
			alert('댓글 비밀번호를 입력해주세요.');
			document.frm.commentPw.focus();
			return false;
		}
		alert('댓글이 등록되었습니다.');
		return true;
	}	
	
	//댓글 삭제 스크립트
function deleteChk(cnt){
			
			var cno = document.getElementById('cNo');
			
			if(document.getElementById('cName'+cnt).value == document.getElementById('bid2').value){
				cno.value = document.getElementById('no'+cnt).value
				if (confirm("댓글을 삭제하시겠습니까?.") == true){    //확인
					 alert('성공적으로 삭제하였습니다.');
				     document.fm.submit();
				 }else{   //취소
				     return false;
				 }	
			}else if(document.getElementById('cName'+cnt).value == document.getElementById('aid2').value){
				cno.value = document.getElementById('no'+cnt).value
				if (confirm("댓글을 삭제하시겠습니까?.") == true){    //확인
					 alert('성공적으로 삭제하였습니다.');
				     document.fm.submit();
				 }else{   //취소
				     return false;
				 }	
			}else if(document.getElementById('cName'+cnt).value == document.getElementById('mid2').value){
				cno.value = document.getElementById('no'+cnt).value
				if (confirm("댓글을 삭제하시겠습니까?.") == true){    //확인
					 alert('성공적으로 삭제하였습니다.');
				     document.fm.submit();
				 }else{   //취소
				     return false;
				 }
			}else{
				alert('댓글을 삭제할 권한이 없습니다.'); 
				return false;
			}	
		}
	// 게시물 수정 체크 스크립트
	function boardCorrect(){
		var qno = document.getElementById('qNo').value;
		
	if(document.getElementById('bid1').value == document.getElementById('qWriter').value){
		alert('게시물 수정페이지로 이동합니다.');
		location.href = '../load/correctLoad.jsp?qno='+ qno;
	}else if(document.getElementById('aid1').value == document.getElementById('qWriter').value){
		alert('게시물 수정페이지로 이동합니다.');
		location.href = '../load/correctLoad.jsp?qno='+ qno;
	}else if(document.getElementById('mid1').value == document.getElementById('qWriter').value){
		alert('게시물 수정페이지로 이동합니다.');
		location.href = '../load/correctLoad.jsp?qno='+ qno;
	}else{
		alert('게시물을 수정할 권한이 없습니다.');
	}
	
}

//게시글 작성 null 체크
	function boardChk() {
		if(document.frm.title.value==''){
			alert('제목을 입력하세요.');
			document.frm.title.focus();
			return false;
		}
		if(document.frm.content.value==''){
			alert('내용을 입력하세요.');
			document.frm.content.focus();
			return false;
		}
		alert('게시글이 작성되었습니다.')
		return true;
	}
	
	//게시글 수정 체크 스크립트
	function boardChk2() {
		if(document.frm.title.value==''){
			alert('제목을 입력하세요.');
			document.frm.title.focus();
			return false;
		}
		if(document.frm.content.value==''){
			alert('내용을 입력하세요.');
			document.frm.content.focus();
			return false;
		}
		alert('게시글이 수정되었습니다.')
		return true;
	}

//게시글 삭제 스크립트
function boardDelete(){
	if(document.getElementById('bid1').value == document.getElementById('qWriter').value){
		if (confirm("게시물을 삭제하시겠습니까?.") == true){    //확인
					 alert('성공적으로 삭제하였습니다.');
				     document.dfrm.submit();
				 }else{   //취소
				     return false;
				 }	
	}else if(document.getElementById('aid1').value == document.getElementById('qWriter').value){
		if (confirm("게시물을 삭제하시겠습니까?.") == true){    //확인
					 alert('성공적으로 삭제하였습니다.');
				     document.dfrm.submit();
				 }else{   //취소
				     return false;
				 }	
	}else if(document.getElementById('mid1').value == document.getElementById('qWriter').value){
		if (confirm("게시물을 삭제하시겠습니까?.") == true){    //확인
					 alert('성공적으로 삭제하였습니다.');
				     document.dfrm.submit();
				 }else{   //취소
				     return false;
				 }	
	}else{
		alert('게시물을 삭제할 권한이 없습니다.');
		return false;
	}
}

//게시글 검색어 넑값 방지
function search_chk() {
	if(document.frm.search_text.value==''){
		alert('검색할 검색어를 입력하세요.');
		document.frm.search_text.focus();
		return false;
	}
}