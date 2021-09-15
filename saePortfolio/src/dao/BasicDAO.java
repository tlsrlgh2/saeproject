package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import vo.AccountMemberInfo;
import vo.BasicMemberInfo;
import vo.MyBasket;
import vo.OrderList;
import vo.PointInfo;

public class BasicDAO {
	
	private BasicDAO() {};
	
	public static BasicDAO dao = new BasicDAO();
	
	public static BasicDAO getInstance() {
		return dao;
	}
	
	// 일반회원정보수정 불러오는 코드
			public static List<BasicMemberInfo>basicMemberInfo(String id) {
				
				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM basic_member_tbl where bid = ?";
				
				List<BasicMemberInfo> list = new ArrayList<>();
				
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					while(rs.next()) {
						BasicMemberInfo bm = new BasicMemberInfo();
						
						int idx = rs.getString("bemail").indexOf("@");
						
						
						bm.setbId(rs.getString("bid"));
						bm.setbPw(rs.getString("bpw"));
						bm.setbName(rs.getString("bname"));
						bm.setYear(rs.getString("bbirth").substring(0, 4));
						bm.setMonth(rs.getString("bbirth").substring(5, 7));
						bm.setDate(rs.getString("bbirth").substring(8,10));
						if(rs.getString("btel").length()== 11) {
							bm.setbTel1(rs.getString("btel").substring(0, 2));
							bm.setbTel2(rs.getString("btel").substring(3, 6));
							bm.setbTel3(rs.getString("btel").substring(7, 11));
						}else if(rs.getString("btel").length()== 12) {
							bm.setbTel1(rs.getString("btel").substring(0, 3));
							bm.setbTel2(rs.getString("btel").substring(4, 7));
							bm.setbTel3(rs.getString("btel").substring(8, 12));
						}else {
							bm.setbTel1(rs.getString("btel").substring(0, 3));
							bm.setbTel2(rs.getString("btel").substring(4, 8));
							bm.setbTel3(rs.getString("btel").substring(9, 13));
						}
						bm.setBaddress(rs.getString("baddress"));
						bm.setBpostcode(rs.getString("bpostcode"));
						bm.setBdetailaddress(rs.getString("bdetailaddress"));
						bm.setbEmail1(rs.getString("bemail").substring(0,idx));
						bm.setbEmail2(rs.getString("bemail").substring(idx+1));
						bm.setbGender(rs.getString("bgender"));
						bm.setbWeight(rs.getString("bweight"));
						bm.setbHeight(rs.getString("bheight"));
						list.add(bm);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}
			
			//일반회원 포인트뷰 페이징
			public int GetPoint_basic_count(String id) {
				int count = 0;
				String sql = "select count(*) from point_tbl where bid = ? ";
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
			
			// 일반회원 포인트 조회 페이징
			public static List<PointInfo> GetPoint_basic_list(int startRow, int endRow, String id){
				String sql = "select * from (select rownum rn,pno,bid,rqp,afterpoint,bank,presult,rdate from (select * from point_tbl) where bid=? ) where ( rn between ? and ? )";
				
				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				
				List<PointInfo> list = new ArrayList<>();
				
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setInt(2, startRow);
					psmt.setInt(3, endRow);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						PointInfo pi = new PointInfo();
						
						pi.setAfterpoint(rs.getString("Afterpoint").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pi.setBank(rs.getString("Bank"));
						pi.setBid(rs.getString("Bid"));
						pi.setPno(rs.getString("Pno"));
						pi.setPresult(rs.getString("Presult"));
						pi.setRdate(rs.getString("Rdate").substring(0,10));
						pi.setRqp(rs.getString("Rqp").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						list.add(pi);
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}
			
	// 일반 회원 PW 찾기
	public static List<BasicMemberInfo> find_pw(String tel, String id){
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BasicMemberInfo> list = new ArrayList<>();
		
		String sql = "select * from basic_member_tbl where btel = ? and bid = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, id);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				BasicMemberInfo bm = new BasicMemberInfo();
				
				bm.setbPw(rs.getString("bpw"));
				
				list.add(bm);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	// 일반회원 ID 찾기
	public static List<BasicMemberInfo> find_id(String tel, String email){
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<BasicMemberInfo> list = new ArrayList<>();
		
		String sql = "select * from basic_member_tbl where btel = ? and bemail = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				BasicMemberInfo bm = new BasicMemberInfo();
				
				bm.setbId(rs.getString("bid"));
				
				list.add(bm);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	public static String getPoint(String bId) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String result = null;
		String sql = "SELECT bpoint from basic_member_tbl WHERE bid = ?";
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bId);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			while (rs.next()) {
				result = rs.getString("bpoint");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return result;
	}
	
	//일반회원 나의 주문내역 보기 메서드 
	
	public static List<OrderList> getOrderList(int startRow, int endRow, String id){
		String sql = "select * from (select rownum rn, ono,bid,pno,pimage,pname,pprice,oamount,totalprice,odate \r\n" + 
				"from (select * from order_tbl where bid = ?))\r\n" + 
				"where ( rn between ? and ? ) ORDER BY odate desc";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<OrderList> list = new ArrayList<>();
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2,startRow);
			psmt.setInt(3,endRow);
			psmt.executeUpdate();
			
			rs = psmt.executeQuery();
			while(rs.next()) {
				OrderList ol = new OrderList();
				ol.setpImage(rs.getString("pimage"));
				ol.setoNo(rs.getString("ono"));
				ol.setpNo(rs.getString("pno"));
				ol.setoAmount(rs.getString("oamount"));
				ol.setoDate(rs.getString("odate"));
				ol.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
				ol.setTotalPrice(rs.getString("totalprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
				ol.setpName(rs.getString("pname"));
				
				list.add(ol);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	//일반회원 주문내역 개수 메서드
	public int getOrderCount(String id) {
		int count = 0;
		String sql = "select count(*) from order_tbl where bid = ? ";
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
	
	//나의 장바구니 개수 불러오는 메서드
	
	public int getBasketCount(String bid) {
		int count = 0;
		String sql = "select count(*) from basket_tbl where bid = ? ";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bid);
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
	
	
	//나의 장바구니 불러오는 메서드
	
	public static List<MyBasket> getMyBasket(String bId){
		
		List<MyBasket> list = new ArrayList<>();
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT a.bId,a.pNo,a.pPrice,a.oAmount,a.totalPrice,b.pname,b.pimage\r\n" + 
				"FROM basket_tbl a JOIN product_tbl b\r\n" + 
				"ON a.pno = b.pno\r\n" + 
				"WHERE bid = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bId);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MyBasket mb = new MyBasket();
				mb.setbId(rs.getString("bid"));
				mb.setpNo(rs.getString("pno"));
				mb.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
				mb.setoAmount(rs.getString("oamount"));
				mb.setpImage(rs.getString("pimage"));
				mb.setpName(rs.getString("pname"));
				mb.setTotalPrice(rs.getString("totalprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
				
				list.add(mb);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	//장바구니에 담겨져있는 상품인지 확인하는 메서드
	
	public static int basketChk(String pno , String bId) {
		
		String sql = "SELECT * FROM basket_tbl WHERE bid = ? AND pno = ? ";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int chk = -1;
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bId);
			psmt.setString(2, pno);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				chk = 0;
			}else{
				chk = 1;
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return chk;
	}
	
	//장바구니에 해당되는 상품 남은수량 체크하는 메서드
	
	public static String getpAmount(String pNo) {
		String sql = "SELECT pamount FROM product_tbl WHERE pno= ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String aMount = null;
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pNo);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			if(rs.next()) {
				aMount = rs.getString("pamount");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return aMount;
	}
	
	//장바구니에 판매수를 가져오는 메서드
	public static String getSales(String pNo) {
		String sql = "SELECT pbuytotal FROM product_tbl WHERE pno= ?";
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String pbuytotal = null;
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pNo);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			if(rs.next()) {
				pbuytotal = rs.getString("pbuytotal");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return pbuytotal;
	}
	/*
 	포인트 변경값 적용
	public static String new_getPoint(String bId) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String result = null;
		String sql = "SELECT bpoint from basic_member_tbl WHERE bid = ?";
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bId);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			while (rs.next()) {
				result = rs.getString("bpoint");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return result;
	}
	*/
	
}
