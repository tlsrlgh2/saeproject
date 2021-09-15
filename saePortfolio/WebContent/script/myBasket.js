//선택한 상품의 가격이 총결제 예정금액에 더해지는 메서드	
function checkedPrice(){
	var totalCnt = parseInt(document.getElementById('totalCnt').value);
	var total = 0;
	
	
	for(var i=1;i<=totalCnt;i++){
		var numChk = document.getElementById('num'+i).checked;
		if(numChk){
			var price = parseInt(document.getElementById('buyPrice'+i).value.replace(/,/g, ""));
			total +=price;
			
		}
	}
	var money = document.getElementById('basketPrice');
	money.innerHTML = String(total).replace(/\B(?=(\d{3})+(?!\d))/g, ",")+'원';
	var bp = document.getElementById('bp');	
	bp.value = total;	
}

// 수량에 따른 가격변경
function totalPrice(cnt) {

	var price = parseInt(document.getElementById('pPrice'+cnt).value.replace(/,/g, ""));
	var oAmount = parseInt(document.getElementById('oAmount'+cnt).value);
	var pAmount = parseInt(document.getElementById('pAmount'+cnt).value);
	
	var total = String((price*oAmount)).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
	document.getElementById('buyPrice'+cnt).value = price*oAmount;
	document.getElementById('totalPrice'+cnt).innerHTML = total+'원';
	
	if(oAmount>pAmount){
		alert('해당상품의 현재 남은수량은'+pAmount+'개입니다.');
	}
	
	checkedPrice();
	
}

//삭제할 상품 체크했는지 안했지 확인하는 메서드
function deleteChecking() {
	
	var num = document.getElementsByName('num');
	var	number = document.getElementsByName('number');
	
	var isChecked = false;
	
	for(i=0; i<num.length; i++){
		
		
		if(num[i].checked == true){
				isChecked = true;
				number[i].value = num[i].value;
				number[i].checked = true;
				
			}
	}				

	if(!isChecked){
        alert("삭제할 상품을 선택하여주세요.");
        return false;
    }
	
}

//주문할 상품 체크했는지 안했지 확인하는 메서드
function orderChecking() {
	var num = document.getElementsByName('num');
	var buyPrice = parseInt(document.getElementById('bp').value);
	var bPoint = parseInt(document.getElementById('bPoint').value);
		
	var isChecked = false;

	for(i=0; i<num.length; i++){
	
		if(num[i].checked == true){
				isChecked = true;
			}
	}				

	if(!isChecked){
    	alert("주문할 상품을 선택하여주세요.");
    	return false;
	}

	if(bPoint<buyPrice){
		alert('포인트 잔액이 부족합니다. 포인트 충전소로 이동합니다.');
		location.href = '../basicView/myPoint_ChargeView.jsp';
		return false;
		}
	if(oAmount>pAmount){
		alert('해당상품의 현재 남은수량은'+pAmount+'개입니다.');
		return false;
	}
}
		
//전체선택 전체해제 메서드
function selectAll() {
	
	var selectAll = document.getElementById('selectA');
	
	var num = document.getElementsByName('num');
	
	var totalCnt = document.getElementById('totalCnt').value;
	
		if(selectAll.checked){
			for(i = 0; i<totalCnt; i++){
				num[i].checked = true;
			}
			checkedPrice();
		}
		if(!selectAll.checked){
			for(i = 0; i<totalCnt; i++){
				num[i].checked = false;
			}
			checkedPrice();
		}
		
}		