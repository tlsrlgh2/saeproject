<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/Mania_back.css">
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
			<h2>등 운동 영상</h2>	
			<table>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/E7TQPZCTYIs" allowfullscreen></iframe>
						<p>제목 : <span id="title">등운동에 이걸 빼먹진 않겠죠? 등운동의 기초&팁</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCjGoJbTmFYjd5OnPRUur02A">김강민_Kim Kang min</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/5jZ940J6w6Y" allowfullscreen></iframe>
						<p>제목 : 헬스초보 등운동 루틴! 이대로만 따라하세요!</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UC3hRpIQ4x5niJDwjajQSVPg">핏블리 FITVELY</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/6hgRxPkjAHk" allowfullscreen></iframe>
						<p>제목 : <span id="title">멸치에서 등신까지! 지금의 등을 만들어준 7가지 등운동루틴!</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCoHirUZkTs1nOtyJTNbNJ5g">지피티 </p>
					</td>
				</tr>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/wF6mRNwRfSk" allowfullscreen></iframe>
						<p>제목 : <span id="title">초보자들이 할 수 있는 등운동루틴 feat.1시간안에 끝내자!</span> </p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCB7A0Php3CJg4uH4HavVy-w">고러쉬</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/ygUYcoLy8OU" allowfullscreen></iframe>
						<p>제목 : <span id="title">턱걸이기구❌ 운동도구 '없이' 따라하는 등운동 BEST 4</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCDVQ0yDp7Bu-BxEfelTHL8g">바벨라토르 홈트레이닝 BARBELLATOR</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/SyiMVdWBP7Y" allowfullscreen></iframe>
						<p>제목 : Lv.3.5 장비없이 등과 이두를 동시에 조져 버리는 루틴! </p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCMY_lKUu8yGZaVsu_9lPIGg">권혁 Hulk's TV</p>
					</td>
				</tr>
			</table>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>