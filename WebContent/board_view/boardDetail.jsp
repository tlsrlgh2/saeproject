<%@page import="vo.CommentView"%>
<%@page import="java.util.List"%>
<%@page import="vo.BoardView"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/freeBoard.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/board.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

 <section>
 	<div class="Main2">
 		<fieldset class="boardDetail">
 			<legend>Helth Mania 게시글 상세보기</legend>
 				<table class="boardList">
 				<%
 					List<BoardView> list = (List)request.getAttribute("boardDetail");
 					String qNo,qWriter,qTitle,qDate,qContent;
 					for(BoardView bv : list){
 						qNo = bv.getQno();
 						qWriter = bv.getQname();
 						qDate = bv.getQdate();
 						qTitle = bv.getQtitle();
 						qContent = bv.getQcontent();
 					%>
 					<tr>	
 						<th class="details">게시물 번호</th>
 						<td class="wirterdata"><%=qNo %></td>
 					</tr>
 					<tr>	
 						<th class="details">게시물 제목 </th>
 						<td class="wirterdata"><%=qTitle %></td>
 					</tr>
 					<tr>	
 						<th class="details">작성자</th>
 						<td class="wirterdata"><%=qWriter %></td>
 					</tr>
 					<tr>	
 						<th class="details">작성날짜</th>
 						<td class="wirterdata"><%=qDate %></td>
 					</tr>
 					<tr>	
 						<th class="details">게시물 내용</th>
 						<td><p class="content"><%=qContent %></p></td>
 					</tr>
 					<form action="../delete/boardDelete.jsp" method="post" name="dfrm">
 					<tr>
 						<input type="hidden" name="qWriter" id="qWriter" value="<%=qWriter%>">
 						<input type="hidden" name="qno" id="qNo" value="<%=qNo%>">
 						<input type="hidden" value="<%=session.getAttribute("basicId")%>" id="bid1">
 						<input type="hidden" value="<%=session.getAttribute("accountId")%>" id="aid1">
 						<input type="hidden" value="<%=session.getAttribute("managerId")%>" id="mid1">
 						<td colspan="2" class="board_btn">
 						<input type="button" value="게시글 수정" class="move_btn" onclick="return boardCorrect()"> 
 						<input type="submit" value="게시글 삭제" class="move_btn" onclick="return boardDelete()">
 						</td>
 					</tr>
 					</form>
 				</table>
 			<div class="comment">
 				
 				<% 
 				String bid = String.valueOf(session.getAttribute("basicId"));
 				String aid = String.valueOf(session.getAttribute("accountId"));
 				String mid = String.valueOf(session.getAttribute("managerId"));
 						
 						if(bid.equals("null")&&aid.equals("null")&&mid.equals("null")){%>
 						
 						<span>댓글을 작성하려면 <a href="../view/login_view.jsp">로그인</a>해주세요.</span>
 						
 						
 							
 						<%}else if(!bid.equals("null")){%>
 						<form action="../save/commentSave.jsp" method="POST" name="frm">
 						<ul class="comment">
 							<li>
 								<input type="hidden" name="qno" value="<%=qNo %>">
 								댓글 작성자: <input type="text" value="<%=session.getAttribute("basicId")%>" name="commentWriter" id="commentWriter" class="commentWriter" readonly>
 							</li>
 							<li><input type="text" name="comment" id="comment" placeholder="댓글을 작성해 주세요."></li>
 							<li><input type="submit" value="댓글작성" onclick="return commentChk()"></li>
 						</ul>
 						</form>
 					<%}else if(!aid.equals("null")){%>
 					<form action="../save/commentSave.jsp" method="POST" name="frm">
 						<ul class="comment">
 							<li>
 								<input type="hidden" name="qno" value="<%=qNo %>">
 								댓글 작성자: <input type="text" value="<%=session.getAttribute("accountId")%>" name="commentWriter" id="commentWriter" class="commentWriter" readonly>
 							</li>
 							<li><input type="text" name="comment" id="comment" placeholder="댓글을 작성해 주세요."></li>
 							<li><input type="submit" value="댓글작성" onclick="return commentChk()"></li>
 						</ul>
 						</form>
 					<%}else if(!mid.equals("null")){%>
 					<form action="../save/commentSave.jsp" method="POST" name="frm">
 						<ul class="comment">
 							<li>
 								<input type="hidden" name="qno" value="<%=qNo %>">
 								댓글 작성자: <input type="text" value="<%=session.getAttribute("managerId")%>" name="commentWriter" id="commentWriter" class="commentWriter" readonly>
 							</li>
 							<li><input type="text" name="comment" id="comment" placeholder="댓글을 작성해 주세요."></li>
 							<li><input type="submit" value="댓글작성" onclick="return commentChk()"></li>
 						</ul>
 					</form>
 					<%}%>
 				<%}%>
 				
 			</div>
 			
 			<%
 					List<CommentView> clist = (List)request.getAttribute("commentView");
 					String cName,cDate,cContent,qNo2,cPw,cNo;	
 					
 					if(clist.isEmpty()){%>
 						<div class="commentList">
 							<img alt="댓글" src="../img/comment.png" class="noComment">
 							<p>등록된 댓글이 없습니다.</p>
 						</div>	
 					<%}else if(clist!=null){%>
 						<div class="commentList">
 							
 							<form action="../delete/commentDelete.jsp" method="post" name="fm">	
 							<table class="commentList">
 								<thead>
 									<tr>
 										<th colspan="4">댓글 리스트</th>
 									</tr>
 									<th>작성자</th>
 									<th>댓글내용</th>
 									<th>작성날짜</th>
 									<th class="cPw">삭제</th>
 								</thead>
							<%
								int cnt = 0;
								for(CommentView cm : clist){
								cnt++;
								cNo = cm.getcNo();
								cName = cm.getcWriter();
								cDate = cm.getcDate();
								cContent = cm.getcContent();
								qNo2 = cm.getqNo();
								System.out.println(cnt);
								%>
								
								<tr>
									<td class="cName"><%=cName %></td>
									<td class="cContent"><%=cContent %></td>
									<td class="cDate"><%=cDate %></td>
									<td class="cPw">
									
										<input type="hidden" name=bid2 id="bid2" value="<%=session.getAttribute("basicId")%>">
										<input type="hidden" name=aid2 id="aid2" value="<%=session.getAttribute("accountId")%>">
										<input type="hidden" name=mid2 id="mid2" value="<%=session.getAttribute("managerId")%>">
										<input type="hidden" name=no id="no<%=cnt%>" value="<%=cNo %>" >
										<input type="hidden" name=cName id="cName<%=cnt %>" value="<%=cName%>">
										<input type="hidden" name="qNo2" id="qNo2" value="<%=qNo2%>">
										<input type="hidden" name="cNo" id="cNo">
										<input type="submit" value="삭제" class="dlt_btn" onclick="return deleteChk(<%=cnt%>)">
									</td>	
								</tr>
								<%}%>		
								</table>
								
							</form>	
						</div>
 					<%}%>
 					
 					
 			
 		</fieldset>
 	</div>
 </section>

<jsp:include page="../include/footer.jsp"/>


</body>
</html>