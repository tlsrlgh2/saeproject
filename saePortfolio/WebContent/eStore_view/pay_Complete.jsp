<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/pay_Complete.css">
</head>
<body>
    <section class="payCom">
        <div class="pcmp">
            <img src="../img/health_logo.png" alt="로고">
            <h2>결제가 완료 되었습니다.</h2>

            <input type="button" value="E-Store 돌아가기" class="return_store" onclick="location.href = '../view/E-Store_View.jsp?choice=0'">
            <input type="button" value="나의 주문내역" class="myOrder" onclick="location.href = '../basicView/myOrderList_View.jsp'">
        </div>
    </section>
</body>
</html>