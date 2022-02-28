<%@page import="dao.ManagerDAO"%>
<%@page import="vo.AccountMemberInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BasicMemberInfo"%>
<%@page import="vo.managerMemberInfo"%>
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
<link type="text/css" rel="stylesheet" href="../css/myPage.css">
<link type="text/css" rel="stylesheet" href="../css/myPageChange.css">
<link type="text/css" rel="stylesheet" href="../css/include.css">
<script type="text/javascript" src="../script/myPageScript.js?ver=9"></script>
</head>
<body>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/nav.jsp"/>
<section>
	<div class="Main">
	<jsp:include page="../include/Manager_MyPageSideBar.jsp"/>
		
		<div class="Content">
			<h2>회원정보 수정</h2>
			<%
				String id = String.valueOf(session.getAttribute("managerId"));
					ManagerDAO dao = ManagerDAO.getInstance();
					List<managerMemberInfo> list = (List)dao.managerMemberInfo(id);
					String mId,mPw,mName,mTel1,mTel2,mTel3,mEmail1,mEmail2,month;
					for(managerMemberInfo mm : list){
						
					mId = mm.getmId();
					mPw = mm.getmPw();
					mName = mm.getmName();
					mTel1 = mm.getmTel1();
					mTel2 = mm.getmTel2();
					mTel3 = mm.getmTel3();
					mEmail1 = mm.getmEmail1();
					mEmail2 = mm.getmEmail2();
					month = "1";
			%>
				<form action="../correct/mmCorrect.jsp" onsubmit="return mvalidate()" method="post" name="frm">
				<table>
					<tr>
						<th>이름</th>
						<td><input type="text" name="mName" value="<%=mName %>" disabled></td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
						<input type="hidden" name="id" value="<%=mId %>">
						<input type="text" name="mId" value="<%=mId %>" disabled>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" id="mPw" name="mPw" placeholder="비밀번호" onchange="misSame()"></td>
					</tr>
					<tr>
						<th>비밀번호 확인</th>
						<td>
						<input type="password"  id="mPwChk" name="mPwChk" placeholder="비밀번호 확인" onchange="misSame()">
						&nbsp;&nbsp;<span id="same"></span>
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input type="text" value="<%=mEmail1 %>" id="mEmail1" name="mEmail1" class="mail">@
							<input type="text" value="<%=mEmail2 %>" id="mEmail2" name="mEmail2" class="mail">
							<select name="mEmail3" onChange="mCheckMail(frm.mEmail3.options[this.selectedIndex].value)">
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
                				<option value="010" <%=mTel1.equals("010")?" selected":""%>>010</option>
                				<option value="070" <%=mTel1.equals("070")?" selected":""%>>070</option>
                				<option value="02" <%=mTel1.equals("02")?" selected":""%>>02</option>
                				<option value="031" <%=mTel1.equals("031")?" selected":""%>>031</option>
                				<option value="032" <%=mTel1.equals("032")?" selected":""%>>032</option>
                				<option value="033" <%=mTel1.equals("033")?" selected":""%>>033</option>
                				<option value="041" <%=mTel1.equals("041")?" selected":""%>>041</option>
                				<option value="042" <%=mTel1.equals("042")?" selected":""%>>042</option>
               					<option value="043" <%=mTel1.equals("043")?" selected":""%>>043</option>
                				<option value="044" <%=mTel1.equals("044")?" selected":""%>>044</option>
                				<option value="045" <%=mTel1.equals("045")?" selected":""%>>045</option>
                				<option value="051" <%=mTel1.equals("051")?" selected":""%>>051</option>
                				<option value="052" <%=mTel1.equals("052")?" selected":""%>>052</option>
               	 				<option value="053" <%=mTel1.equals("053")?" selected":""%>>053</option>
                				<option value="054" <%=mTel1.equals("054")?" selected":""%>>054</option>
                				<option value="055" <%=mTel1.equals("055")?" selected":""%>>055</option>
                				<option value="061" <%=mTel1.equals("061")?" selected":""%>>061</option>
                				<option value="062" <%=mTel1.equals("062")?" selected":""%>>062</option>
                				<option value="063" <%=mTel1.equals("063")?" selected":""%>>063</option>
                				<option value="064" <%=mTel1.equals("064")?" selected":""%>>064</option>
                			</select>
                -
                <input type="text" name="phoneNum2" id="phoneNum2" value="<%=mTel2 %>" class="size3">
                -
                <input type="text" name="phoneNum3" id="phoneNum3" value="<%=mTel3 %>" class="size3">
                </td>
					</tr>
					<tr>
						<td colspan="2" class="btn">
						<input type="submit" value="수정">
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