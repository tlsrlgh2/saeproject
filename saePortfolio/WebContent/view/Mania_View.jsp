<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/Mania_leg.css">
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
			<h2>하체 운동 영상</h2>	
			<table>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/C5J7Pmk6_V8" allowfullscreen></iframe>
						<p>제목 : <span id="title">김종국이 추천하는 하체운동 7가지..!</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCSMTfqBXnfkaY7VXqFqis7g">강산 Vlogs</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/KXYi6bI-UPE" allowfullscreen></iframe>
						<p>제목 : Lv.5 13분만에 하체 마비시키는 루틴!</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCMY_lKUu8yGZaVsu_9lPIGg">권혁 Hulk's TV</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/3waHZPxukFk" allowfullscreen></iframe>
						<p>제목 : 베스트 하체운동 종합모음!</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCc5mVNF4R6ywMqbty91J0rQ">김명섭의 헬스교실</p>
					</td>
				</tr>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/hkP9T6xfIKM" allowfullscreen></iframe>
						<p>제목 : 덤벨로 하체운동 하는법! 홈트족분들은 필수 시청! </p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCoHirUZkTs1nOtyJTNbNJ5g">지피티</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/rpNNzVba3rE" allowfullscreen></iframe>
						<p>제목 : [맨몸 하체 루틴] 집에서 말벅지 가능!!</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UC3ebYgmQgoi6eSHXVk4Euag">승화튜브</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/zsGI5T85wGI" allowfullscreen></iframe>
						<p>제목 : 상체를 위한 하체 운동</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UC9JKcmoTBNMgwz6kxCsZrzA">King유진</p>
					</td>
				</tr>
			</table>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>