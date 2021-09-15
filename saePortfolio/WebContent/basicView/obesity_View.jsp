<%@page import="vo.ObesityInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/obesity.css?ver=4">
<link type="text/css" rel="stylesheet" href="../css/include.css">
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
	
	<section class="">
		<div class="Content">
			<h2>나의 비만도 계산기</h2>
			<table class="Content">
				<tr>
					<th>계산식</th>
					<td colspan="2">신체 질량지수(BMI) = 체중(kg)/[신장(m) * 신장(m)]</td>
				</tr>
				<tr>
					<th rowspan="4">판정기준</th>
					<td>저체중</td>
					<td>20미만</td>
				</tr>
				<tr>
					<td>정상</td>
					<td>20-24</td>
				</tr>
				<tr>
					<td>과체중</td>
					<td>25-29</td>
				</tr>
				<tr>
					<td>비만</td>
					<td>30이상</td>
				</tr>
				<tr>
					<th>표준체중(kg)</td>
					<td colspan="2">(현재신장cm - 100) * 100</td>
				</tr>
			</table>
			<form method="post" action="../check/obesityCheck.jsp">		
			<div class="checkBox">
				
				<p><b>'<%=session.getAttribute("basicId") %>'</b>님의 신체정보</p>
				<div class="body_chk">
					<span>키:</span>
					<input type="text" value="<%=session.getAttribute("basicHeight")%>" disabled>cm
					<input type="hidden" name="bheight" value="<%=session.getAttribute("basicHeight")%>">
				</div>
				<div class="body_chk">
					<span>몸무게:</span>
					<input type="text"  value="<%=session.getAttribute("basicWeight")%>" disabled>kg
					<input type="hidden" name="bweight" value="<%=session.getAttribute("basicWeight")%>" >
				</div>
				<input type="submit" value="결과 조회하기">
			</div>
			</form>
			<hr>
			
			<%
				List<ObesityInfo> list = (List)session.getAttribute("oInfo");
					Double standardWeight,bmi;
				if(list!=null){
					for(ObesityInfo oi : list){
						standardWeight = oi.getStandardWeight();
						bmi = oi.getBmi();
					%>
					
					<div class="checkBox2">
						<p>표준체중:<%=standardWeight %>kg</p>
						<p>BMI지수:<%=bmi %></p>
						<%if(bmi<20){%>
								<h2 style="color: blue;">저체중 입니다.</h2>
								<img src="../img/저체중.png" alt="저체중" class="bmi">
								<fieldset>
									<legend>Health Mania 추천</legend>
									<p>진단: "단백질 섭취량을 늘리고 체지방이 아닌 근육량을 늘릴 필요가 있습니다."</p>
									<br>
									<ul>
										<li>-우선 건강상태를 체크한다.</li>
										<li>-체지방이 아닌 근육을 늘린다.</li>
										<li>-고영양식으로 자주 먹는다.</li>
										<li>-급격하게 체중을 늘리지 않는다.</li>
										<li>-간식을 챙겨먹는다.</li>
										<li>-유산소보다는 근력운동을 위주로 한다.</li>
										<li>-운동전후로 잘 챙겨먹는다.</li>
									</ul>
									<br>								
									<p>추천음식: 고단백 & 고열량으로 고영양식 식단을 구성</p>
									<br>
									<table class="food">
										<tr>
											<td><P>삼계탕</P><img src="../img/삼계탕.jpg" alt="삼계탕" class="food"></td>							
											<td><P>갈비탕</P><img src="../img/갈비탕.jpg" alt="갈비탕" class="food"></td>							
											<td><P>전복</P><img src="../img/전복.jpg" alt="전복" class="food"></td>							
										</tr>
									</table>
									<br>
									
								</fieldset>
							<%}else if(20<=bmi & bmi<=24){%>
								<h2 style="color: green;">정상체중 입니다.</h2>
								<img src="../img/정상.png" alt="정상" class="bmi">
								<fieldset>
									<legend>Health Mania 추천</legend>
									<p>진단: "현재 잘 유지하고 있지만 방심은 금물!"</p>
									<br>
									<ul>
										<li>-정상체중이여도 운동은 꾸준하게 한다.</li>
										<li>-밤에 야식은 최대한 줄이도록 한다.</li>
										<li>-하루 권장 칼로리에 맞춰 식사하도록 노력한다.</li>
										<li>-균형적인 식습관을 가지도록한다.</li>
										<li>-편식은 금지 영양소를 골고루 섭취한다.</li>
										<li>-한가지 부위만 운동하지 않고 여러부위를 계획적으로 운동한다.</li>
									</ul>
									<br>								
									<p>추천음식: 칼로리는 적당하게 영양소는 골고루!</p>
									<br>
									<table class="food">
										<tr>
											<td><P>고등어구이</P><img src="../img/고등어구이.png" alt="고등어" class="food"></td>							
											<td><P>소고기</P><img src="../img/스테이크.jpg" alt="소고기" class="food"></td>							
											<td><P>장어</P><img src="../img/장어.jpg" alt="장어" class="food"></td>							
										</tr>
									</table>
									<br>
									
								</fieldset>
							<%}else if(24<bmi & bmi<=29){%>
								<h2 style="color: orange;">과체중 입니다.</h2>
								<img src="..//img/과체중.png" alt="과체중" class="bmi">
								<fieldset>
									<legend>Health Mania 추천</legend>
									<p>진단: "더 악화되기 전에 식단조절과 운동은 필수!"</p>
									<br>
									<ul>
										<li>-금식으로 인한 다이어트는 금물.</li>
										<li>-계획적으로 식단관리를 한다.</li>
										<li>-저녁 7시이후로 음식을 먹지 않는다.</li>
										<li>-군것질은 금지 포만감 있는 음식을 먹는다.</li>
										<li>-일주일에 5번이상은 운동하는 습관을 가진다.</li>
										<li>-유산소운동은 필수 근력운동도 적정히 한다.</li>
										<li>-스트레칭을 자주 하도록 한다.</li>
									</ul>
									<br>								
									<p>추천음식: "인스턴트 음식은 피하고 저지방 고단백 식사를 한다."</p>
									<br>
									<table class="food">
										<tr>
											<td><P>저지방우유</P><img src="../img/우유.jpg" alt="우유" class="food"></td>							
											<td><P>군고구마</P><img src="../img/군고구마.jpg" alt="군고구마" class="food"></td>							
											<td><P>잡곡밥</P><img src="../img/잡곡밥.jpg" alt="잡곡밥" class="food"></td>							
										</tr>
									</table>
									<br>
									
								</fieldset>
							<%}else if(29<=bmi){%>
								<h2 style="color: red;">비만입니다.</h2>
								<img src="../img/비만.png" alt="비만" class="bmi">
								<fieldset>
									<legend>Health Mania 추천</legend>
									<p>진단: "건강에 매우 위험한 상황입니다. 체중감량은 필수 입니다."</p>
									<br>
									<ul>
										<li>-식사와 운동요법으로 어렵다면 약물치료권장.</li>
										<li>-단기간 다이어트는 금물 다이어트를 장기간으로 계획.</li>
										<li>-체중감량을 계획적으로 설정.</li>
										<li>-꾸준한 유산소 운동과 근력운동 진행.</li>
										<li>-술자리나 회식자리는 피하도록 한다.</li>
										<li>-밀가루는 절대금물 야채나 과일을 섭취하도록한다.</li>
										<li>-초고도비만인 경우 무리한 운동은 관절에 위험 걷기운동 추천.</li>
									</ul>
									<br>								
									<p>추천음식: 고단백 & 고열량으로 고영양식 식단을 구성</p>
									<br>
									<table class="food">
										<tr>
											<td><P>삶은계란</P><img src="../img/삶은달걀.png" alt="삶은달걀" class="food"></td>							
											<td><P>두부</P><img src="../img/두부.jpg" alt="두부" class="food"></td>							
											<td><P>닭가슴살</P><img src="../img/닭가슴살.jpg" alt="닭가슴살" class="food"></td>							
										</tr>
									</table>
									<br>
									
								</fieldset>
							<%}%>
					</div>
				<%}
				}%>
    	</div>
	</section>

<jsp:include page="../include/footer.jsp"/>
</body>
</html>