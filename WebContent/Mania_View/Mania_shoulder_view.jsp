<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/Mania_shoulder.css">
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
			<h2>어깨 운동 영상</h2>	
			<table>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/cBZnbTeld2w" allowfullscreen></iframe>
						<p>제목 : 어깨운동루틴 5가지 I 내츄럴 운동법+꿀팁</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UC3hRpIQ4x5niJDwjajQSVPg">핏블리 FITVELY</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/5tjgmucZke8" allowfullscreen></iframe>
						<p>제목 : 이것만 알면 어깨운동은 끝!</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCLG1XzhSPuuJ6hqaHhQaFkA">양선수의 온라인PT</p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/ZUJNiQqlrCU" allowfullscreen></iframe>
						<p>제목 : 황철순 전문지식 대방출 어깨운동 완전판</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCbY7nfn_euNV4xMQAUzd60Q">CHUL SOON HWANG</p>
					</td>
				</tr>
				<tr>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/T7WMIpa0GoE" allowfullscreen></iframe>
						<p>제목 : ★풀버젼★ 덤벨운동 4가지로 어깨 폭파시키기 </p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCB7A0Php3CJg4uH4HavVy-w">고러쉬</p>
					</td>	
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/gHOGyDXHhPc" allowfullscreen></iframe>
						<p>제목 : <span id="title">나만의 홈트 도우미 "밴드"를 이용한 4가지 어깨 운동</span></p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCrFFbADYO1jrXxefP9MivWA">재미어트 </p>
					</td>
					<td>
						<iframe width="300" height="200" src="https://www.youtube.com/embed/BGLkbXAekYo" allowfullscreen></iframe>
						<p>제목 : 어깨 넓어지는 맨몸운동 BEST5</p>
						<p>제작자 : <a href="https://www.youtube.com/channel/UCDVQ0yDp7Bu-BxEfelTHL8g">바벨라토르 홈트레이닝 BARBELLATOR</p>
					</td>
				</tr>
			</table>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>