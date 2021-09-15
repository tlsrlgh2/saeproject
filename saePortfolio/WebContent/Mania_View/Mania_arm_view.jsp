<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/Mania_arm.css">
<link type="text/css" rel="stylesheet" href="../css/Mania.css?ver=4">
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
			<h2>팔<span id="title">(이두/삼두)</span> 운동 영상</h2>	
			<table>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/-04jgeZ5YQY" allowfullscreen></iframe>
						<p>제목 : 14년차 내추럴 선수가 알려주는 팔 운동 꿀팁 공개</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCoHirUZkTs1nOtyJTNbNJ5g">지피티</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/qkQdIMW1xlw" allowfullscreen></iframe>
						<p>제목 : Lv.2 꽉! 차는 머슬핏 만드는 팔 루틴 덤벨필요</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCMY_lKUu8yGZaVsu_9lPIGg">권혁 Hulk's TV</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/vU5sfsTXI7I" allowfullscreen></iframe>
						<p>제목 : 팔 운동 8가지, 총 45세트 - 강경원 루틴</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCuwyPNJScQ5luAV7b8juFfg">강경원</p>
					</td>
				</tr>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/ofO6_Fc6KjM" allowfullscreen></iframe>
						<p>제목 : 내가 꼭하는 팔운동 6가지 (이두,삼두운동) </p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UChWJavW1PbvAkPTcB06EeIg">키다리형</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/4SdvSja5EVI" allowfullscreen></iframe>
						<p>제목 : 팔 운동, 30분 동안 집에서 부수자 ( 준비물 : 덤벨 )</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCB7A0Php3CJg4uH4HavVy-w">고러쉬</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/8vSnMTlxrYM" allowfullscreen></iframe>
						<p>제목 : 알찬 팔근육 만드는 맨몸운동 BEST4</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCDVQ0yDp7Bu-BxEfelTHL8g">바벨라토르 홈트레이닝 BARBELLATOR</p>
					</td>
				</tr>
			</table>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>