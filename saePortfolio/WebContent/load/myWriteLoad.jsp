<%@page import="vo.BoardView"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
		if(session.getAttribute("basicId")!=null) {
			
			String id = String.valueOf(session.getAttribute("basicId"));
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM qa_tbl WHERE qname = ? ";
			
			List<BoardView> list = new ArrayList<>();
			
			try{
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				while(rs.next()){
					BoardView bv = new BoardView();
					bv.setQno(rs.getString("qno"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQdate(rs.getString("qdate"));
					
					list.add(bv);
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close(rs, psmt, conn);
			}
			request.setAttribute("myBoardList", list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../basicView/myWrite_View.jsp");
			dispatcher.forward(request, response);
			
		} else if (session.getAttribute("accountId")!=null) {
			
			String id = String.valueOf(session.getAttribute("accountId"));
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM qa_tbl WHERE qname = ? ";
			
			List<BoardView> list = new ArrayList<>();
			
			try{
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				while(rs.next()){
					BoardView bv = new BoardView();
					bv.setQno(rs.getString("qno"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQdate(rs.getString("qdate"));
					
					list.add(bv);
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close(rs, psmt, conn);
			}
			request.setAttribute("myBoardList", list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../accountView/account_MyWrite_View.jsp");
			dispatcher.forward(request, response);
		} else if (session.getAttribute("managerId")!=null) {
			
			String id = String.valueOf(session.getAttribute("managerId"));
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM qa_tbl WHERE qname = ? ";
			
			List<BoardView> list = new ArrayList<>();
			
			try{
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				while(rs.next()){
					BoardView bv = new BoardView();
					bv.setQno(rs.getString("qno"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQdate(rs.getString("qdate"));
					
					list.add(bv);
				}
			}catch (Exception e){
				e.printStackTrace();
			}finally{
				DBConnection.close(rs, psmt, conn);
			}
			request.setAttribute("myBoardList", list);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("../managerView/manager_MyWrite_View.jsp");
			dispatcher.forward(request, response);
		} else {
			System.out.println("myWriteLoad에  - error발생");
		}
		
		
	%>
</body>
</html>