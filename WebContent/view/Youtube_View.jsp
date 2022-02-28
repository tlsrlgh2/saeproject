<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="../css/body.css">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/include.css">
<link type="text/css" rel="stylesheet" href="../css/youtube.css">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

	<div class="Content">
		<div class="title">
			<img src="../img/youtube로고.jpg" alt="유튜브로고" class="title">
			<br>
			<h2 class="title">Health Mania Member들을 위한 헬스 유튜브채널 추천</h2>
		</div>
	</div>
	<div class="Content2">
		<table class="youtube">
			<tr>
				<td>
					<h2>유튜브랭킹</h2>
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<p class="lank">🏆1위</p>
					<img src="../img/피지컬 갤러리.jpg" alt="피지컬 갤러리" class="img">
					<p class="you_name">&nbsp;유튜브이름: 피지컬 갤러리</p>
					<p>&nbsp;별점 : ★★★★★</p>				
					<p>&nbsp;구독자 : 307만 명</p>	
					<P>&nbsp;설명 : 유명 유튜버 김계란이 운영하는 유튜브채널</P>
					<br>
					&nbsp;<input type="button" value="채널 바로가기" onclick="location.href='https://www.youtube.com/channel/UCdtRAcd3L_UpV4tMXCw63NQ/featured'">
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<P class="lank">🥈2위</P>
					<img src="../img/말왕티비.jpg" alt="말왕" class="img">
					<P class="you_name">&nbsp;유튜브이름: 말왕TV
						<P>&nbsp;별점 : ★★★★★</P>
						<p>&nbsp;구독자 : 95만 9천 명</p>
						<P>&nbsp;설명 : 피지컬 최고 럭비선수 출신인 유튜버 말왕이 유익하게 알려주는
						<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;대한민국 대표 운동 유튜브 채널
						</P>
						<br>
						&nbsp;<input type="button" value="채널 바로가기" onclick="location.href='https://www.youtube.com/results?search_query=%EB%A7%90%EC%99%95%ED%8B%B0%EB%B9%84'">
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<P class="lank">🥉3위</P>
					<img src="../img/키다리형.jpg" alt="키다리형" class="img">
					<P class="you_name">&nbsp;유튜브이름: 키다리형
						<P>&nbsp;별점 : ★★★★★</P>
						<p>&nbsp;구독자 : 46만 4천 명</p>
						<P>&nbsp;설명 : 동네형처럼  친근한 이미지로 부위별로 운동 방법을 설명해주는 유튜브 채널</P>
						<br>
						&nbsp;<input type="button" value="채널 바로가기" onclick="location.href='https://www.youtube.com/results?search_query=%ED%82%A4%EB%8B%A4%EB%A6%AC%ED%98%95'">
				
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<P class="lank">4위</P>
					<img src="../img/지피티.jpg" alt="지피티" class="img">
					<P class="you_name">&nbsp;유튜브이름: 지피티
						<P>&nbsp;별점 : ★★★★☆</P>
						<p>&nbsp;구독자 : 58만 6천 명</p>
						<P>&nbsp;설명 : 운동별 자세에 대해 자세히 설명해주며<br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;유익한 꿀팁을 얻어갈수 있는 유튜브 채널</P>
						<br>
						&nbsp;<input type="button" value="채널 바로가기" onclick="location.href='https://www.youtube.com/results?search_query=%EC%A7%80%ED%94%BC%ED%8B%B0'">
				
				</td>
			</tr>
			<tr>
				<td>
					<br>
					<P class="lank">5위</P>
					<img src="../img/지기TV.jpg" alt="지기TV" class="img">
					<P class="you_name">&nbsp;유튜브이름: 지기TV
						<P>&nbsp;별점 : ★★★★☆</P>
						<p>&nbsp;구독자 : 61만 3천 명</p>
						<P>&nbsp;설명 : 트레이너가아닌 일반인 직장인이자신의 경험을토대로<br>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;일반인 직장인들에게 운동법 및 공감 정보를 공유하는 유튜브 채널</P>
						<br>
						&nbsp;<input type="button" value="채널 바로가기" onclick="location.href='https://www.youtube.com/results?search_query=%EC%A7%80%EA%B8%B0'">
				</td>
			</tr>
		</table>
	</div>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>