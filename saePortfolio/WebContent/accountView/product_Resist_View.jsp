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
<link type="text/css" rel="stylesheet" href="../css/productResist.css?ver=5">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/productResist.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
	
	<section class="">
		<div class="Main">
			
			<h2>파트너사 상품등록</h2>
				<div class="Content">
						<form action="../save/productSave.jsp" method="POST" name="frm">
						<div class="img">
							<img src="../img/noimage.jpg" id="preview">
						</div>
						<table class="resist">
							<tr>
								<th>상품사진</th>
								<td>
								<input type="file" class="hidden_input" id="imageSelector" name="imageSelector" 
								accept="image/jpeg, image/jpg, image/png" onchange="readURL(this);" />
								</td>
							</tr>
							<%
								String aId = String.valueOf(session.getAttribute("accountId"));
							%>
							<input type="hidden" name="aId" value="<%=aId%>">
							<tr>
								<th>상품명</th>
								<td class="pName"><input type="text" class="inputS" id="pName" name="pName" placeholder="상품명"></td>
							</tr>
							<tr>
								<th>파트너사</th>
								<td><input type="text" class="inputS" name="id" value="<%=session.getAttribute("accountId")%>" disabled></td>							
							</tr>
							<tr>
								<th>상품가격</th>
								<td><input type="varchar2" class="inputS" name="pPrice" id="pPrice" placeholder="상품가격"  onkeyup="inputNumberFormat(this)"/>원</td>
							</tr>
							<tr>
								<th>상품설명</th>
								<td> 
								<textarea rows="8" cols="50" maxlength="100" name="pContent">100자 이내로 간단하게 상품 설명을 작성하세요.</textarea>
								</td>
							</tr>
							<tr>
								<th>상품수량</th>
								<td><input type="number" class="inputS" name="pAmount" placeholder="상품수량" min="1" max="1000" ></td>
							</tr>
						</table>
						<div class="btn">
							<input type="submit" value="상품등록" onclick="return productCheck()">
						</div>
					</form>
				</div>
    	</div>
	</section>
<jsp:include page="../include/footer.jsp"/>

</body>
</html>