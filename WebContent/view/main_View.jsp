<%@page import="dao.BasicDAO"%>
<%@page import="dao.ProjectDAO"%>
<%@page import="vo.BoardView"%>
<%@page import="vo.ProductList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/main.css">
<link type="text/css" rel="stylesheet" href="../css/include.css?ver=4">
<script type="text/javascript" src="../script/logoutScript.js?ver=6"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>

<section>
	<div class="Content">
		
		<div class="mainPicture">
			<!--메인 컨텐츠 너비, 위치-->
			<div class="mains">
				<!--메인 배너-->
				<div class="main_img1">
					<img class="mySlides" src="../img/banner_1.jpg" alt="배너">
					<img class="mySlides" src="../img/banner_2.jpg" alt="배너">
					<img class="mySlides" src="../img/banner_3.jpg" alt="배너">
					<div class="left_btn" onclick="plusDivs(-1)">
						<img src="../img/img_lbtn.png" alt="">
						<img src="../img/img_lbtn_hover.png" alt="" class="hover_btn">
					</div>
					<div class="right_btn" onclick="plusDivs(+1)">
						<img src="../img/img_rbtn.png" alt="">
						<img src="../img/img_rbtn_hover.png" alt="" class="hover_btn">
					</div>
				</div>

				<!--추천 동영상-->
				<div class="movie">
					<img src="../img/health_movie.png" alt="헬스타이틀">
					<div class="movie_box">
							<%
								int random = (int)Math.floor(Math.random()*3)+1;
								
								switch(random) {
								case 1:
								%>
									<iframe width="840" height="400" src="https://www.youtube.com/embed/yyjOhsNEqtE" allowfullscreen></iframe>
								<%
									break;
								case 2:
								%>
									<iframe width="840" height="400" src="https://www.youtube.com/embed/ztGFHUsjFQo" allowfullscreen></iframe>
								<%
									break;
								case 3:
								%>
									<iframe width="840" height="400" src="https://www.youtube.com/embed/Dj3kYRr5zDo" allowfullscreen></iframe>
								<%
									break;
								default :
								%>
									<p>에러발생</p>
								<%
									break;
								}
							%>
							
					</div>
				</div>

				<!--인기 상품-->
				<div class="hot_item">
					<fieldset class="best">
						<ul>
							<%
								ProjectDAO dao = ProjectDAO.getInstance();
								String pname,pirce,pimg,buytotal,pno;
								List<ProductList> list2 = dao.product_list_top1();
								if(list2.isEmpty()) {
									%>
									<div class="empty_error">
										<img alt="product" src="../img/shopping_error.png" class="product">
										<p>판매순 1등 상품이 없습니다.</p>
									</div>
								<%}else if(!list2.isEmpty()) {
									%>
										<legend>
											<h2>BEST 1위</h2>
										</legend>
									<%
									for(ProductList pl : list2) {
										pimg = pl.getpImage();
										pirce = pl.getpPrice();
										pname = pl.getpName();
										buytotal = pl.getpBuyTotal();
										pno = pl.getpNo();
								%>
									<li class="B_img"><img src="../Product_Img/<%=pimg%>" alt="top1" width="100%" height="100%"></li>
									<li class="p_name"><%=pname %></li>
									<li class="p_price">가격: <%=pirce %>원</li>
									<li class="p_sales">판매수: <%=buytotal %>개</li>
									<li class="goBuy">
										<input type="button" value="상품구매" onclick="location.href='../load/productLoad.jsp?pno=<%= pno%>'">
									</li>
									<%}%>
								<%}%>
								
						</ul>
					</fieldset>
					<fieldset class="best">
						<ul>
							<%
								List<ProductList> list3 = dao.product_list_top2();
								if(list3.isEmpty()) {
								%>
								<div class="empty_error">
									<img alt="product" src="../img/shopping_error.png" class="product">
									<p>판매순 2등 상품이 없습니다.</p>
								</div>
							<%}else if(!list2.isEmpty()) {
								%>
									<legend>
										<h2>BEST 2위</h2>
									</legend>
								<%
								for(ProductList pl : list3) {
									pimg = pl.getpImage();
									pirce = pl.getpPrice();
									pname = pl.getpName();
									buytotal = pl.getpBuyTotal();
									pno = pl.getpNo();
							%>
								<li class="B_img"><img src="../Product_Img/<%=pimg%>" alt="top1" width="100%" height="100%"></li>
								<li class="p_name"><%=pname %></li>
								<li class="p_price">가격: <%=pirce %>원</li>
								<li class="p_sales">판매수: <%=buytotal %>개</li>
								<li class="goBuy">
									<input type="button" value="상품구매" onclick="location.href='../load/productLoad.jsp?pno=<%= pno%>'">
								</li>
								<%}%>
							<%}%>
						</ul>
					</fieldset>
					<fieldset class="best">
						<ul>
							<%
								List<ProductList> list4 = dao.product_list_top3();
								if(list4.isEmpty()) {
								%>
								<div class="empty_error">
									<img alt="product" src="../img/shopping_error.png" class="product">
									<p>판매순 3등 상품이 없습니다.</p>
								</div>
							<%}else if(!list2.isEmpty()) {
								%>
									<legend>
										<h2>BEST 3위</h2>
									</legend>
								<%
								for(ProductList pl : list4) {
									pimg = pl.getpImage();
									pirce = pl.getpPrice();
									pname = pl.getpName();
									buytotal = pl.getpBuyTotal();
									pno = pl.getpNo();
							%>
								<li class="B_img"><img src="../Product_Img/<%=pimg%>" alt="top1" width="100%" height="100%"></li>
								<li class="p_name"><%=pname %></li>
								<li class="p_price">가격: <%=pirce %>원</li>
								<li class="p_sales">판매수: <%=buytotal %>개</li>
								<li class="goBuy">
									<input type="button" value="상품구매" onclick="location.href='../load/productLoad.jsp?pno=<%= pno%>'">
								</li>
								<%}%>
							<%}%>
						</ul>
					</fieldset>
				</div>
				<ul class="hot_item2">
					<li>
						<fieldset id="main_freeboard">
							<legend id="main_freeboard">최근 게시물</legend>
							<table>
							<tr>
								<th id="main_freeboard">제목</th>
								<th id="main_freeboard">작성자</th>
								<th id="main_freeboard">날짜</th>
							</tr>
								<%
									List<BoardView> list = dao.new_view_list();
									String title,name,date,qno;
									if(list.isEmpty()) {
										%>
										<tr id="empty">
											<td colspan="3">
												<div class="empty">
												<img alt="게시판" src="../img/게시판.png" class="empty">
												<p class="empty">게시글이 없습니다.</p>
											</div>
											</td>
										</tr>
										<tr>
											<td colspan="3" align="right"><a id="main_freeboard" onclick="location.href='freeBoard_View.jsp'">자유 게시판 가기 </a></td>
										</tr>
									
									<%} else if(!list.isEmpty()) {
										for(BoardView bv : list) {
											title = bv.getQtitle();
											name = bv.getQname();
											date = bv.getQdate().substring(0,10);
											qno = bv.getQno();
									%>
										<tr id="bottom">
											<td id="main_freeboard"><a href="../load/boardLoad.jsp?qno=<%=qno %>"><%=title %></a></td>
											<td id="main_freeboard"><%=name %></td>
											<td id="main_freeboard"><%=date %></td>
										</tr>
										<%}%>
									<tr>
										<td colspan="3" align="right"><a id="main_freeboard" onclick="location.href='freeBoard_View.jsp'">자유 게시판 가기 </a></td>
									</tr>
									<%}%>
						</table>
						</fieldset>
					</li>
					<li id="tem2">
						<img alt="커밍순" src="../img/main_collabo.jpg">
					</li>
				</ul>
			</div>
		</div>
		
		<div class="sideBar">
		<% 
			//일반 메인 화면 창
			if(session.getAttribute("basicId")==null &session.getAttribute("accountId")==null&session.getAttribute("managerId")==null){%>
				<div class="loginBox">
				<ul class="login">
					<li><p class="loginTitle">Health Mania를 통하여 훌륭한 Body를 완성해보세요.</p></li>
					<li>
						<div class="lgbox" onclick="location.href='login_view.jsp'">
							<img src="../img/loginbtn.png" alt="로그인">
						</div>
					</li>
					<li>
						<p class="joinBox">
							<img src="../img/join_icon.png" alt="joinicon" class="joinBox"> 
							<a class="joinBox" href="joinSelect_view.jsp">회원가입 </a>
							<span> | </span>
							<img src="../img/find_icon.png" alt="findicon" class="joinBox"> 
							<a class="joinBox" onclick="find_id_pw()" id="find_id_pw">ID/PW찾기</a>
						</p>
					</li>
				</ul>
			</div>
		<%
		//일반회원 로그인 정보창 
			}else if(session.getAttribute("basicId")!=null){%>
			
			<%	
				BasicDAO bDao = BasicDAO.getInstance();
				String bId = String.valueOf(session.getAttribute("basicId"));
				String bPoint = bDao.getPoint(bId).replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",");
				
			%>			
			<div class="loginBox">
			<ul class="login">
				<li>
					<p class="loginTitle"><%=session.getAttribute("basicId") %>님 안녕하세요.</p>
					<a href="../basicView/basicMypageCheck_View.jsp" class="my_page">My page</a>
				</li>
				<li>
					<div class="idbox">
						<p>일반회원</p>
						<div class="myPoint">
							<ul>
								<li>MyPoint :</li>
								<li class="point">
									<%=bPoint %>P
								</li>
								<li class="coin_fillin">
									<div class="fillin">
										<img alt="충전" src="../img/point_up.png" onclick="location.href = '../basicView/myPoint_ChargeView.jsp'">
									</div>
								</li>
							</ul>
						</div>
						<img src="../img/member_icon.png" alt="일반회원" class="basic">
						<div class="cm_kg">
							<p>키: <%=session.getAttribute("basicHeight") %>cm</p>
							<p>몸무게: <%=session.getAttribute("basicWeight") %>kg</p>
						</div>
						<p class="joinBox">
							<input type="button" value="나의 비만도 계산하기" onclick="location.href='../basicView/obesity_View.jsp'">
							<input type="button" value="로그아웃" onclick="logout()">
						</p>
					</div>
				</li>
			</ul>
		</div>
			<%
			//거래처 회원 로그인 정보
			}else if(session.getAttribute("accountId")!=null){%>
				<div class="loginBox">
			<ul class="login">
				<li>
					<p class="loginTitle"><%=session.getAttribute("accountId") %>님 안녕하세요.</p>
					<a href="../basicView/basicMypageCheck_View.jsp" class="my_page">My page</a>
				</li>
				<li>
					<div class="idbox">
						<p>㈜ <%=session.getAttribute("aname") %></p>
						<img src="../img/briefcase_icon.png" alt="거래처" class="basic">
						<div class="cm_kg">
							<p>물품을 등록해 보세요!</p>
						</div>
						<p class="joinBox">
							<input type="button" value="나의 상품 등록하기" onclick="location.href='../accountView/product_Resist_View.jsp'">
							<input type="button" value="로그아웃" onclick="logout()">
						</p>
					</div>
				</li>
			</ul>
		</div>
		<%
		//관리자 로그인 정보
			}else if(session.getAttribute("managerId")!=null){%>
				<div class="loginBox">
			<ul class="login">
				<li>
					<p class="loginTitle"><%=session.getAttribute("managerId") %>님 안녕하세요.</p>
					<a href="../basicView/basicMypageCheck_View.jsp" class="my_page">My page</a>
				</li>
				<li>
					<div class="idbox">
						<p>&nbsp;&nbsp;관리자</p>
						<img src="../img/manager_icon.png" alt="거래처" class="basic">
						<div class="cm_kg">
							<p> </p>
						</div>
						<p class="joinBox">
							<input type="button" value="회원 관리" onclick="location.href='../managerView/management_choice.jsp'">
							<input type="button" value="로그아웃" onclick="logout()">
						</p>
					</div>
				</li>
			</ul>
		</div>
					
			<%}%>
		</div>
	</div>
</section>

<jsp:include page="../include/footer.jsp"/>


<script type="text/javascript">
//메인이미지 자동 슬라이드쇼 스크립트
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
    showDivs(slideIndex += n);
}

function showDivs(n) {
    var i;
    var x = document.getElementsByClassName("mySlides");
    if (n > x.length) {slideIndex = 1}
    if (n < 1) {slideIndex = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex-1].style.display = "block";
}


var slideIndex1 = 0;
carousel();
function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    slideIndex1++;
    if (slideIndex1 > x.length) {slideIndex1 = 1}
    x[slideIndex1-1].style.display = "block";
    setTimeout(carousel, 3000); // Change image every 2 seconds
}


var slideIndex1 = 1;
showDivs1(slideIndex1);

function plusDivs1(n) {
    showDivs1(slideIndex1 += n);
}

function showDivs1(n) {
    var i;
    var x = document.getElementsByClassName("best");
    if (n > x.length) {slideIndex1 = 1}
    if (n < 1) {slideIndex1 = x.length} ;
    for (i = 0; i < x.length; i++) {
        x[i].style.display = "none";
    }
    x[slideIndex1-1].style.display = "block";
}


var slideIndex2 = 0;
carousel2();
function carousel2() {
    var i;
    var x = document.getElementsByClassName("best");
    for (i = 0; i < x.length; i++) {
      x[i].style.display = "none";
    }
    slideIndex2++;
    if (slideIndex2 > x.length) {slideIndex2 = 1}
    x[slideIndex2-1].style.display = "block";
    setTimeout(carousel2, 3000); // Change image every 2 seconds
}
</script>
</body>
</html>