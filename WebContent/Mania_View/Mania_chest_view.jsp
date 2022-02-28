<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css"> 
<link type="text/css" rel="stylesheet" href="../css/Mania_chest.css">
<link type="text/css" rel="stylesheet" href="../css/Mania.css">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

	<div class="mania_list" align="center">
		<ul class="mania_list">
			<li><a href="../view/Mania_View.jsp"> 하체 </a></li>	<!-- lowerbody_view 를 Maina_View로 대체 -->
			<li><a href="../Mania_View/Mania_back_view.jsp"> 등 </a></li>
			<li><a href="../Mania_View/Mania_chest_view.jsp"> 가슴 </a></li>
			<li><a href="../Mania_View/Mania_arm_view.jsp"> 팔 </a></li>
			<li><a href="../Mania_View/Mania_shoulder_view.jsp"> 어깨 </a></li>
		</ul>
	</div>

	<div class="Content">
		<div class="main_con">
			<h2>가슴 운동 영상</h2>	
			<table>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/UqlUZFZgczk" allowfullscreen></iframe>
						<p>제목 : 초보자를 위한 황철순의 가슴운동 루틴</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCbY7nfn_euNV4xMQAUzd60Q">CHUL SOON HWANG</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/mnLzv7brYxA" allowfullscreen></iframe>
						<p>제목 : 김강민의 가슴 운동법, 루틴</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCjGoJbTmFYjd5OnPRUur02A">김강민_Kim Kang min</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/BvajH4yJb-M" allowfullscreen></iframe>
						<p>제목 : <span id="title">가슴운동 중량, 개수, 세트는 얼마큼 해야 할까?</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCQ4eZwsMew7ZaV_HKXnQLGg">지기TV</p>
					</td>
				</tr>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/D2_yaFEViUs" allowfullscreen></iframe>
						<p>제목 : <span id="title">집에서 가슴 진짜 커집니다. 안 커지면 찾아오세요</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCoyogo_Fg-Z5jDOQz6Rt6eA">트리거15초</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/h68IUDAvom0" allowfullscreen></iframe>
						<p>제목 : <span id="title">맨몸운동, 홈트레이닝 가슴운동편 (feat.식단공개)</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UC3ebYgmQgoi6eSHXVk4Euag">고러쉬</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/c_5ENJWekbQ" allowfullscreen></iframe>
						<p>제목 : <span id="title">Lv.4 10분 만에 집에서 가슴 작살내는 루틴 (누구나 쉽게 가능)</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCMY_lKUu8yGZaVsu_9lPIGg">권혁 Hulk's TV</p>
					</td>
				</tr>
			</table>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>