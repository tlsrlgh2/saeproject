<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/Mania_leg.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/health.css?ver=4">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

	<div class="Content" align="center">
		<ol class="health_list">
			<li id="list"><a href="../view/Health_View.jsp"> 하체 </a></li>
			<li id="list"><a href="../health_view/back_view.jsp"> 등 </a></li>
			<li id="list"><a href="../health_view/chest_view.jsp"> 가슴 </a></li>
			<li id="list"><a href="../health_view/arm_view.jsp"> 팔 </a></li>
			<li id="list"><a href="../health_view/shoulder_view.jsp"> 어깨 </a></li>
		</ol>
	</div>
	
	<div class="view">
		<div class="trainer">
			<ul>
				<li><h2>스쿼트</h2></li>
				<li><img alt="스쿼트" src="../img/스쿼트.PNG"></li>
				<li>
					<p>1. 양발을 어깨너비만큼 벌리고 선다. 양손은 앞으로 뻗는다.</p>
					<p>2. 허리를 곧게 펴고, <b>무릎이 발가락 끝을 넘지 않게 유의</b>하며 90도가 될때까지
					앉는다.</p>
					<p>3. 그대로 다시 일어서며 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>런지</h2></li>
				<li><img alt="런지" src="../img/lunge.PNG"></li>
				<li>
					<p>1. 양발을 어깨너비만큼 벌리고 선다.</p>
					<p>2. 오른발(왼발)을 앞으로 내밀고, 왼발(오른발)의 뒤꿈치는 세운다.</p>
					<p>3. 등과 허리를 똑바로 펴고 시선은 앞을 향한다. 앞으로 뺀 오른발(왼발)은 90도가
					되도록 앉고, <b>뒤에 위치한 왼발(오른발)은 무릎이 땅에 닿지 않게 주의</b>한다.</p>
					<p>4. 그대로 다시 일어서며 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>러닝킥</h2></li>
				<li><img alt="러닝킥" src="../img/러닝킥.PNG"></li>
				<li>
					<p>1. 양발을 어깨너비 만큼 벌리고 선다.</p>
					<p>2. 오른발(외발)을 뒤로 빼며, 왼발(오른발)의 무릎은 살짝 굽힌다. 뒤로 뺀 발과
					동일한 위치의 오른손(왼손)을 올린다.</p>
					<p>3. 오른발(왼발)을 허리까지 차올림과 동시에 반대편 왼손(오른손)을 올린다. 이때,
					<b>같은 다리와 같은 팔을 올리지 않는 것에 주의</b>한다.</p>
					<p>4. 차올린 오른발과 왼손을 내리며 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="feeling_div">
			<div class="button-container like-container">
			    <button class="feeling_a">
			      <i class="fa fa-heart-o"> Like</i>    
			    </a>
			  </div>
			  <div class="button-container dislike-container">
			    <button class="feeling_a">
			      <i class="fa fa-heart"> Dislike</i>
			    </a>
			</div>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>