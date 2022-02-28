<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css?ver=5">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/myPointCharge.css?ver=4">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<section>
    
    <div class="cMain">
    	<div class="complete">
    		<p><b>Helth Mania</b> 포인트 충전요청이 완료되었습니다.</p>
    		<p>이용해주셔서감사합니다.</p>
    		<p class="tsize">(충전되는데 최대 10분정도 걸릴 수 있습니다.)</p>
    		<div class = button>
    			<input type="button" value="메인으로 가기" id="cbtn1" class="cbtn" onclick="location.href='../view/main_View.jsp'">
    			<input type="button" value="My충전내역 보기" id="cbtn2" class="cbtn" onclick="location.href='../basicView/pointRequest_View.jsp'">
    		</div>
    	</div>
    </div>
    
</section>	

<jsp:include page="../include/footer.jsp"/>

</body>
</html>