
//SELECT 선택 시 자동으로 덧셈하는 메서드

function checkPoint(value){
		
		var afterPoint = document.getElementById('afterPoint');
		var  point1 = frm.point1;
		
		var a = parseInt(value.replace(/,/g, ""));
		var b = parseInt(document.getElementById('myPoint').value.replace(/,/g, ""));
		
		var result = String(a+b).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
		var point = document.getElementById('point');
		
		if( value == 'no'){

			point1.value = '';

			point1.readOnly=true;
			
			afterPoint.value = '';

			afterPoint.readOnly=true;

			return;

		}else if(value == 'input' ){

			point1.value = '';

			point1.readOnly=false;

			point1.focus();

			return;
		}else{

			point1.value = value;

			point1.readOnly = true;
			
			afterPoint.value = result;
			point.value = a+b;
						
		}

	}
	
	 //직접입력시 자동으로 덧셈하는 메서드
	 function call(){
		 var a = parseInt(document.getElementById("point1").value.replace(/,/g, ""));
		 var b = parseInt(document.getElementById('myPoint').value.replace(/,/g, ""));
		 
		 var result = String(a+b).replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		 
		 var afterPoint = document.getElementById('afterPoint');
		 
		 var point = document.getElementById('point');
		 
	  if(document.getElementById("point1").value && document.getElementById('myPoint').value){
		  afterPoint.value = result;
		  point.value = a+b;
	  }
}