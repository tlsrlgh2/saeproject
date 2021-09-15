<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/freeBoard.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/board.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
 <section>
 	<div class="Main">
 		<fieldset>
 			<legend>Helth Mania 게시글 작성</legend>
 			<form action="../save/boardSave.jsp" method="POST" name="frm">
 			<div class="title">
 			<table class="boardWrite">
 				<tr>
 					<th>게시글 제목</th>
 					<td><input type="text" maxlength="50" name="title" class="writer"></td>
 				</tr>
 				<%
 				String bid = String.valueOf(session.getAttribute("basicId"));
 				String aid = String.valueOf(session.getAttribute("accountId"));
 				String mid = String.valueOf(session.getAttribute("managerId"));
 				
 				if(!bid.equals("null")){%>
 					<tr>
 					<th>작성자</th>
 						<input type="hidden" value="일반회원" name="category">
 					<td><input type="text" value="<%=bid%>" name="writer" readonly class="writer"></td>
 					</tr>
 				<%}else if(!aid.equals("null")){%>
 					<tr>
 					<th>작성자</th>
 						<input type="hidden" value="파트너사회원" name="category">
 					<td><input type="text" value="<%=aid%>" name="writer" readonly class="writer"></td>
 					</tr>
 				<%}else if(!mid.equals("null")){%>
 					<tr>
 					<th>작성자</th>
 						<input type="hidden" value="관리자회원" name="category">
 					<td><input type="text" value="<%=mid %>" name="writer" readonly class="writer"></td>
 					</tr>
 				<%}%>
 				
 				<tr>
 					<th>게시글 내용</th>
 					<td><textarea cols="70" rows="15" name="content"></textarea></td>
 				</tr>
 				
 			</table>
 			<div class="board_btn">
 			<input type="button" value="Q&A 리스트로 돌아가기" onclick="location.href = '../view/freeBoard_View.jsp'">
 			<input type="submit" value="Question 작성" onclick="return boardChk()">
 			</div>
 			</form>
 		</fieldset>
 	</div>
 </section>
<jsp:include page="../include/footer.jsp"/>

</body>
</html>