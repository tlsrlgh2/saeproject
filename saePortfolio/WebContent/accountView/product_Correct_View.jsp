<%@page import="vo.ProductList"%>
<%@page import="dao.PartnerDAO"%>
<%@page import="dao.ProjectDAO"%>
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
<link type="text/css" rel="stylesheet" href="../css/productCorrect.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/productCorrect.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
	
	<section class="">
		<div class="Main">
			
			<h2>파트너사 상품수정</h2>
				<div class="Content">
						<form action="../correct/productCorrect.jsp" method="POST" name="frm">
						<table class="resist">
						<%
							String aId = String.valueOf(session.getAttribute("accountId"));
							String pNo = request.getParameter("pno");
							PartnerDAO dao = PartnerDAO.getInstance();
							List<ProductList>list = dao.getProductInfo(pNo);
							
							String pName,pImage,pContent,pPrice,pAmount;
							
							for(ProductList pl : list){
								pName = pl.getpName();
								pImage = pl.getpImage();
								pContent = pl.getpContent();
								pPrice = pl.getpPrice();
								pAmount = pl.getpAmount();
								%>
							<div class="img"> <img src="../Product_Img/<%=pImage %>" id="preview"></div>
							<tr>
								<input type="hidden" name="pNo" value="<%=pNo%>">
								<th>상품사진</td>
								<td>
								<input type="file" class="hidden_input" id="imageSelector" name="imageSelector" 
								accept="image/jpeg, image/jpg, image/png" onchange="readURL(this);" />
								</td>
							</tr>
							<tr>
								<th>상품명</td>
								<td class="pName"><input type="text" class="inputS" name="pName" value="<%=pName%>"></td>
							</tr>
							<tr>
								<th>파트너사</td>
								<td><input type="text" class="inputS" name="id" value="<%=session.getAttribute("accountId")%>" disabled></td>							
							</tr>
							<tr>
								<th>상품가격</td>
								<td><input type="varchar2" class="inputS" name="pPrice" id="pPrice" value="<%=pPrice %>"  onkeyup="inputNumberFormat(this)"/>원</td>
							</tr>
							<tr>
								<th>상품설명</td>
								<td> 
								<textarea rows="8" cols="50" maxlength="100" name="pContent"><%=pContent %></textarea>
								</td>
							</tr>
							<tr>
								<th>상품수량</td>
								<td><input type="number" class="inputS" name="pAmount" value="<%=pAmount %>" min="1" max="1000" ></td>
							</tr>
							<%}%>
						</table>
						<div class="btn">
							<input type="submit" value="상품수정" onclick="return productCheck()">
						</div>
					</form>
				</div>
    	</div>
	</section>
<jsp:include page="../include/footer.jsp"/>

</body>
</html>