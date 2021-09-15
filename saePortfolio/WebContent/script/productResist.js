
	// 상품 업로드 이미지 미리보기 메서드 - 전준표
	function readURL(input) {
			
			alert(document.getElementById('imageSelector').value)
			
			
			if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
			
			if(document.getElementById('imageSelector').value == ''){
				document.getElementById('preview').src = "../img/noimage.jpg";
			}
		}
		
		//상품가격 ,으로 받는 메서드 - 전준표
		 function inputNumberFormat(obj) {
     		obj.value = comma(uncomma(obj.value));
 			}

 		function comma(str) {
     		str = String(str);
    		 return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,');
 			}

 		function uncomma(str) {
    		 str = String(str);
     		return str.replace(/[^\d]+/g, '');
 			}
		//상품등록 입력값체크
 		function productCheck(){
 			if(document.frm.pName.value == ''){
 				document.frm.pName.focus();
 				alert('상품명을 입력해주세요.');
 				return false;
 			}
 			if(document.frm.pContent.value == ''){
 				document.frm.pContent.focus();
 				alert('상품설명을 입력해주세요.');
 				return false;
 			}
 			if(document.frm.pPrice.value == ''){
 				document.frm.pPrice.focus();
 				alert('상품가격을 입력해주세요.');
 				return false;
 			}
 			if(document.frm.pAmount.value == ''){
 				document.frm.pAmount.focus();
 				alert('상품수량을 입력해주세요.');
 				return false;
 			}
 				alert('성공적으로 상품이 등록되었습니다.');
 			return true;
 		}