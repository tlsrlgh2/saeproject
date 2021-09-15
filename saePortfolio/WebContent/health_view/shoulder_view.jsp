<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/Mania_shoulder.css?ver=1">
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
				<li><h2>프런트레이즈</h2></li>
				<li><img alt="프런트" src="../img/프런트레이즈.png"></li>
				<li>
					<p>1. 다리를 어깨너비 정도로 벌리고 양발로 밴드를 밟는다.</p>
					<p>2. 그대로 양손을 어깨 높이까지 올리며 동작을 반복한다. 이때, 양손의 손등은
					하늘로 향하게 만들어 올린다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>밴드오버 사이드 래터럴레이즈</h2></li>
				<li><img alt="밴드오버 사이드" src="../img/벤트오버사이트래터럴레이즈.png"></li>
				<li>
					<p>1. 다리를 어깨너비 정도로 벌리고 양발로 밴드를 밟는다. 양손으로 밴드를 교차시켜 
					잡고 허리를 구부린다. 이때, 양손의 손등은 정면을 향하게한다.</p>
					<p>2. 그대로 양손을 어깨 높이까지 올리며 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>숄더 프레스</h2></li>
				<li><img alt="숄더 프레스" src="../img/숄더프레스.png"></li>
				<li>
					<p>1. 다리를 어깨너비 정도로 벌리고 양발로 밴드를 밟는다. 양손으로 밴드를 말아 잡는다.</p>
					<p>2. 양팔을 머리높이까지 올려 팔꿈치를 직각으로 만들어 구부린다. 이때, 양손의 손등은
					후면을 향하게 만든다.</p>
					<p>3. 그대로 양손을 최대한 올려 어깨에 자극을 준다. 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>