<%@page import="dao.ManagerDAO"%>
<%@page import="vo.BasicMemberInfo"%>
<%@page import="vo.AccountMemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.AccountMemberInfo"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProjectDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/management_choice.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/member_management.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">	
	<div class="Content">
		<h2>회원 관리 페이지</h2>
			<form action="../managerView/manager_choice.jsp" method="POST" id="radio">
				<input type="radio" value="basic"  name="member" id="member">일반 회원&nbsp;&nbsp;
				<input type="radio" value="account" name="member" id="member"  checked="checked">파트너사&nbsp;&nbsp;
				<input type="submit" value="조회">&nbsp;&nbsp;
			</form>
			<%
				String member = request.getParameter("member");
				ManagerDAO dao = ManagerDAO.getInstance();

				
				String bid, btel, bname,aid, atel, aname;
	
				
				
				
				int pageSize = 8; //한페이지에 출력할 레코드 수
				
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
				
				count = dao.account_management_count();
				System.out.println(count);
	
				List<AccountMemberInfo> alist = (List) dao.GetList_account_management(startRow, endRow);
				
				
				if (alist.isEmpty()) {
				%>
				<div class="empty">
					<img alt="멤버" src="../img/member.png" class="empty">
					<p class="empty">조회할 회원이 없습니다.</p>
				</div>
				<%
				} else if(!alist.isEmpty()) {%>
					<table class="memberList">
					<thead align="center">
						<th class="memberList">파트너사 아이디</th>
						<th class="memberList">파트너사 전화번호</th>
						<th class="memberList">회사이름</th>
						<th class="memberList">회원 탈퇴</th>
					</thead>
					<tbody align="center">
					<%
					for(AccountMemberInfo am : alist){
						aid = am.getaId();
						atel = am.getaTel1();
						aname = am.getaName();
						%>
					<tr class="myBoardList">
						<td class="myBoardList"><%=aid %></td>
						<td class="myBoardList"><%=atel %></td>
						<td class="myBoardList"><%=aname %></td>
						<td class="myBoardList">
							<form action="../delete/deleteAccount_member.jsp">
								<input type="submit" value="회원 탈퇴" onclick="return delete_account_Memeber()">
								<input type="hidden" name="aid" id="aid" value="<%=aid%>">
							</form>
						</td>
					</tr>	
					<%}%>
				<%}%>
					</tbody>
					<tfoot>
 					<tr align="center">
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
								<a href="../load/account_management.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
					<%			
							}
							
							for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
								if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
					%>
									[<%=i %>]
					<%									
								}else{ // 현재 페이지가 아닌 경우 링크 설정
					%>
									<a href="../load/account_management.jsp?pageNum=<%=i%>">[<%=i %>]</a>
					<%	
								}
							} // for end
							
							if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
					%>
								<a href=../load/account_management.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
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
</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>