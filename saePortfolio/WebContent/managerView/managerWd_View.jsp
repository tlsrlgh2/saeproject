<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPage.css">
<link type="text/css" rel="stylesheet" href="../css/myPageWd.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPageScript.js?ver=2"></script>
</head>
<body>
	<jsp:include page="../include/header.jsp"/>
	<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">
	<jsp:include page="../include/Manager_MyPageSideBar.jsp"/>
		
		<div class="Content">
			<form action="../delete/mmWidhdraw.jsp" method="POST" name="frm">
			<h2>탈퇴안내</h2>
			<p class="title">회원을 탈퇴하기전에 아래의 사항을 꼭 확인해주세요.</p>
			<br>
			<ul class="withdraw">
				<li>사용하고 계신 아이디(<span class="point"><%=session.getAttribute("managerId") %></span>)는 탈퇴할경우 재사용과 복구가 불가능합니다.</li>
				<li class="point">탈퇴한 아이디명은 다른사람이 재 사용 할 수있습니다. 이점 유의하여 신중하게 선택하시기 바랍니다. </li>
			</ul>
			
			<div class="accept">
				<h3>페이지 관리자 탈퇴 안내 </h3>
				<br>
				<ul>
					<li>페이지 관리자 탈퇴의 경우 당사와의 계약이 만료된 이후 탈퇴를 진행해 주시기 바랍니다.</li>
					<li>그렇지 않고 탈퇴 진행시 불이익이 생기며 <span class="point2">추후 페이지 관리의 권환에서 배제됩니다.</span></li>			
				</ul>
				<br>
				<h3>내정보 및 서비스 이용기록 삭제 안내 </h3>
				<br>
				<ul>
					<li>내정보 및 개인형 서비스 이용기록이 모두 삭제되며<span class="point2">삭제된 데이터는 복구 되지 않습니다.</span></li>
					<li>삭제되는 서비스를 확인하시고 필요한데이터는 미리 백업 해주세요.</li>			
				</ul>
				<br>
					<h3>게시판형 서비스에 등록한 게시글 삭제 불가 안내 </h3>
				<br>
				<ul>
					<li>삭제를 원하는 게시물이 있다면 반드시 회원탈퇴 전 삭제를 부탁드립니다.</li>
					<li>탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, <span class="point2">게시글을 임의로 삭제시킬 수 없습니다.</span></li>			
					<li class="accept">위의 안내사항을 모두 확인하였으며,이에 동의합니다.<input type="checkbox" value="Y" name="accept" id="accept"></li>
				</ul>		
			</div>
			<div class="btn">
				<input type="submit" value="회원탈퇴" onclick="return bmWithdraw()">
				</div>
				</form>	
		</div>
	</div>
</section>	
	<jsp:include page="../include/footer.jsp"/>
	
</body>
</html>