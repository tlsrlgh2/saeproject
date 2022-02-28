<%@page import="dao.PartnerDAO"%>
<%@page import="vo.ProductList"%>
<%@page import="vo.my_product_orders"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
	<link type="text/css" rel="stylesheet" href="../css/my_product_list.css?ver=6">
	<link type="text/css" rel="stylesheet" href="../css/include.css">
	<script type="text/javascript" src="../script/accountProduct.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">	
	<jsp:include page="../include/accountMyPageSideBar.jsp"/>
	<div class="Content">
	<h2>내 상품 주문 내역보기</h2>
	<br>
	
	<%
		request.setCharacterEncoding("UTF-8");
		String id = session.getAttribute("accountId").toString();
		PartnerDAO dao = PartnerDAO.getInstance();	
		
		int pageSize = 10; //한페이지에 출력할 레코드 수
			
			// 페이지 링크를 클릭한 번호 / 현재 페이지
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){ //클릭한게 없으면 1번 페이지
			pageNum = "1";
		}
		
		//연산을 하기 위한 pageNum 형변환 / 현재 페이지
		
		int currentPage = Integer.parseInt(pageNum);
		
		//해당 페이지에서 시작할 레코드 / 마지막 레코드
		
		int startRow = (currentPage -1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		
		int count = 0;
		String pno,aid,bid,oamout,odate,ono,pname,ppice,totalprice,oaddress;
		
		count = dao.get_mysale_Product_count(id);
		System.out.println(count);
		
		List<my_product_orders> list = dao.get_mysale_Product_list(id, startRow, endRow);
		if(list.isEmpty()) {
		%>
			<div class="empty">
				<img alt="상품" src="../img/product.png" class="product">
				<p class="empty">나의 등록한 상품 또는 판매된 상품이 없습니다.</p>
				<a class="empty" href="product_Resist_View.jsp">나의 상품등록</a>
			</div>
		<%} else if(!list.isEmpty()) {
			%>
			<table class="myProductList">	
			<th class="myProductList">주문 번호</th>
			<th class="myProductList">상품 번호</th>
			<th class="myProductList">상품 이름</th>
			<th class="myProductList">구매자</th>
			<th class="myProductList">수량</th>
			<th class="myProductList">주소</th>
			<th class="myProductList">결제 금액</th>
			<th class="myProductList">결제 일자</th>
				<% 
					for(my_product_orders mpo : list) {
						bid = mpo.getBid();
						oamout = mpo.getOamount();
						oaddress = mpo.getOaddress();
						odate = mpo.getOdate();
						ono = mpo.getOno();
						pname = mpo.getPname();
						pno = mpo.getPno();
						ppice = mpo.getPprice().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
						totalprice = mpo.getTotalprice().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
						%>
						<tr class="myProductList">
							<td class="myProductList" id="ono"><%=ono %></td>
							<td class="myProductList" id="pno"><%=pno %></td>
							<td class="myProductList"id="pname"><%=pname %></td>
							<td class="myProductList" id="bid"><%=bid %></td>
							<td class="myProductList" id="oamount"><%=oamout %></td>
							<td class="myProductList" id="oaddress"><%=oaddress %></td>
							<td class="myProductList" id="totalprice"><%=totalprice %></td>
							<td class="myProductList" id="odate"><%=odate %></td>
						</tr>
					<%}%>
				<%}%>
					<tr>
						<td class="page" colspan="7">
							<%	// 페이징  처리
					if(count > 0){
						// 총 페이지의 수
						int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1);
						// 한 페이지에 보여줄 페이지 블럭(링크) 수
						int pageBlock = 10;
						// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
						int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
						int endPage = startPage + pageBlock - 1;
						
						// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
						if(endPage > pageCount){
							endPage = pageCount;
						}
						
						if(startPage > pageBlock){ // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
				%>
							<a href="product_order_View.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
				<%			
						}
						
						for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
							if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
				%>
								[<%=i %>]
				<%									
							}else{ // 현재 페이지가 아닌 경우 링크 설정
				%>
								<a href="product_order_View.jsp?pageNum=<%=i%>">[<%=i %>]</a>
				<%	
							}
						} // for end
						
						if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
				%>
							<a href="product_order_View.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
				<%			
						}
					}
				%>
						</td>
					</tr>
		</table>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>