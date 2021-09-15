<%@page import="dao.BasicDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BasicMemberInfo"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProjectDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/body.css">
<link type="text/css" rel="stylesheet" href="../css/myPage.css?ver=3">
<link type="text/css" rel="stylesheet" href="../css/myPageChange.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPageScript.js?ver=3"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">
	<jsp:include page="../include/basicMyPageSideBar.jsp"/>
		
		<div class="Content">
			<h2>회원정보 수정</h2>
			<%
			String id = String.valueOf(session.getAttribute("basicId"));
			BasicDAO dao = BasicDAO.getInstance();
			List<BasicMemberInfo> list = (List)dao.basicMemberInfo(id);
			String bId,bPw,bName,bTel1,bTel2,bTel3,bEmail1,bEmail2,bGender,bWeight,bHeight,year,month,date,bpostcode,baddress,bdetailaddress;
			for(BasicMemberInfo bm : list){
			bId = bm.getbId();
			bPw = bm.getbPw();
			bName = bm.getbName();
			bTel1 = bm.getbTel1();
			bTel2 = bm.getbTel2();
			bTel3 = bm.getbTel3();
			bpostcode = bm.getBpostcode();
			baddress = bm.getBaddress();
			bdetailaddress = bm.getBdetailaddress();
			bGender = bm.getbGender();
			bWeight = bm.getbWeight();
			bHeight = bm.getbHeight();
			year = bm.getYear();
			month = bm.getMonth();
			date = bm.getDate();
			bEmail1 = bm.getbEmail1();
			bEmail2 = bm.getbEmail2();
			%>
				<form action="../correct/bmCorrect.jsp" method="post" name="frm" onsubmit="return bvalidate()">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="bName" value="<%=bName %>" disabled></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
						<input type="hidden" name="id" value="<%=bId %>">
						<input type="text" name="bId" value="<%=bId %>" disabled>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="bPw" name="bPw" placeholder="비밀번호" onchange="isSame()"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
						<input type="password" name="bPwChk" id="bPwChk" placeholder="비밀번호 확인" onchange="isSame()">
						&nbsp;&nbsp;<span id="same"></span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" value="<%=bEmail1 %>" id="bEmail1" name="bEmail1" class="mail">@
							<input type="text" value="<%=bEmail2 %>" id="bEmail2"  name="bEmail2" class="mail">
							<select name="bEmail3" onChange="checkMail(frm.bEmail3.options[this.selectedIndex].value)">
								<option value="no" selected>이메일선택</option>
                				<option value="naver.com">네이버</option>
                				<option value="gmail.com">구글</option>
                				<option value="hanmail.net">한메일</option>
                				<option value="nate.com">네이트</option>
                				<option value="input">직접입력</option>
							</select>
						</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td>
               				 <select name="phoneNum1" id="phoneNum1" <%=month.equals("1")?" selected":""%> class="size3">
                				<option value="010" <%=bTel1.equals("010")?" selected":""%>>010</option>
                				<option value="070" <%=bTel1.equals("070")?" selected":""%>>070</option>
                				<option value="02" <%=bTel1.equals("02")?" selected":""%>>02</option>
                				<option value="031" <%=bTel1.equals("031")?" selected":""%>>031</option>
                				<option value="032" <%=bTel1.equals("032")?" selected":""%>>032</option>
                				<option value="033" <%=bTel1.equals("033")?" selected":""%>>033</option>
                				<option value="041" <%=bTel1.equals("041")?" selected":""%>>041</option>
                				<option value="042" <%=bTel1.equals("042")?" selected":""%>>042</option>
               					<option value="043" <%=bTel1.equals("043")?" selected":""%>>043</option>
                				<option value="044" <%=bTel1.equals("044")?" selected":""%>>044</option>
                				<option value="045" <%=bTel1.equals("045")?" selected":""%>>045</option>
                				<option value="051" <%=bTel1.equals("051")?" selected":""%>>051</option>
                				<option value="052" <%=bTel1.equals("052")?" selected":""%>>052</option>
               	 				<option value="053" <%=bTel1.equals("053")?" selected":""%>>053</option>
                				<option value="054" <%=bTel1.equals("054")?" selected":""%>>054</option>
                				<option value="055" <%=bTel1.equals("055")?" selected":""%>>055</option>
                				<option value="061" <%=bTel1.equals("061")?" selected":""%>>061</option>
                				<option value="062" <%=bTel1.equals("062")?" selected":""%>>062</option>
                				<option value="063" <%=bTel1.equals("063")?" selected":""%>>063</option>
                				<option value="064" <%=bTel1.equals("064")?" selected":""%>>064</option>
                			</select>
                -
                <input type="text" name="phoneNum2" id="phoneNum2" value="<%=bTel2 %>" class="size3">
                -
                <input type="text" name="phoneNum3" id="phoneNum3" value="<%=bTel3 %>" class="size3">
                </td>
					</tr>
				<tr>
                	<th>주소</th>
               		 <td>
                    	<input type="text" name="postcode" id="postcode" value="<%=bpostcode %>" placeholder="우편번호" class="postcode">
						<input type="button" onclick="DaumPostcode()" value="우편번호 찾기" class="daumPostcode"><br>
						<input type="text" name="address"id="address" placeholder="주소" value="<%=baddress %>" class="address"><br>
						<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소" value="<%=bdetailaddress %>" class="detailAddress">
						<input type="text" id="extraAddress" placeholder="참고항목" class="extraAddress" readonly>
               		 </td>
            	</tr>
					<tr>
						<th>성별</th>
						<td>
						남<input type="radio" name="bgender" <%=bGender.equals("m")?" checked":""%> disabled>
						여<input type="radio" name="bgender" <%=bGender.equals("f")?" checked":""%> disabled>
						
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>
							<input type="text" name="year" id="year" value="<%=year %>" class="birth" min="1930" max="2200">년
							<select name="month">
								<option value="1" <%=month.equals("1")?" selected":""%>>1</option>
                				<option value="2" <%=month.equals("2")?" selected":""%>>2</option>
                				<option value="3" <%=month.equals("3")?" selected":""%>>3</option>
                				<option value="4" <%=month.equals("4")?" selected":""%>>4</option>
                				<option value="5" <%=month.equals("5")?" selected":""%>>5</option>
                				<option value="6" <%=month.equals("6")?" selected":""%>>6</option>
                				<option value="7" <%=month.equals("7")?" selected":""%>>7</option>
                				<option value="8" <%=month.equals("8")?" selected":""%>>8</option>
                				<option value="9" <%=month.equals("9")?" selected":""%>>9</option>
                				<option value="10" <%=month.equals("10")?" selected":""%>>10</option>
                				<option value="11" <%=month.equals("11")?" selected":""%>>11</option>
                				<option value="12" <%=month.equals("12")?" selected":""%>>12</option>
							</select>월
							<input type="text" name="date" id="date" value="<%=date%>" class="birth">일
						</td>
					</tr>
					<tr>
						<th>키</th>
						<td><input type="text" name="bHeight" id="bHeight" value="<%=bHeight %>" class="size3">cm</td>
					</tr>
					<tr>
						<th>체중</th>
						<td><input type="text" name="bWeight" id="bWeight" value="<%=bWeight %>" class="size3">kg</td>
					</tr>
					<tr>
						<td colspan="2" class="btn">
						<input type="submit" value="수정" onclick="bmNullChk()">
						<input type="button" value="메인으로 돌아가기" onclick="location.href = '../view/main_View.jsp'">
						</td>
						
					</tr>
				</table>
			</form>	
			<%}%>
			
				
		</div>
	</div>
</section>
<jsp:include page="../include/footer.jsp"/>
</body>
</html>