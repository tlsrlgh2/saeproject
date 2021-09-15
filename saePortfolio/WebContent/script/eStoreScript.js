

//구매하기전 필요조건 체크하는 메서드 - 전준표
function buyingChk() {
		var buyAmount = document.getElementById('buyAmount').value;
		var pAmount = parseInt(document.getElementById('pAmount').value);
		var bPoint = parseInt(document.getElementById('bPoint').value);
		var buyPrice = document.getElementById('buyPrice').value;
		
		if(buyAmount == ''){
			alert('구매수량을 입력해주세요.');
			document.frm.buyAmount.focus();
			return false;
		}
		
		if(buyAmount > pAmount){
			alert('남은수량을 확인해주시기 바랍니다.');
			document.frm.buyAmount.focus();
			return false;
		}
		
		
		if(bPoint<buyPrice){
			alert('포인트 잔액이 부족합니다. 포인트 충전소로 이동합니다.');
			location.href = '../basicView/myPoint_ChargeView.jsp';
			return false;
		}
		
		if(document.frm.bId.value == 'null'){
			alert('일반회원만 이용가능합니다.');
			location.href = '../view/login_view.jsp';
			return false;
		}
		
		
		return true;
	}
	
	//총상품가격 알려주는 메서드 - 전준표
	
	function totalPrice() {
		
		var buyAmount = document.getElementById('buyAmount').value;
		var pPrice = parseInt(document.getElementById('pPrice').value.replace(/,/g, ""));
		var result = String(buyAmount*pPrice).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		var buyPrice = document.getElementById('buyPrice');
		
		document.getElementById('totalPrice').innerHTML = result+'원';
		
		buyPrice.value = buyAmount*pPrice;
		
	}
	
	//좋아요 일반회원 확인해주는 메서드 - 전준표
	function memberChk(){
		
		var bId = document.getElementById('bId').value;
		var pNo = document.getElementById('pNo').value;
		
		if(bId == 'null'){
			alert('일반회원만 이용이 가능합니다.');
			location.href= '../view/login_view.jsp';
		}else{
			location.href = '../save/likeSave.jsp?pno='+pNo;
		}
		
	}
	// 좋아요 취소하는 메서드 - 전준표
	function likeCancel() {
	var pno = document.getElementById('pNo').value;
	
	location.href = '../delete/likeCancel.jsp?pno='+pno;
	}
	
	//장바구니를 체크하는 메서드 - 전준표
	function basketChk() {
	var oAmount = document.getElementById('buyAmount').value;
	var pAmount = parseInt(document.getElementById('pAmount').value);
	
		if(oAmount == ''){
			alert('구매수량을 입력해주세요.');
			return false;
		}
		if(oAmount > pAmount){
		alert('남은수량을 확인해주시기 바랍니다.');
		document.frm.buyAmount.focus();
		return false;
	}
	
	if(document.getElementById('bId').value == 'null'){
		alert('일반회원만 이용가능합니다.');
		location.href = '../view/login_view.jsp';
		return false;
	}
	
	var basketChk = document.getElementById('basketChk').value;
	
	if(basketChk==0){
		window.open("../eStore_view/basket_Move.jsp","","width=600, height=365");
		return false;
	}
	
	window.open("../save/basketSave.jsp?oAmount="+oAmount,"","width=600, height=365");
	
}	
	
	
	function a() {
			window.close();
			opener.location.href = 'Mybasket_View.jsp';
		}
		
		function shoppingContinue() {
			opener.location.reload();
		    window.close();
		}