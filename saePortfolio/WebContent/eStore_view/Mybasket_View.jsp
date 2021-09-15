<%@page import="vo.MyBasket"%>
<%@page import="dao.BasicDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myBasket.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myBasket.js?ver=1"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

 <section>
 		<div class="Main">
 			<%				
 						
 			request.setCharacterEncoding("UTF-8"); 			
 						BasicDAO dao = BasicDAO.getInstance();
 						
 						String bId = String.valueOf(session.getAttribute("basicId"));
 						String bPoint = dao.getPoint(bId);
 			
 						int count = 0;
 						
 						count = dao.getBasketCount(bId);
 						
 						List<MyBasket> list = (List)dao.getMyBasket(bId);
 						
 						String pNo,pPrice,oAmount,pImage,pName,totalPrice;
 						%>
			<form action="../save/basketOrder.jsp" method="Post" name="frm">
			<input type="hidden" name="bPoint" id="bPoint" value="<%=bPoint%>">
			<fieldset>
 			<legend>Helth Mania 장바구니</legend>
 			
 			<%
 						if(list.isEmpty()){%>
 							<div class="empty">
 								<img alt="basket" src="../img/cart.png" class="empty">
 								<p class="empty">장바구니에 담긴 물품이 없습니다.</p>
 							</div>
 						<%}else if(!list.isEmpty()){%>
 			<div class="title">
 			<p>총 <%=count %> 개의 상품을 담았습니다.</p>
 			</div>	
 				<table class="mybasket">
 					<thead>
 						<th><input type="checkbox" name="selectA"  id="selectA" value="0" onclick="selectAll()"></th>
 						<th>상품번호</th>
 						<th>상품이미지</th>
 						<th>상품명</th>
 						<th>상품가격</th>
 						<th>주문수량</th>
 						<th>결제예정금액</th>
 					</thead>
 					<tbody>
 					
 					<%
 					int cnt = 0;
 					for(MyBasket mb : list){
 						cnt++;
 						pNo = mb.getpNo();
 						pPrice = mb.getpPrice();
 						oAmount = mb.getoAmount();
 						pImage = mb.getpImage();
 						pName = mb.getpName();
 						totalPrice = mb.getTotalPrice();
 						
 						String pAmount = dao.getpAmount(pNo);
 						String pbuytotal = dao.getSales(pNo);
 						%>
 						<input type="hidden" name="pAmount<%=cnt %>" id="pAmount<%=cnt %>" value="<%=pAmount%>">
 						<input type="hidden" name="pbuytotal<%=cnt %>" id="pAmount<%=cnt %>" value="<%=pbuytotal%>">
 						<tr>
 							<!--선택 비선택  -->
 							<td> <input type="checkbox" name="num" value="<%=cnt%>" id="num<%=cnt%>" onclick="checkedPrice()"></td>
 							<!--상품번호  -->
 							<td><%=pNo %></td>
 							<input type="hidden" name="pNo<%=cnt%>" value="<%=pNo %>">
 							<!--상품이미지  -->
 							<td><img src="../Product_Img/<%=pImage %>" alt="pImg" class="pImg"></td>
 							<input type="hidden" name="pImage<%=cnt%>" value="<%=pImage %>">
 							<!--상품이름  -->
 							<td><%=pName %></td>
 							<input type="hidden" name="pName<%=cnt%>" value="<%=pName %>">
 							<!--상품가격  -->
 							<td><%=pPrice %>원</td>
 							<input type="hidden" name="pPrice<%=cnt%>" id="pPrice<%=cnt%>" value="<%=pPrice %>">
 							<!--주문 수량  -->
 							<td><input type="number" name="oAmount<%=cnt%>" min="1" max="999" value="<%=oAmount%>" id="oAmount<%=cnt%>" class="pAmount" onchange="totalPrice(<%=cnt%>)" onkeyup="totalPrice(<%=cnt%>)"></td>
 							<!--주문상품가격  -->
 							<td><span id="totalPrice<%=cnt%>"><%=totalPrice %>원</span></td>
 							<input type="hidden" name="buyPrice<%=cnt%>" value="<%=totalPrice %>" id="buyPrice<%=cnt%>">
 						</tr>
 					<%}%>
 					</tbody>
 					<tfoot>
 						<tr>
 						<td rowspan="3" class="totalPrice">총 결제예정금액</td>
 						<td colspan="4" class="bp"><span id="basketPrice">0원</span></td>
 						<input type="hidden" name="bp" id="bp">
 						<input type="hidden" id="totalCnt" value="<%=cnt%>">
 						<td colspan="2" class="btn">
 							<input type="submit" value="선택한 상품 주문" onclick="return orderChecking()">
 						</form>	
 						
 						<br>
 						<br>
 						
 						<form action="../delete/basketDelete.jsp" method="Post" name="frm">
 							<% 	
 								int cnt2 = 0;
 								String pNo2 ;
 								for(MyBasket md : list){
 									cnt2++;
 									pNo2 = md.getpNo();
 							%>
 							<input type="checkbox" style="display: none" name="number">
 							<input type="hidden" name="pNo2<%=cnt2%>" value="<%=pNo2%>">
 							<%}%>
 							<input type="submit" value="선택한 상품 삭제" onclick="return deleteChecking()">
 						</form>	
 						</td>
 						</tr>
 					</tfoot>
 				</table>
 			<%}%>
 			</fieldset>
 		</div>
 </section>

<jsp:include page="../include/footer.jsp"/>


</body>
</html>