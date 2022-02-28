<%@page import="dao.BasicDAO"%>
<%@page import="vo.ObesityInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPointCharge.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPointCharge.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
	
	<section class="">
		<div class="Main">
			
			<%
			BasicDAO bDao = BasicDAO.getInstance();
			String bId = String.valueOf(session.getAttribute("basicId"));
			String bPoint = bDao.getPoint(bId).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
			%>
			
			
			<h2>HelthMania 포인트 충전소</h2>
				<div class="Content">
					<form action="../save/myPoint_Request.jsp" method="post" name="frm">
					<table class="point">
						<tr>
						<td>My 포인트</td>
						<td> <input type="text" value="<%=bPoint %>" disabled id="myPoint"> Point</td>
						</tr>
						
						<tr>
							<td>충전 포인트</td>
							<td>
								<input type="hidden" name="id" value="<%=session.getAttribute("basicId")%>">
								<input type="text" name="point1" id="point1" readonly onkeyup='call()'>
							Point
							<select name="point2" id="point2"  onChange="checkPoint(frm.point2.options[this.selectedIndex].value)">
                				<option value="no" selected>충전할금액 선택</option>
                				<option value="5,000">5,000 Point</option>
                				<option value="10,000">10,000 Point</option>
                				<option value="30,000">30,000 Point</option>
                				<option value="50,000">50,000 Point</option>
                				<option value="100,000">100,000 Point</option>
                				<option value="150,000">150,000 Point</option>
                				<option value="200,000">200,000 Point</option>
                				<option value="input">※직접입력※</option>
                			</select>
							</td>
						</tr>
						<tr>
							<td>입금 계좌번호</td>
							<td>
								<select name="accountNum" class="select_bank">
								<option value="A은행">A은행 계좌번호(122-459-6547)</option>
								<option value="B은행">B은행 계좌번호(708954-31-059846)</option>
								<option value="C은행">C은행 계좌번호(30554-351-026479)</option>
								</select>
							</td>
						</tr>
						<tr>
							<td>충전 후 나의 포인트</td>
								<input type = "hidden" name="point" id="point" >
							<td><input type="text" name="afterPoint" id="afterPoint" disabled="disabled"> Point</td>
						</tr>
					</table>
						<div class="btn">
							<input type="submit" value="충전요청">
						</div>
					</form>
				</div>
    	</div>
	</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>