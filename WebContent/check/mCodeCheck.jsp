<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 가입코드 체크</title>
<link type="text/css" rel="stylesheet" href="../css/check.css">
</head>
<body>
	<h2>가입코드 체크</h2>
	<%
		String code = request.getParameter("code");
		
		if(code.equals("sae1234")){
			out.print("가입코드가 일치합니다.");
			%>
			<input type="button" value="관리자 가입하기" onclick="result();">
		
		<%}else if(!code.equals("sae1234")){
			out.println("가입코드가 일치하지않습니다.");
		}else{
			out.println("에러 발생!!!");
		}
	%>
	<fieldset>
		<form action = "mCodeCheck.jsp" method="post" name="wfr">
		가입코드: <input type="text" name="code" value="<%=code %>" >
			<input type="submit" value="코드확인">
		</form>
	</fieldset>
	
	<script type="text/javascript">
		function result(){
			opener.document.frm.code.value = document.wfr.code.value;
			opener.document.frm.code.readOnly=true;
			
			window.close();
			opener.document.frm.return_chk_code.value = 1;
		}
	</script>
</body>
</html>