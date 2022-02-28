<%@page import="dao.ManagerDAO"%>
<%@page import="dao.PartnerDAO"%>
<%@page import="dao.BasicDAO"%>
<%@page import="vo.managerMemberInfo"%>
<%@page import="vo.AccountMemberInfo"%>
<%@page import="java.util.List"%>
<%@page import="java.lang.reflect.Array"%>
<%@page import="vo.BasicMemberInfo"%>
<%@page import="dao.ProjectDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="db.DBConnection"%>
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPageCheck.css?ver=6">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/find_ID_PW.js?ver=5"></script>
</head>
<body id="find">
<section>
	<div class="Content">
		<fieldset class="Content">
			<legend class="Content">회원 PW 찾기 결과</legend>
			<%
				String member = session.getAttribute("member").toString();
				String tel ="";
				if(member.equals("basic")) {
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
					String id = request.getParameter("id");
					String pw ="";
					BasicDAO dao = BasicDAO.getInstance();
					List<BasicMemberInfo> list = dao.find_pw(tel, id);
						
					if(list.isEmpty()) {
					%>
						<h4>일치하는 아이디 또는 핸드폰번호가 없습니다 </h4><br><br>
						<input type="button" value="메인화면 가기" class="check" onclick="find_end_main()">
					<%
					}else if(!list.isEmpty()){
						request.setCharacterEncoding("UTF-8");
						String bId = request.getParameter("id");
						String bpw = "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92";
						System.out.println(bId);
						
						Connection conn = null;
						PreparedStatement psmt = null;
						
						String sql = "UPDATE basic_member_tbl SET bPw=? WHERE bid = ?";
						
						try{
							conn = DBConnection.getDBconnect();
							conn.setAutoCommit(false);
							psmt = conn.prepareStatement(sql);
							psmt.setString(1, bpw);
							psmt.setString(2, bId);
							
							psmt.executeUpdate();
							
							conn.commit();
							
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							DBConnection.close(psmt, conn);	
						}
						session.setAttribute("basicPw", bpw);
						
						%>	
							<span>아이디 : <%=id %></span><br><br>
							<span>비밀번호를 '123456'으로 초기화하였습니다</span><br><br>
							<input type="button" value="로그인 하러 가기 " class="check2" onclick="find_end()">	<!-- js작업해야함 -->
							
						<%
					}
				} else if(member.equals("account")) {
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
					String id = request.getParameter("id");
					String pw ="";
					PartnerDAO dao = PartnerDAO.getInstance();
					List<AccountMemberInfo> list = dao.account_find_pw(tel, id);
						
					if(list.isEmpty()) {
					%>
						<h4>일치하는 아이디 또는 핸드폰번호가 없습니다 </h4><br><br>
						<input type="button" value="메인화면 가기" class="check" onclick="find_end_main()">
					<%
					}else if(!list.isEmpty()){
						
						request.setCharacterEncoding("UTF-8");
						String aId = request.getParameter("id");
						String apw = "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92";
						System.out.println(aId);
						
						Connection conn = null;
						PreparedStatement psmt = null;
						
						String sql = "UPDATE account_member_tbl SET aPw=? WHERE aid = ?";
						
						try{
							conn = DBConnection.getDBconnect();
							conn.setAutoCommit(false);
							psmt = conn.prepareStatement(sql);
							psmt.setString(1, apw);
							psmt.setString(2, aId);
							
							psmt.executeUpdate();
							
							conn.commit();
							
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							DBConnection.close(psmt, conn);	
						}
						session.setAttribute("accountPw", apw);
						%>	
							<span>아이디 : <%=id %></span><br><br>
							<span>비밀번호를 '123456'으로 초기화하였습니다</span><br><br>
							<input type="button" value="로그인 하러 가기 " class="check2" onclick="find_end()">	<!-- js작업해야함 -->
							
						<%
					}
				} else if(member.equals("manager")) {
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
					String id = request.getParameter("id");
					String pw ="";
					ManagerDAO dao = ManagerDAO.getInstance();
					List<managerMemberInfo> list = dao.manager_find_pw(tel, id);							
						
					if(list.isEmpty()) {
					%>
						<h4>일치하는 아이디 또는 핸드폰번호가 없습니다 </h4><br><br>
						<input type="button" value="메인화면 가기" class="check" onclick="find_end_main()">
					<%
					}else if(!list.isEmpty()){
						
						request.setCharacterEncoding("UTF-8");
						String mId = request.getParameter("id");
						String mpw = "8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92";
						System.out.println(mId);
						
						Connection conn = null;
						PreparedStatement psmt = null;
						
						String sql = "UPDATE manager_member_tbl SET mPw=? WHERE mid = ?";
						
						try{
							conn = DBConnection.getDBconnect();
							conn.setAutoCommit(false);
							psmt = conn.prepareStatement(sql);
							psmt.setString(1, mpw);
							psmt.setString(2, mId);
							
							psmt.executeUpdate();
							
							conn.commit();
							
						}catch(Exception e){
							e.printStackTrace();
						}finally{
							DBConnection.close(psmt, conn);	
						}
						session.setAttribute("managerPw", mpw);
						%>	
							<span>아이디 : <%=id %></span><br><br>
							<span>비밀번호를 '123456'으로 초기화하였습니다</span><br><br>
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