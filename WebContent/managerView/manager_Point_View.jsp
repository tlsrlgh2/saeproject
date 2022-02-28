<%@page import="dao.ManagerDAO"%>
<%@page import="jdk.nashorn.internal.ir.SetSplitState"%>
<%@page import="vo.PointInfo"%>
<%@page import="vo.AccountMemberInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BasicMemberInfo"%>
<%@page import="vo.managerMemberInfo"%>
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
<link type="text/css" rel="stylesheet" href="../css/myPage.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/manager_Point.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPageScript.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">
	<jsp:include page="../include/Manager_MyPageSideBar.jsp"/>
		
		<div class="Content">
			<h2>포인트 충전요청내역</h2><br>
				<form action="../correct/pointCharge.jsp" method="post" name="frm">
					<table class="point"> 
						<thead>
							<%
								ManagerDAO dao = ManagerDAO.getInstance();
								
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
								
								count = dao.GetList_Request_count();
								
								List<PointInfo> list = dao.GetList_Request(startRow, endRow);
								
								if(list.isEmpty()) {
									%>
										<div class="empty" align="center">
											<img alt="게시판" src="../img/point_icon.png" class="empty">
											<br><br>
											<p class="empty">포인트 요청이 없습니다</p>
										</div>
									<% 
								} else if(!list.isEmpty()) {
									%>
								<tbody align="center">
									<tr>
										<th class="pno">요청번호</td>
										<th class="point">아이디</td>
										<th class="point">충전포인트</td>
										<th class="point">요청상태</td>
										<th class="point">입금은행</td>
										<th class="point">요청날짜</td>
										<th class="cf">Confirm</td>
									</tr>
								</tbody>
								<%
								int cnt = 0;
								for(PointInfo pv : list){
									String pNo,bId,rqp,pResult,rDate,bank,afp;
									cnt++;
									pNo = pv.getPno();
									bId = pv.getBid();
									rqp = pv.getRqp();
									afp = pv.getAfterpoint();
									rDate = pv.getRdate();
									bank = pv.getBank();
									pResult = pv.getPresult();
								%>
									<tbody align="center">
										<tr>
											<td class="point"><%=pNo %></td>
											<td class="point"><%=bId %></td>
											<td class="point"><%=rqp %></td>
											<td class="point"><%=pResult %></td>
											<td class="point"><%=bank %></td>
											<td class="point"><%=rDate %></td>
												
											<td><input type="submit" class="chk_deposit" value="입금확인" onclick="return pointChk(<%=cnt%>)"></td>
											
											<input type="hidden" name="pno" value="<%=pNo %>" id ="pno<%=cnt%>">
											<input type="hidden" name="afp" value="<%=afp %>" id ="afp<%=cnt%>">
											<input type="hidden" name="bid" value="<%=bId %>" id = "bid<%=cnt%>">
											<input type="hidden" name="pResult" value="<%=pResult%>" id="pResult<%=cnt%>">
											<input type="hidden" name="id" id="id">
											<input type="hidden" name="point" id="point">
											<input type="hidden" name="no" id="no">
										</tr>
									</tbody>
									<%}%>
								<%}%>
						</thead>
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
										<a href="../managerView/manager_Point_View.jsp?pageNum=<%=startPage - 10%>">[이전]</a>	
							<%			
									}
									
									for(int i=startPage; i <= endPage; i++){ // 페이지 블록 번호
										if(i == currentPage){ // 현재 페이지에는 링크를 설정하지 않음
							%>
											[<%=i %>]
							<%									
										}else{ // 현재 페이지가 아닌 경우 링크 설정
							%>
											<a href="../managerView/manager_Point_View.jsp?pageNum=<%=i%>">[<%=i %>]</a>
							<%	
										}
									} // for end
									
									if(endPage < pageCount){ // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
							%>
										<a href="../managerView/manager_Point_View.jsp?pageNum=<%=startPage + 10 %>">[다음]</a>
							<%			
									}
								}
							%>
		 						</td>
		 					</tr>
		 				</tfoot>
					</table>
				</form>
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>


</body>
</html>