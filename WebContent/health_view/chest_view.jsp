<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/Mania_chest.css?ver=1">
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
				<li><h2>다이아몬드 푸쉬업</h2></li>
				<li><img alt="다이아몬드" src="../img/다이아몬드 푸쉬업.PNG"></li>
				<li>
					<p>1. 양손바닥을 다이아몬드 형태로 만들고 다리를 어깨너비 만큼 벌리고 엎드린다.</p>
					<p>2. 그대로 상체를 내려 가슴근육을 자극한다. 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>인클라인 푸쉬업</h2></li>
				<li><img alt="인클라인" src="../img/인클라인 푸쉬업.PNG"></li>
				<li>
					<p>1. 양손으로 의자를 잡는다.</p>
					<p>2. 그대로 가슴을 자극하며 푸쉬업을 한다. 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>니드라이브 푸쉬업</h2></li>
				<li><img alt="니드라이브" src="../img/니드라이브 푸쉬업.PNG"></li>
				<li>
					<p>1. 양손을 어깨너비 보다 조금 더 넓게 벌려 엎드린다.</p>
					<p>2. 그대로 상체를 내려 푸쉬업을 진행한다.</p>
					<p>3. 상체를 올려주면서 왼쪽(오른쪽) 무릎을 오른쪽(왼쪽) 팔꿈치까지 들어 올린다.</p>
					<p>4. 반대편도 동일하게 진행하며 동작을 반복한다.</p>
				</li>
			</ul>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>