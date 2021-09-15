<%@page import="dao.ProjectDAO"%>
<%@page import="db.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	
		request.setCharacterEncoding("UTF-8");
		String memberType = request.getParameter("memberType");
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		System.out.println(memberType);
		
		String id = request.getParameter("memberId");
		String pw = request.getParameter("memberPw");
		
		ProjectDAO dao = ProjectDAO.getInstance();
		String new_pw = dao.encryption_pw(pw);
		System.out.println("암호화 "+ new_pw+" 입력받은 비밀번호");
		
			if(memberType.equals("basic")){
				String sql = "SELECT * FROM basic_member_tbl where bid = ?";
				String weight,height,point;
				
				
				try{
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()){
						if(new_pw.equals(rs.getString("bpw"))){
							weight = rs.getString("bweight");
							height = rs.getString("bheight");
							session.setAttribute("basicId", id);
							session.setAttribute("basicPw", new_pw);
							session.setAttribute("basicWeight", weight);
							session.setAttribute("basicHeight", height);
							out.println("<script>");
							out.println("alert('로그인에 성공하였습니다.')");
							out.println("location.href='../view/main_View.jsp'");
							out.println("</script>");
						}
					}
					out.println("<script>");
					out.println("alert('로그인에 실패하였습니다.')");
					out.println("alert('아이디와 비밀번호를 확인 해주세요.')");
					out.println("location.href='../view/login_view.jsp'");
					out.println("</script>");
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close(rs, psmt, conn);
					
				}
				
			}else if(memberType.equals("account")){
String sql = "SELECT * FROM account_member_tbl where aid = ?";
				String tel,aname;
				try{
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()){
						if(new_pw.equals(rs.getString("apw"))){
							tel = rs.getString("atel");
							aname = rs.getString("aname");
							session.setAttribute("accountId", id);
							session.setAttribute("accountPw", new_pw);
							session.setAttribute("atel", tel);
							session.setAttribute("aname", aname);
							out.println("<script>");
							out.println("alert('로그인에 성공하였습니다.')");
							out.println("location.href='../view/main_View.jsp'");
							out.println("</script>");
						}
					}
					out.println("<script>");
					out.println("alert('로그인에 실패하였습니다.')");
					out.println("alert('아이디와 비밀번호를 확인 해주세요.')");
					out.println("location.href='../view/login_view.jsp'");
					out.println("</script>");
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close(rs, psmt, conn);
					
				}
			}else if(memberType.equals("manager")){
String sql = "SELECT * FROM manager_member_tbl where mid = ?";
				
				try{
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()){
						if(new_pw.equals(rs.getString("mpw"))){
							session.setAttribute("managerId", id);
							session.setAttribute("managerPw", new_pw);
							out.println("<script>");
							out.println("alert('로그인에 성공하였습니다.')");
							out.println("location.href='../view/main_View.jsp'");
							out.println("</script>");
						}
					}
					out.println("<script>");
					out.println("alert('로그인에 실패하였습니다.')");
					out.println("alert('아이디와 비밀번호를 확인 해주세요.')");
					out.println("location.href='../view/login_view.jsp'");
					out.println("</script>");
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					DBConnection.close(rs, psmt, conn);
					
				}
			}
	%>
</body>
</html>