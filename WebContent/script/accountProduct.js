	function productDelete(cnt) {
		var pNo = document.getElementById('pNo'+cnt).value;
		if (confirm("상품을 삭제 하시겠습니까?") == true){    //확인
			 alert('성공적으로 삭제되었습니다.');
			location.href = '../delete/productDelete.jsp?pno='+pNo;
		 }else{   //취소
		     return false;
		 }	
	}
	
	function productCorrect(cnt) {
		var pNo = document.getElementById('pNo'+cnt).value;
		location.href = 'product_Correct_View.jsp?pno='+pNo;		
	}
	