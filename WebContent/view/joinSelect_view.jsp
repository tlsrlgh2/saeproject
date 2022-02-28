<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/selectJoin.css?ver=5">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=4">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

		<section>
			<div id="select_title">
        		<h2>회원가입 유형</h2>
    		</div>
			<div class="join_select">
				<table>
					<tr align="center">
						<td>
							<img class="select_join" src="../img/member_join.png" onclick="location.href='../basicView/basicJoin_View.jsp'">
						</td>
						<td>
							<img class="select_join" src="../img/partner_join.png" onclick="location.href='../accountView/accountJoin_View.jsp'">
						</td>
						<td>
							<img class="select_join" src="../img/manager_join.png" onclick="location.href='../managerView/managerJoin_View.jsp'">
						</td>
					</tr>
				</table>
			</div>
		</section>

<jsp:include page="../include/footer.jsp"/>