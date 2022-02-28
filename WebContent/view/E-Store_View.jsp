<%@page import="dao.ProjectDAO"%>
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
<link type="text/css" rel="stylesheet" href="../css/eStore.css?ver=5">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

	<div class="Content">
		<div class="promotion">
			<img class="mySlides" src="../img/promotion_1.jpg" alt="배너">
					<img class="mySlides" src="../img/promotion_2.jpg" alt="배너" onclick="">
					<img class="mySlides" src="../img/promotion_3.PNG" alt="배너" onclick="">
		</div>
			<div class="algin">
				<ul class="category">
					<li>
						<a href="E-Store_View.jsp?choice=1"<% if("1".equals(request.getParameter("choice"))) {%>class="selected"<%} %>>
							상품 판매순
						</a>
					</li>
					<li>
						<a href="E-Store_View.jsp?choice=2"<% if("2".equals(request.getParameter("choice"))) {%>class="selected"<%} %>>
							낮은 가격순
						</a>
					</li>
					<li>
						<a href="E-Store_View.jsp?choice=3"<% if("3".equals(request.getParameter("choice"))) {%>class="selected"<%} %>>
							높은 가격순
						</a>
					</li>
				</ul>
			</div>
		
		<div class="ProductList">
			<%
			ProjectDAO dao = ProjectDAO.getInstance();
			
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
			
			count = dao.eStore_count();
			
			String choice = request.getParameter("choice");
				
			List<ProductList> list = (List)dao.getList_Estore(startRow, endRow, choice);
			String pno,pimage,pname,pprice,aid,pbuytotal;
			
			if(list.isEmpty()){%>
				<div class="empty">
					<img alt="product" src="../img/product.png" class="productEmp">
					<p>등록된 상품이 없습니다.</p>
				</div>
			<%}else if(!list.isEmpty()){%>
				<table class="E-StoreList">
				<thead>
					<tr>
						<th class="E-StoreList" colspan="6" align="right"><h5>E-STORE에 등록된 총 상품 개수 <%=count%>개 &nbsp;&nbsp;</h5></th>
					</tr>
					<th class="E-StoreList">상품번호</th>
					<th class="E-StoreList">상품이미지</th>
					<th class="E-StoreList">상품명</th>
					<th class="E-StoreList">상품가격</th>
					<th class="E-StoreList">판매수</th>
					<th class="E-StoreList">판매자명</th>
				</thead>
				<tbody>
				<%
				for(ProductList pl : list){
					pno = pl.getpNo();
					pimage = pl.getpImage();
					pname = pl.getpName();
					pprice = pl.getpPrice();
					aid = pl.getaId();
					pbuytotal = pl.getpBuyTotal();
					%>
						<tr class="E-StoreList">
							<td class="E-StoreList"><%=pno %></td>
							<td class="E-StoreList"><img src="../Product_Img/<%=pimage %>" alt="상품사진" class="product"></td>
							<td class="E-StoreList"><a href="../load/productLoad.jsp?pno=<%=pno %>"><%=pname %></td>
							<td class="E-StoreList"><%=pprice %>원</td>
							<td class="E-StoreList"><%=pbuytotal %></td>
							<td class="E-StoreList"><%=aid %></td>
						</tr>
										
				<%}%>
			<%}%>
			</tbody>
			<tfoot>
 					<tr align="center">
 						<td class="page" colspan="6">
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
								<a href="myWriteLoad.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="myWriteLoad.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="myWriteLoad.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
 						</td>
 					</tr>
 				</tfoot>
			</table>	
		</div>
	</div>
		</div>
	</div>
<jsp:include page="../include/footer.jsp"/>
<script type="text/javascript">
//메인이미지 자동 슬라이드쇼 스크립트
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
}


var slideIndex1 = 0;
carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    slideIndex1++;
    if (slideIndex1 > x.length) {slideIndex1 = 1}
    x[slideIndex1-1].style.display = "block";
    setTimeout(carousel, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>