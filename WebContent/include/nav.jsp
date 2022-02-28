<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link type="text/css" rel="stylesheet" href="../css/nav_new.css?ver=6">

 <nav id="menu" class="nav" role="navigation">
  <ol class="nav" id="main-menu">
    <li><a href="../view/main_View.jsp">Home</a></li>
    <li><a href="../view/projectIntroduce_View.jsp">Project 소개</a></li>
    <li><a href="../view/Health_View.jsp">Health 홈트레이닝</a>
      <ol id="sub-menu">
        <li onclick="location.href='../health_view/lowerbody_view.jsp'">하체</li>
        <li onclick="location.href='../health_view/back_view.jsp'">등</li>
        <li onclick="location.href='../health_view/chest_view.jsp'">가슴</li>
        <li onclick="location.href='../health_view/arm_view.jsp'">팔</li>
        <li onclick="location.href='../health_view/shoulder_view.jsp'">어깨</li>
      </ol>
    </li>
    <li><a href="../view/E-Store_View.jsp?choice=0">E-Store</a></li>
    <li><a href="../view/Mania_View.jsp">Mania 동영상</a>
	   	<ol id="sub-menu">
	        <li onclick="location.href='../view/Mania_View.jsp'">하체</li>
	        <li onclick="location.href='../Mania_View/Mania_back_view.jsp'">등</li>
	        <li onclick="location.href='../Mania_View/Mania_chest_view.jsp'">가슴</li>
	        <li onclick="location.href='../Mania_View/Mania_arm_view.jsp'">팔</li>
	        <li onclick="location.href='../Mania_View/Mania_shoulder_view.jsp'">어깨</li>
	    </ol>
    </li>
    <li><a href="../view/Youtube_View.jsp">Youtube 채널 추천</a></li>
    <li><a href="../view/freeBoard_View.jsp">자유게시판</a></li>
  </ol> 
</nav>