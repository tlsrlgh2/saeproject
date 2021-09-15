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
<link type="text/css" rel="stylesheet" href="../css/freeBoard.css?ver=5">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/board.js?ver=5"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

 <section>
 	<div class="Main">
 		
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
 						
 						count = dao.getCount();
 						
 						List<BoardView> list = (List)dao.getList(startRow,endRow);
 						
 						String qno,qcategory,qname,qdate,qtitle;
 						%>
 		
 		
 		<fieldset>
 			<legend>Helth Mania Q&A 자유게시판</legend>
 			<div class="title">
 			<p>총 <%=count %> 개의 게시물이 있습니다.</p>
 			</div>
 			
 						<%
 						if(list.isEmpty()){%>
 							<div class="empty">
 								<img alt="게시판" src="../img/게시판.png" class="empty">
 								<p class="empty">게시판에  등록된 게시글이 없습니다.</p>
 							</div>
 							
 							
 						<%}else if(!list.isEmpty()){%>
 						
 				<table class="boardList">
 					<thead>
 						<tr>
 							<th class="no">No.</th>
 							<th class="category">회원유형</th>
 							<th class="title">게시글 제목</th>
 							<th class="writer">작성자</th>
 							<th class="date">작성일</th>
 						</tr>
 					</thead>
 				<tbody>
 						<%
 						for(BoardView bv : list){
 							qno = bv.getQno();
 							qcategory = bv.getQcategory();
 							qname = bv.getQname();
 							qdate = bv.getQdate();
 							qtitle = bv.getQtitle();
 					%>		
 					<tbody>
 						<tr>
 							<td><%=qno %></td>
 							<td><%=qcategory %></td>
 							<td><a href="../load/boardLoad.jsp?qno=<%=qno %>"><%=qtitle %></a></td>
 							<td class="changeColor"><%=qname %></td>
 							<td class="changeColor"><%=qdate %></td>
 						</tr>
 				</tbody>
 				<%}%>
 	 			<tfoot>
 					<tr>
 						<td class="page" colspan="5">
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
								<a href="freeBoard_View.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="freeBoard_View.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href="freeBoard_View.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
					<%			
							}
						}
					%>
 						</td>
 					</tr>
 					
 				</tfoot>
 			</table>
 			<%}%>
 			<div class="board_btn">
	 			<input type="hidden" value="<%=session.getAttribute("basicId")%>" id="bId">
	 			<input type="hidden" value="<%=session.getAttribute("accountId")%>" id="aId">
	 			<input type="hidden" value="<%=session.getAttribute("managerId")%>" id="mId">
	 			<input type="button" class="back_b" value="게시글 작성" onclick="boardPermit()">
 			</div>
 			<div>
 				<form action="../search_board/search_select.jsp" method="POST" id="search" name= "frm">
	 				<select id="search_select" name="search_select">
	 					<option value="title_search">제목 검색</option>
	 					<option value="contents_search">내용 검색</option>
	 					<option value="all_search">제목 + 내용 검색</option>
	 					<option value="writer_search">작성자 검색</option>
	 				</select>
	 				<input type="text" name="search_text" id="search_text">
	 				<input type="submit" class="select" value="검색" onclick="return search_chk()">
 				</form>
 			</div>
 		</fieldset>
 	</div>
 </section>

<jsp:include page="../include/footer.jsp"/>


</body>
</html>