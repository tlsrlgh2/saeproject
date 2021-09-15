<%@page import="vo.BoardView"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="../css/body.css">
	<link type="text/css" rel="stylesheet" href="../css/freeBoard.css">
	<link type="text/css" rel="stylesheet" href="../css/include.css">
	<script type="text/javascript" src="../script/board.js?ver=8"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

 <section>
 	<div class="Main">
 		<fieldset class="boardDetail">
 			<legend>Helth Mania 게시글 수정</legend>
 				<form action="../correct/boardCorrect.jsp" method="post" name="frm">
 				<table class="boardCorrect">
 				<%
 					List<BoardView> list = (List)request.getAttribute("boardCorrect");
 					String qNo,qWriter,qTitle,qDate,qContent;
 					
 					for(BoardView bv : list){
 						qNo = bv.getQno();
 						qWriter = bv.getQname();
 						qDate = bv.getQdate();
 						qTitle = bv.getQtitle();
 						qContent = bv.getQcontent();
 					%>
 					<tr>	
 						<th>게시물 번호</th>
 							<input type="hidden" name="qno" value="<%=qNo %>">
 						<td><input type="text" name="qNo" value="<%=qNo %>" disabled class="correct"></td>
 					</tr>
 					<tr>	
 						<th>게시물 제목 </th>
 						<td><input type="text" name="title" value="<%=qTitle %>" class="correct"></td>
 					</tr>
 					<tr>	
 						<th>작성자</th>
 						<td><input type="text"  value="<%=qWriter %>" disabled class="correct"></td>
 					</tr>
 					<tr>	
 						<th>작성날짜</th>
 						<td><input type="text" name="qDate" value="<%=qDate %>" disabled class="correct"></td>
 					</tr>
 					<tr>	
 						<th>게시물 내용</th>
 						<td><textarea name="content" rows="15" cols="77" maxlength="500"><%=qContent %></textarea></td>
 					</tr>
 					<tr>
 						<td colspan="2" class="board_btn"><input type="submit" value="수정완료" onclick="return boardChk2()"></td>
 					</tr>
 				</table>
 				</form>
 				<%}%>
 			
</body>
</html>