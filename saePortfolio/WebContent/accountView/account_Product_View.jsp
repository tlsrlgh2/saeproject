<%@page import="dao.PartnerDAO"%>
<%@page import="vo.ProductList"%>
<%@page import="vo.BoardView"%>
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
	<link type="text/css" rel="stylesheet" href="../css/myPageProduct.css?ver=5">
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
	<h2>나의 상품 관리</h2>
			<%
			String id = String.valueOf(session.getAttribute("accountId"));
			PartnerDAO dao = PartnerDAO.getInstance();
			
			int pageSize = 5; //한페이지에 출력할 레코드 수
				
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
			
			count = dao.myProduct_count(id);
			System.out.println(count);
				
				
			List<ProductList> list = (List)dao.getList_myProduct(startRow, endRow, id);
			String pno,pimage,pname,pprice,pamount,pbuytotal;
			
			if(list.isEmpty()){%>
				<div class="empty">
					<img alt="상품" src="../img/product.png" class="product">
					<p class="empty">나의 등록한 상품이 없습니다.</p>
					<a class="empty" href="product_Resist_View.jsp">나의 상품등록</a>
				</div>
			<%}else if(!list.isEmpty()){%>
			<h5>나의 등록된 상품 개수 <%=count%>개</h5>
				<table class="myProductList">
				<thead>
					<th class="myProductList">상품번호</th>
					<th class="myProductList">Image</th>
					<th class="myProductList">상품명</th>
					<th class="myProductList">상품가격</th>
					<th class="myProductList">상품수량</th>
					<th class="aMount">판매수</th>
					<th class="btn">수정/삭제</th>
				</thead>
				<tbody>
				<%
				int cnt = 0;
				for(ProductList pl : list){
					cnt++;
					pno = pl.getpNo();
					pimage = pl.getpImage();
					pname = pl.getpName();
					pprice = pl.getpPrice();
					pamount = pl.getpAmount();
					pbuytotal = pl.getpBuyTotal();
					%>
						<tr class="myProductList">
							<td class="myProductList"><%=pno %></td>
							<input type="hidden" name="pno" value="<%=pno%>" id="pNo<%=cnt%>">
							<td class="myProductList"><img src="../Product_Img/<%=pimage %>" alt="상품사진" class="product"></td>
							<td class="myProductList"><a href="../load/productLoad.jsp?pno=<%=pno %>"><%=pname %></td>
							<td class="myProductList"><%=pprice %>원</td>
							<td class="myProductList"><%=pamount %></td>
							<td class="myProductList"><%=pbuytotal %></td>
							<td class="myProductList">
								<input type="button" id="modification" value="수정" onclick="productCorrect(<%=cnt%>)"> /
								<input type="button" id="delete" value="삭제" onclick="productDelete(<%=cnt%>)">
							</td>
						</tr>
										
				<%}%>
			<%}%>
			</tbody>
			<tfoot>
 					<tr align="center">
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
								<a href="account_Product_View.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="account_Product_View.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="account_Product_View.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
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
<jsp:include page="../include/footer.jsp"/>

<script type="text/javascript">
	function productDelete(cnt) {
		var pNo = document.getElementById('pNo'+cnt).value;
		if (confirm("상품을 삭제 하시겠습니까?") == true){    //확인
			 alert('성공적으로 삭제되었습니다.');
			location.href = '../delete/productDelete.jsp?pno='+pNo;
		 }else{   //취소
		     return false;
		 }	
	}
	
	function productCorrect(cnt) {
		var pNo = document.getElementById('pNo'+cnt).value;
		location.href = 'product_Correct_View.jsp?pno='+pNo;		
	}
</script>
</body>
</html>