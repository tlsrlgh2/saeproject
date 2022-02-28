<%@page import="vo.CommentView"%>
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
	//게시물번호 별 게시글을 불러오는 메서드
	String qno = request.getParameter("qno");
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	String sql = "SELECT * FROM qa_tbl WHERE qno = ?";
	
	List<BoardView> list = new ArrayList<>();
	
	try{
		conn = DBConnection.getDBconnect();
		psmt = conn. prepareStatement(sql);
		psmt.setString(1, qno);
		rs = psmt.executeQuery();
		while(rs.next()){
			BoardView bv = new BoardView();
			bv.setQno(rs.getString("qno"));
			bv.setQname(rs.getString("qname"));
			bv.setQcontent(rs.getString("qcontent"));
			bv.setQtitle(rs.getString("qtitle"));
			bv.setQdate(rs.getString("qdate"));
			
			list.add(bv);
		}
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs, psmt, conn);
	}
	
	request.setAttribute("boardDetail", list);
	
	//게시물 별 댓글을 불러오는 메서드
	String sql2 = "SELECT *  FROM comment_tbl WHERE qno = ? ";
	
		List<CommentView> clist = new ArrayList<>();
	
	try{
		conn = DBConnection.getDBconnect();
		psmt = conn.prepareStatement(sql2);
		psmt.setString(1, qno);
		rs = psmt.executeQuery();
		
		while(rs.next()){
			CommentView cm = new CommentView();
			cm.setcNo(rs.getString("cno"));
			cm.setqNo(rs.getString("qno"));
			cm.setcWriter(rs.getString("cname"));
			cm.setcContent(rs.getString("ccontent"));
			cm.setcDate(rs.getString("cdate"));
			clist.add(cm);
		}
	}catch (Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs, psmt, conn);
	}
	
	request.setAttribute("commentView", clist);
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("../board_view/boardDetail.jsp");
	dispatcher.forward(request, response);
	
%>
</body>
</html>