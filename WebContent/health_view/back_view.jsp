<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=1">
<link type="text/css" rel="stylesheet" href="../css/Mania_back.css?ver=1">
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
				<li><h2>프레스다운</h2></li>
				<li><img alt="프레스다운" src="../img/pressdown.png"></li>
				<li>
					<p>1. 밴드를 문고리, 가구 등 지탱할 수 있는 곳에 걸고 다리를 어깨 너비 정도로 벌려
					양손으로 밴드를 잡는다.</p>
					<p>2. 엉덩이를 뒤로 살짝 빼 상체를 숙인다. 그대로 양손을 허리까지 이동시켜 등근육을
					자극한다. 이때 팔꿈치가 밖으로 벌어지지 않게 주의 하도록 한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>밴드로우</h2></li>
				<li><img alt="밴드로우" src="../img/bandrow.PNG"></li>
				<li>
					<p>1. 다리를 어깨너비 정도로 벌리고 밴드를 밟는다. 양손으로 밴드를 교차시켜 잡고 허리를
					구부린다.</p>
					<p>2. 그대로 양손을 어깨 높이까지 올리며 반복한다.</p>
				</li>
			</ul>
		</div>
		<div class="trainer">
			<ul>
				<li><h2>비하인드 랫풋다운</h2></li>
				<li><img alt="비하인드" src="../img/behind_latpulldown.PNG"></li>
				<li>
					<p>1. 의자에 착석한다. 양손으로 밴드를 잡고 머리위로 일자로 올린다. 이때, 배를
					살짝 내밀어 허리를 펴준다.</p>
					<p>2. 밴드를 잡고있는 양손을 최대한 내려 등을 조이며 자극한다.</p>
				</li>
			</ul>
		</div>
	</div>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>