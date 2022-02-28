package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;


import db.DBConnection;
import vo.BasicMemberInfo;
import vo.AccountMemberInfo;
import vo.managerMemberInfo;
import vo.my_product_orders;
import vo.BoardView;
import vo.PointInfo;
import vo.ProductList;

public class ProjectDAO {
	
	private ProjectDAO() {};
	
	public static ProjectDAO dao = new ProjectDAO();
	
	public static ProjectDAO getInstance() {
		return dao;
	}
	
	
	// 전체회원 아이디 중복 조회  - 전준표
	public static int allselect(String id) {
		int result = -1;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		System.out.println("allselect메서드 시작");
		try {
			for(int i=0; i<3;i++) {
				conn = null;
				psmt = null;
				rs = null;
				result = -1;
				
				if(i == 0) {
					String sql = "SELECT aid FROM account_member_tbl where aid = ?";
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()) {
						System.out.println("aid 중복 발생");
						result = 0;
						break;
					}else {
						System.out.println("aid 중복 없음");
						result = 1;
					}
				} else if (i == 1) {
					String sql = "SELECT bid FROM basic_member_tbl where bid = ?";
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()) {
						System.out.println("Bid 중복 발생");
						result = 0 ;
						break;
					}else {
						System.out.println("Bid 중복 없음");
						result = 1;
					}
				} else if (i == 2) {
					String sql = "SELECT mid FROM manager_member_tbl where mid = ?";
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					if(rs.next()) {
						System.out.println("Mid 중복 발생");
						result = 0;
						break;
					}else {
						System.out.println("Mid 중복 없음 \n사용가능 아이디");
						result = 1;
					}
				} else {
					System.out.println("allselect메서드 에러발생 / 코드확인 필요");
				}
			}
		}catch (Exception e) {
		    e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return result;
	}
	
		
	//게시물 리스트 및 페이징처리 메서드 - 전준표
	public static List<BoardView> getList(int startRow, int endRow){
		String sql = "select * from (select rownum rn, qno,qcategory,qname,qtitle, qcontent,qdate from \r\n" + 
				"(select * from qa_tbl order by qno desc)) where rn between ? and ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BoardView> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, startRow);
			psmt.setInt(2, endRow);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardView bv = new BoardView();
				
				bv.setQno(rs.getString("qno"));
				bv.setQcategory(rs.getString("qcategory"));
				bv.setQtitle(rs.getString("qtitle"));
				bv.setQname(rs.getString("qname"));
				bv.setQdate(rs.getString("qdate"));
				list.add(bv);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	//총 게시물 개수 출력 메서드  - 전준표
	public int getCount() {
		int count = 0;
		String sql = "select count(*) from qa_tbl";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return count;
	}
	
	//  내가쓴글 카운터 호출 메서드 - 신기호
	public int Mywrite_count(String id) {
		int count = 0;
		String sql = "select count(*) from qa_tbl where qname = ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return count;
	}
	// 내가쓴 게시글 호출 메서드 - 신기호
	public static List<BoardView> GetList_Mywrite(int startRow, int endRow, String id){
		String sql = "select * \r\n" + 
				"from (select rownum rn, qno,qtitle,qdate,qname from (select * from qa_tbl order by qno desc) where qname = ?) \r\n" + 
				"where ( rn between ? and ? )";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BoardView> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, startRow);
			psmt.setInt(3, endRow);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardView bv = new BoardView();
				
				bv.setQno(rs.getString("qno"));
				bv.setQtitle(rs.getString("qtitle"));
				bv.setQname(rs.getString("qname"));
				bv.setQdate(rs.getString("qdate"));
				list.add(bv);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
		
//  E-STORE상품리스트 카운트 메서드 - 전준표
	public int eStore_count() {
		int count = 0;
		String sql = "select count(*) from product_tbl";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
				if(rs.next()) {
					count = rs.getInt(1);
				}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return count;
	}
	// E-Store 상품리스트 불러오는 메서드 - 전준표; --상품 판매순 / 낮은가격순 / 높은가격순
	public static List<ProductList> getList_Estore(int startRow, int endRow, String choice){
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			String sql = null;
			
			if(choice.equals("0")) { // 베이직 pno로 조회
				List<ProductList> list = new ArrayList<>();
				sql = "select * \r\n" + 
						"from (select rownum rn, pno,pimage,pname,pprice,aid,pbuytotal from (select * from product_tbl order by pno desc)) \r\n" + 
						"where ( rn between ? and ? )";
						try {
							conn = DBConnection.getDBconnect();
							psmt = conn.prepareStatement(sql);
							psmt.setInt(1, startRow);
							psmt.setInt(2, endRow);
							psmt.executeUpdate();
							rs = psmt.executeQuery();
							
							while(rs.next()) {
								ProductList pl = new ProductList();
								
								pl.setpNo(rs.getString("pno"));
								pl.setpImage(rs.getString("pimage"));
								pl.setpName(rs.getString("pname"));
								pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
								pl.setpBuyTotal(rs.getString("pbuytotal"));
								pl.setaId(rs.getString("aid"));
								list.add(pl);
							}
							
						}catch(Exception e){
							e.printStackTrace();
						}finally {
							DBConnection.close(rs, psmt, conn);
						}
					return list;
					
			}else if(choice.equals("1")) { // 상품 판매순으로 조회
				List<ProductList> list = new ArrayList<>();
				sql = "select * \r\n" + 
						"from (select rownum rn, pno,pimage,pname,pprice,aid,pbuytotal from (select * from product_tbl order by pbuytotal desc)) \r\n" + 
						"where ( rn between ? and ? )";
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, startRow);
					psmt.setInt(2, endRow);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpNo(rs.getString("pno"));
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						pl.setaId(rs.getString("aid"));
						list.add(pl);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}else if(choice.equals("2")) { //낮은가격순 조회
				List<ProductList> list = new ArrayList<>();
				sql = "select * \r\n" + 
						"from (select rownum rn, pno,pimage,pname,pprice,aid,pbuytotal from (select * from product_tbl order by pprice asc)) \r\n" + 
						"where ( rn between ? and ? )";
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, startRow);
					psmt.setInt(2, endRow);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpNo(rs.getString("pno"));
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						pl.setaId(rs.getString("aid"));
						list.add(pl);
					}
				
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}else if(choice.equals("3")){ //높은가격순 조회
				List<ProductList> list = new ArrayList<>();
				sql = "select * \r\n" + 
						"from (select rownum rn, pno,pimage,pname,pprice,aid,pbuytotal from (select * from product_tbl order by pprice desc)) \r\n" + 
						"where ( rn between ? and ? )";
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setInt(1, startRow);
					psmt.setInt(2, endRow);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpNo(rs.getString("pno"));
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						pl.setaId(rs.getString("aid"));
						list.add(pl);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}
			return null;
	}
	
	// 게시판 검색어 카운트
	public int search_count(String search_select, String search_text) {
		
		int count = 0;
		
		if(search_select.equals("title_search")) {
			String sql = "select count(*) from qa_tbl where qtitle LIKE ?";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				rs = psmt.executeQuery();
				
				if(rs.next()) {
					count = rs.getInt(1);
				}
					
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return count;
			
		}else if(search_select.equals("contents_search")) {
			String sql = "select count(*) from qa_tbl where QCONTENT LIKE ?";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				rs = psmt.executeQuery();
					if(rs.next()) {
						count = rs.getInt(1);
					}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return count;
			
		}else if(search_select.equals("all_search")) {
			String sql = "select count(*) from qa_tbl where qtitle LIKE ? or QCONTENT LIKE ?";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				psmt.setString(2, "%"+search_text+"%");
				rs = psmt.executeQuery();
					if(rs.next()) {
						count = rs.getInt(1);
					}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return count;
			
		}else {
			String sql = "select count(*) from qa_tbl where QNAME LIKE ? ";
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				rs = psmt.executeQuery();
					if(rs.next()) {
						count = rs.getInt(1);
					}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return count;
		}	
	}
	
	// 게시판 검색어 페이징
	public static List<BoardView> search_list(int startRow, int endRow, String search_select, String search_text){
		
		String sql = null;  
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BoardView> list = new ArrayList<>();
	
		if(search_select.equals("title_search")) {
			sql = "select * from (select rownum rn, qno,qcategory,qname,qtitle,qcontent,qdate from (select * from qa_tbl  where qtitle LIKE ?)) where rn between ? and ?";
			try {
				
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				psmt.setInt(2, startRow);
				psmt.setInt(3, endRow);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					BoardView bv = new BoardView();
					
					bv.setQno(rs.getString("qno"));
					bv.setQcategory(rs.getString("qcategory"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQname(rs.getString("qname"));
					bv.setQdate(rs.getString("qdate"));
					list.add(bv);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return list;
		}else if(search_select.equals("contents_search")) {
			sql = "select * from (select rownum rn, qno,qcategory,qname,qtitle,qcontent,qdate from (select * from qa_tbl  where QCONTENT LIKE ?)) where rn between ? and ?";
			try {
				System.out.println(search_select+"dao");
				
				
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				psmt.setInt(2, startRow);
				psmt.setInt(3, endRow);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					BoardView bv = new BoardView();
					
					bv.setQno(rs.getString("qno"));
					bv.setQcategory(rs.getString("qcategory"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQname(rs.getString("qname"));
					bv.setQdate(rs.getString("qdate"));
					list.add(bv);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return list;
		}else if(search_select.equals("all_search")) {
			sql = "select * from (select rownum rn, qno,qcategory,qname,qtitle,qcontent,qdate from (select * from qa_tbl  where qtitle LIKE ? or  QCONTENT LIKE ?)) where rn between ? and ?";
			try {
				System.out.println(search_select);
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				psmt.setString(2, "%"+search_text+"%");
				psmt.setInt(3, startRow);
				psmt.setInt(4, endRow);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					BoardView bv = new BoardView();
					
					bv.setQno(rs.getString("qno"));
					bv.setQcategory(rs.getString("qcategory"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQname(rs.getString("qname"));
					bv.setQdate(rs.getString("qdate"));
					list.add(bv);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return list;
		}else {
			System.out.println(search_select);
			System.out.println(search_text);
			sql = "select * from (select rownum rn, qno,qcategory,qname,qtitle,qcontent,qdate from (select * from qa_tbl  where qname LIKE ? )) where rn between ? and ?";
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, "%"+search_text+"%");
				psmt.setInt(2, startRow);
				psmt.setInt(3, endRow);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					BoardView bv = new BoardView();
					
					bv.setQno(rs.getString("qno"));
					bv.setQcategory(rs.getString("qcategory"));
					bv.setQtitle(rs.getString("qtitle"));
					bv.setQname(rs.getString("qname"));
					bv.setQdate(rs.getString("qdate"));
					list.add(bv);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return list;
		}
	}
				
	
	// 메인뷰 최근 게시글 보기
	public static List<BoardView> new_view_list(){
		String sql = "select * from (select rownum rn, qname,qtitle,qdate,qno from (select * from qa_tbl order by qdate desc)) where rn between 1 and 5";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<BoardView> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				BoardView bv = new BoardView();
				bv.setQtitle(rs.getString("qtitle"));
				bv.setQname(rs.getString("qname"));
				bv.setQdate(rs.getString("qdate"));
				bv.setQno(rs.getString("qno"));
				list.add(bv);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	public static List<ProductList> product_list_top1(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ProductList> list = new ArrayList<>();
		sql = "select * from (select rownum rn, pno,pimage,pname,pprice,pbuytotal from (select * from product_tbl where pbuytotal > 0 order by pbuytotal desc) ) where ( rn = 1 )";
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						pl.setpNo(rs.getString("pno"));
						list.add(pl);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
			return list;
	}
	public static List<ProductList> product_list_top2(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ProductList> list = new ArrayList<>();
		sql = "select * from (select rownum rn, pno,pimage,pname,pprice,aid,pbuytotal from (select * from product_tbl  where pbuytotal > 0 order by pbuytotal desc)) where ( rn = 2 )";
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpNo(rs.getString("pno"));
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						list.add(pl);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
			return list;
	}
	public static List<ProductList> product_list_top3(){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ProductList> list = new ArrayList<>();
		sql = "select * from (select rownum rn, pno,pimage,pname,pprice,aid,pbuytotal from (select * from product_tbl  where pbuytotal > 0 order by pbuytotal desc)) where ( rn = 3 )";
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpNo(rs.getString("pno"));
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						list.add(pl);
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
			return list;
	}
	
	
	// 내 상품 주문 내역 확인하기
	public static List<ProductList> get_my_list(String id){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<ProductList> list = new ArrayList<>();
		sql = "select pno,aid from product_tbl where aid = ? order by pno desc";
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductList pl = new ProductList();
				
				pl.setpNo(rs.getString("pno"));
				pl.setaId(rs.getString("aid"));
				list.add(pl);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	
	public static List<my_product_orders> get_myProduct_list(String pno, int startRow, int endRow){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<my_product_orders> list = new ArrayList<>();
		sql = "select * from (select ROWNUM rn,ono,bid,pno,pimage,pname,pprice,oamount,totalprice,odate from (select * from order_tbl) where pno=?) where rn BETWEEN ? and ? ORDER by ono desc";
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pno);
			psmt.setInt(2, startRow);
			psmt.setInt(3, endRow);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				my_product_orders mpo = new my_product_orders();
				
				mpo.setBid(rs.getString("bid"));
				mpo.setOamount(rs.getString("oamount"));
				mpo.setOdate(rs.getString("odate"));
				mpo.setOno(rs.getString("ono"));
				mpo.setPname(rs.getString("pname"));
				mpo.setPno(rs.getString("pno"));
				mpo.setPprice(rs.getString("pprice"));
				mpo.setTotalprice(rs.getString("totalprice"));
				
				
				list.add(mpo);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	// 내 상품 주문 내역보기 페이징
	public int get_my_list_paging(String pno){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		int count = 0;
		
		List<my_product_orders> list = new ArrayList<>();
		sql = "select count(*) from (select ono,bid,pno,pimage,pname,pprice,oamount,totalprice,odate from (select * from order_tbl) where pno=?) ORDER by odate";
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pno);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return count;
	}
	
	public static String encryption_pw(String pw) {
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(pw.getBytes());
			byte byteData[] = md.digest();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
			}
			StringBuffer hexString = new StringBuffer();
			for (int i = 0; i < byteData.length; i++) {
				String hex = Integer.toHexString(0xff & byteData[i]);
				if (hex.length() == 1) {
					hexString.append('0');
				}
				hexString.append(hex);
			}
			return hexString.toString();
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException();
		}
	}
}



