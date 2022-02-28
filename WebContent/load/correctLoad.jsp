<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BoardView"%>
<%@page import="db.DBConnection"%>
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
	
	request.setCharacterEncoding("UTF-8");
	
	String qno = request.getParameter("qno");
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	
	System.out.println(qno);
	
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
	
	request.setAttribute("boardCorrect", list);
	RequestDispatcher dispatcher = request.getRequestDispatcher("../board_view/boardCorrect_View.jsp");
	dispatcher.forward(request, response);
	%>
</body>
</html>