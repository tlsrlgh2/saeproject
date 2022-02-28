<%@page import="dao.ManagerDAO"%>
<%@page import="dao.PartnerDAO"%>
<%@page import="dao.BasicDAO"%>
<%@page import="vo.managerMemberInfo"%>
<%@page import="vo.AccountMemberInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="vo.BasicMemberInfo"%>
<%@page import="dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPageCheck.css?ver=7">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/find_ID_PW.js?ver=7"></script>
</head>
<body id="find">
<section>
	<div class="Content">
		<fieldset class="Content">
			<legend class="Content">회원 ID 찾기 결과</legend>
			<%
				String member = session.getAttribute("member").toString();
				String tel="";
				if(member.equals("basic")){
					tel = request.getParameter("tel");
					
					if(tel.length() == 9) {
						tel = request.getParameter("tel").substring(0,2)
								+ "-" +request.getParameter("tel").substring(2,5) 
								+ "-" +request.getParameter("tel").substring(5,9);
						System.out.println(tel);
					} else if(tel.length() == 10) {
						tel = request.getParameter("tel").substring(0,3)
								+ "-" +request.getParameter("tel").substring(3,6) 
								+ "-" +request.getParameter("tel").substring(6,10);
						System.out.println(tel);
					} else {
						tel = request.getParameter("tel").substring(0,3)
								+ "-" +request.getParameter("tel").substring(3,7) 
								+ "-" +request.getParameter("tel").substring(7,11);
						System.out.println(tel);
					}
					
					String email = request.getParameter("email");
					String bid="";
					BasicDAO dao = BasicDAO.getInstance();
					List<BasicMemberInfo> list = dao.find_id(tel,email);
						
					if(list.isEmpty()) {
					%>
						<h4>아이디가 존재하지 않습니다</h4><br><br>
						<input type="button" value="메인화면 가기" class="check" onclick="find_end_main()">
					<%
					}else if(!list.isEmpty()){
						for(BasicMemberInfo bm : list) {
							bid = bm.getbId();
						}
						%>
							<span>아이디 : <%=bid %></span><br><br>
							<input type="button" value="로그인 하러 가기 " class="check2" onclick="find_end()">	<!-- js작업해야함 -->
							
						<%
					}
				} else if (member.equals("account")){
					tel = request.getParameter("tel");
					
					if(tel.length() == 9) {
						tel = request.getParameter("tel").substring(0,2)
								+ "-" +request.getParameter("tel").substring(2,5) 
								+ "-" +request.getParameter("tel").substring(5,9);
						System.out.println(tel);
					} else if(tel.length() == 10) {
						tel = request.getParameter("tel").substring(0,3)
								+ "-" +request.getParameter("tel").substring(3,6) 
								+ "-" +request.getParameter("tel").substring(6,10);
						System.out.println(tel);
					} else {
						tel = request.getParameter("tel").substring(0,3)
								+ "-" +request.getParameter("tel").substring(3,7) 
								+ "-" +request.getParameter("tel").substring(7,11);
						System.out.println(tel);
					}
					String email = request.getParameter("email");
					System.out.println(tel);
					System.out.println(email);
					String aid="";
					PartnerDAO dao = PartnerDAO.getInstance();
					List<AccountMemberInfo> list = dao.account_find_id(tel, email);
						
					if(list.isEmpty()) {
					%>
						<h4>아이디가 존재하지 않습니다</h4><br><br>
						<input type="button" value="메인화면 가기" class="check" onclick="find_end_main()">
					<%
					}else if(!list.isEmpty()){
						for(AccountMemberInfo am : list) {
							aid = am.getaId();
						}
						%>
							<span>아이디 : <%=aid %></span><br><br>
							<input type="button" value="로그인 하러 가기 " class="check2" onclick="find_end()">	<!-- js작업해야함 -->
							
						<%
					}
				} else if (member.equals("manager")){
					tel = request.getParameter("tel");
					
					if(tel.length() == 9) {
						tel = request.getParameter("tel").substring(0,2)
								+ "-" +request.getParameter("tel").substring(2,5) 
								+ "-" +request.getParameter("tel").substring(5,9);
						System.out.println(tel);
					} else if(tel.length() == 10) {
						tel = request.getParameter("tel").substring(0,3)
								+ "-" +request.getParameter("tel").substring(3,6) 
								+ "-" +request.getParameter("tel").substring(6,10);
						System.out.println(tel);
					} else {
						tel = request.getParameter("tel").substring(0,3)
								+ "-" +request.getParameter("tel").substring(3,7) 
								+ "-" +request.getParameter("tel").substring(7,11);
						System.out.println(tel);
					}
					
					String email = request.getParameter("email");
					String mid="";
					ManagerDAO dao = ManagerDAO.getInstance();
					List<managerMemberInfo> list = dao.manager_find_id(tel, email);
						
					if(list.isEmpty()) {
					%>
						<h4>아이디가 존재하지 않습니다</h4><br><br>
						<input type="button" value="메인화면 가기" class="check" onclick="find_end_main()">
					<%
					}else if(!list.isEmpty()){
						for(managerMemberInfo mm : list) {
							mid = mm.getmId();
						}
						%>
							<span>아이디 : <%=mid %></span><br><br>
							<input type="button" value="로그인 하러 가기 " class="check2" onclick="find_end()">	<!-- js작업해야함 -->
							
						<%
					}
				}
				
			%>
			
		</fieldset>
	</div>
</section>
</body>
</html>