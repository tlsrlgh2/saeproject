<%@page import="dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 아이디 중복체크</title>
<link type="text/css" rel="stylesheet" href="../css/check.css">
</head>
<body>
		<h2>회원 아이디 중복체크</h2>
	<%
		request.setCharacterEncoding("UTF-8");
		ProjectDAO dao = ProjectDAO.getInstance();
		
		String id = request.getParameter("id");
		System.out.println(id);
		
		int result = dao.allselect(id);
		
		if(result==1){
			out.print("사용가능한 아이디입니다.");
		%>
			<input type="button" value="아이디 사용하기" onclick="result();">
		<%}else if(result==0){
			out.println("중복된 아이디입니다.");
		}else{
			out.println("에러 발생!!");
		}
		%>
		
		<fieldset>
			<form action="allselect_Check.jsp" method="post" name="wfr">
				ID: <input type="text" name="id" value="<%=id %>">
				<input type="submit" value="중복확인">
			</form>
		</fieldset>
		
		<!-- 아이디 중복창 닫기 -->
		<script type="text/javascript">
			function result() {
				opener.document.frm.id.value = document.wfr.id.value;
				
				opener.document.frm.id.readOnly = true;
				
				window.close();
	
				// 아이디 중복확인 처리
				opener.document.frm.return_chk.value = 1;
			}
		</script>
</body>
</html>