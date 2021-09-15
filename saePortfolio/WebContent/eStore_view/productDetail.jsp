<%@page import="dao.BasicDAO"%>
<%@page import="com.sun.swing.internal.plaf.basic.resources.basic"%>
<%@page import="dao.ProjectDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProductList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/eStore.css?ver=6">
<link type="text/css" rel="stylesheet" href="../css/eStore_detail.css">
<script type="text/javascript" src="../script/eStoreScript.js?ver=3"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>


	


	<section>
		<div class="Content">
			<form action="../save/orderBuy.jsp" name="frm" method="post">
			<%	
				//로그인한 일반회원의 포인트를 가져오는 메서드
				String bId = String.valueOf(session.getAttribute("basicId"));
				BasicDAO dao= BasicDAO.getInstance();
				String bPoint = dao.getPoint(bId);
				
				
				
				List<ProductList> list = (ArrayList)request.getAttribute("productDetail");
				String pNo,pName,pAmount,aId,aName,pPrice,pBuyTotal,pContent,pImage;
			
				for(ProductList pl : list){
					pNo = pl.getpNo();
					pName = pl.getpName();
					pAmount = pl.getpAmount();
					aId = pl.getaId();
					aName = pl.getAname();
					pPrice = pl.getpPrice();
					pBuyTotal = pl.getpBuyTotal();
					pContent = pl.getpContent();
					pImage = pl.getpImage();
					%>
			
			<div class="detail_page">
				<div class="product_img">
					<img alt="상품명" src="../Product_Img/<%=pImage %>" class="product_size">
				</div>
				<div class="product_purchase">
					<table class="detail">
						<tr>
							<td colspan="3">
								<p class="seller">판매처 : <%=aName %>&nbsp; | &nbsp;Seller ID : <%=aId %></p>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<b>상품명 :</b>&nbsp;<%=pName %>
							</td>
						</tr>
						<tr>
							<td><h2>상품 판매가</h2></td>
							<td colspan="2"><h2 class="price"><%=pPrice %>원</h2></td>
						</tr>
						<tr>
							<td colspan="3" class="p_no">
								<p class="product_num">상품 번호 :</p>
								<p class="product_num"><%=pNo %></p>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="explain_p"><%=pContent %></div>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								구매수량 : <input type="number" min="1" max="<%=pAmount %>" class="num" name="buyAmount" id="buyAmount" onkeyup="totalPrice()" onchange="totalPrice()">
								<p class="amount">남은 수량 : <%=pAmount %></p>
							</td>
						</tr>
						<tr>
							<td>
								총 상품 금액 :<span id="totalPrice"></span>
							</td>
							<td colspan="2">
								<p class="amount">누적 판매량 <%=pBuyTotal %></p>
							</td>
						</tr>
						<input type="hidden" name="pName" value="<%=pName %>">
						<input type="hidden" name="aName" value="<%=aName %>">
						<input type="hidden" name="aId" value="<%=aId %>">
						<input type="hidden" id="pNo" name="pNo" value="<%=pNo %>">
						<input type="hidden" name="pAmount" id="pAmount" value="<%=pAmount %>">
						<input type="hidden" name="buyPrice" id="buyPrice">
						<input type="hidden" name="pBuyTotal" id="pBuyTotal" value="<%=pBuyTotal %>">
						<input type="hidden" name="bPoint" value="<%=bPoint%>" id="bPoint">
						<input type="hidden"  name="pImage" id="pImage" value="<%=pImage%>">
						<input type="hidden" name="pPrice" id="pPrice" value="<%=pPrice %>">
						<tr class="buy_item">
								<input type="hidden" name="bId" id="bId" value="<%=session.getAttribute("basicId")%>">
							<td><input type="submit" class="buy_btn" value="구매하기" onclick="return buyingChk()"></td>
							</form>
							<td>
								<%
									
									int like = (Integer)request.getAttribute("like");
									
									int result = (Integer)request.getAttribute("result");
									
									// 좋아요를 누르지 않은경우
									if(result==1){%>
								<div id="" class="img_size" onclick="memberChk()">
									<img src="../img/empty_heart.png" 
                    				onmouseover="this.src='../img/fill_heart.png'"
                    				onmouseout="this.src='../img/empty_heart.png'">
                    				<p><%=like %></p>
								</div>
							<%}
									//좋아요를 누른경우
								else if(result == 0){%>
								
								<div id="" class="img_size" onclick="likeCancel()">
									<img src="../img/fill_heart.png" 
                    				onmouseover="this.src='../img/empty_heart.png'"
                    				onmouseout="this.src='../img/fill_heart.png'">
                    				<p><%=like %></p>
								</div>
							<%}%>
							</td>
							<%
								int basketChk = dao.basketChk(pNo, bId);
							%>
							<input type="hidden" value="<%=basketChk %>" id="basketChk">
							<td	>
								<div id="myCart_icon" class="img_size" onclick="basketChk()">
									<img alt="장바구니" src="../img/myCart.png">
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<%}%>
	</section>

<jsp:include page="../include/footer.jsp"/>



</body>
</html>