<%@page import="dao.BasicDAO"%>
<%@page import="vo.PointInfo"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProjectDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="../css/body.css">
	<link type="text/css" rel="stylesheet" href="../css/myPage.css?ver=7">
	<link type="text/css" rel="stylesheet" href="../css/myPagePoint.css?ver=3">
	<link type="text/css" rel="stylesheet" href="../css/include.css">
	<style type="text/css">
	td.point_1{
		color: red;
	}
	td.point_2{
		color: blue;
	}
	</style>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">	
		<jsp:include page="../include/basicMyPageSideBar.jsp"/>
		<div class="Content">
			<h2>포인트 충전요청내역</h2>
			<table class="point">
				<thead>
					<%
						String id = String.valueOf(session.getAttribute("basicId"));
						BasicDAO dao = BasicDAO.getInstance();
						
						
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
						
						count = dao.GetPoint_basic_count(id);
						System.out.println(count);
						
						List<PointInfo> list = dao.GetPoint_basic_list(startRow, endRow, id);
						
						String pAfterpoint,pbank,pbid,pno,presult,pdate,pRqp;
						
						if(list.isEmpty()) {
						%>
							<div class="empty" align="center">
								<img alt="게시판" src="../img/point_icon.png" class="empty">
								<br><br>
								<p class="empty">포인트 충전 내역이 없습니다</p><br>
								<a class="empty" href="../basicView/myPoint_ChargeView.jsp">포인트 충전하러 가기→</a>
							</div>
						<% 
						}else if(!list.isEmpty()) { 
						%>
					</thead>
					<h5>총 충전 요청 횟수는 <%=count%>회 입니다</h5>
					<tbody align="center">
						<tr>
							<th class="pno">요청번호</td>
							<th class="point">아이디</td>
							<th class="point">충전포인트</td>
							<th class="point">충전 후 포인트</td>
							<th class="point">입금은행</td>
							<th class="point">요청날짜</td>
							<th class="point">요청상태</td>
						</tr>
						<%
						for(PointInfo pi : list) {
							pAfterpoint = pi.getAfterpoint();
							pbank = pi.getBank();
							pbid = pi.getBid();
							pno = pi.getPno();
							presult = pi.getPresult();
							pdate = pi.getRdate();
							pRqp = pi.getRqp();
						%>
						<tr>
							<td class="point"><%=pno %></td>
							<td class="point"><%=pbid %></td>
							<td class="point"><%=pRqp %></td>
							<td class="point"><%=pAfterpoint %></td>
							<td class="point"><%=pbank %></td>
							<td class="point"><%=pdate %></td>
							<%
											if(presult.equals("요청중")) {
												%>
												<td class="point_1" ><%=presult %></td>
												<%
											} else if(presult.equals("충전완료")) {
												%>
												<td class="point_2"><%=presult %></td>
												<%
											}%>
						</tr>
						<%}%>
						<tr>
							<td colspan="7" id="text_right"><a class="empty" href="../basicView/myPoint_ChargeView.jsp">포인트 충전하러 가기→</a></td>
						</tr>
						
						
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
										<a href="pointRequest_View.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
							<%			
									}
									
									for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
										if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
							%>
											[<%=i %>]
							<%									
										}else{ // 현재 페이지가 아닌 경우 링크 설정
							%>
											<a href="pointRequest_View.jsp?pageNum=<%=i%>">[<%=i %>]</a>
							<%	
										}
									} // for end
									
									if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
							%>
										<a href="pointRequest_View.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
							<%			
									}
								}
							%>
		 						</td>
		 					</tr>
						</tfoot>
						<%
						} else {
							System.out.println("pointRequestLoad.jps 에러발생");
						}
						%>
				
			</table> 
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>