package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import sun.security.pkcs11.Secmod.DbMode;
import vo.AccountMemberInfo;
import vo.ProductList;
import vo.my_product_orders;

public class PartnerDAO {
	
	private PartnerDAO(){}
	
	public static PartnerDAO dao = new PartnerDAO();
	
	public static PartnerDAO getInstance() {
		return dao;
	}
	
	// 신기호 파트너사 정보수정
			public static List<AccountMemberInfo>AccountMemberInfo(String id) {
				
				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				
				String sql = "SELECT * FROM account_member_tbl where aid = ?";
				
				List<AccountMemberInfo> list = new ArrayList<>();
				
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					rs = psmt.executeQuery();
					while(rs.next()) {
						AccountMemberInfo am = new AccountMemberInfo();
						
						int idx = rs.getString("aemail").indexOf("@");
						
						am.setaId(rs.getString("aid"));
						am.setaPw(rs.getString("apw"));
						am.setaName(rs.getString("aname"));
						am.setaEmail1(rs.getString("aemail").substring(0,idx));
						am.setaEmail2(rs.getString("aemail").substring(idx+1));

						if(rs.getString("atel").length()== 11) {
							am.setaTel1(rs.getString("atel").substring(0, 2));
							am.setaTel2(rs.getString("atel").substring(3, 6));
							am.setaTel3(rs.getString("atel").substring(7, 11));
						}else if(rs.getString("atel").length()== 12) {
							am.setaTel1(rs.getString("atel").substring(0, 3));
							am.setaTel2(rs.getString("atel").substring(4, 7));
							am.setaTel3(rs.getString("atel").substring(8, 12));
						}else {
							am.setaTel1(rs.getString("atel").substring(0, 3));
							am.setaTel2(rs.getString("atel").substring(4, 8));
							am.setaTel3(rs.getString("atel").substring(9, 13));
						}
						
						list.add(am);
					}
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}
			
		//  나의 상품리스트 카운트 메서드 - 전준표
			public int myProduct_count(String id) {
				int count = 0;
				String sql = "select count(*) from product_tbl where aid = ?";
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
			// 나의 상품리스트 불러오는 메서드 - 전준표;
			public static List<ProductList> getList_myProduct(int startRow, int endRow, String id){
				String sql = "select * \r\n" + 
						"from (select rownum rn, pno,pimage,pname,pprice,pamount,pbuytotal from (select * from product_tbl order by pno desc) where aid = ?) \r\n" + 
						"where ( rn between ? and ? )";
				
				Connection conn = null;
				PreparedStatement psmt = null;
				ResultSet rs = null;
				
				List<ProductList> list = new ArrayList<>();
				
				try {
					conn = DBConnection.getDBconnect();
					psmt = conn.prepareStatement(sql);
					psmt.setString(1, id);
					psmt.setInt(2, startRow);
					psmt.setInt(3, endRow);
					psmt.executeUpdate();
					rs = psmt.executeQuery();
					
					while(rs.next()) {
						ProductList pl = new ProductList();
						
						pl.setpNo(rs.getString("pno"));
						pl.setpImage(rs.getString("pimage"));
						pl.setpName(rs.getString("pname"));
						pl.setpAmount(rs.getString("pamount"));
						pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
						pl.setpBuyTotal(rs.getString("pbuytotal"));
						list.add(pl);
					}
					
				}catch (Exception e) {
					e.printStackTrace();
				}finally {
					DBConnection.close(rs, psmt, conn);
				}
				return list;
			}	
	
	// 파트너사 회원 PW 찾기
	public static List<AccountMemberInfo> account_find_pw(String tel, String id){
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AccountMemberInfo> list = new ArrayList<>();
		
		String sql = "select * from account_member_tbl where atel = ? and aid = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, id);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				AccountMemberInfo am = new AccountMemberInfo();
				
				am.setaPw(rs.getString("apw"));
				
				list.add(am);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	// 파트너사 ID 찾기
	public static List<AccountMemberInfo> account_find_id(String tel, String email){
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<AccountMemberInfo> list = new ArrayList<>();
		
		String sql = "select * from account_member_tbl where atel = ? and aemail = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				AccountMemberInfo am = new AccountMemberInfo();
				
				am.setaId(rs.getString("aid"));
				
				list.add(am);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	//나의 등록된 상품 pno 추출하기 회원탈퇴시 삭제시 필요
	
	public static List<String>getPno(String aId) {
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<String> list = new ArrayList<>();
		String result = null;
		
		String sql = "SELECT pno FROM product_tbl WHERE aid = ?";
		
		try {
			
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, aId);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			while (rs.next()) {
				result = rs.getString("pno");
				list.add(result);
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	//등록한 상품 정보 수정시 수정할 상품정보 불러오는 메서드 - product_Correct_View.jsp 에 사용
	
	public static List<ProductList> getProductInfo(String pNo){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		List<ProductList> list = new ArrayList<>();
		
		String sql = "SELECT * FROM product_tbl WHERE pno = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pNo);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				ProductList pl = new ProductList();
				
				pl.setpName(rs.getString("pname"));
				pl.setpImage(rs.getString("pimage"));
				pl.setpContent(rs.getString("pcontent"));
				pl.setpPrice(rs.getString("pprice").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
				pl.setpAmount(rs.getString("pamount"));
				
				list.add(pl);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	// 파트너사 내 상품 주문 내역 보기
	public static List<my_product_orders> get_mysale_Product_list(String id, int startRow, int endRow){
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		String sql = null;
		
		List<my_product_orders> list = new ArrayList<>();
		sql = "select * from (select rownum rn,order_tbl.ono,product_tbl.aid,order_tbl.bid,order_tbl.pno,order_tbl.pimage,order_tbl.pname,order_tbl.pprice,order_tbl.oamount,order_tbl.totalprice,order_tbl.odate,order_tbl.oaddress from order_tbl join product_tbl on order_tbl.pno = product_tbl.pno where aid=? order by odate desc) where rn between ? and ?";
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setInt(2, startRow);
			psmt.setInt(3, endRow);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				my_product_orders mpo = new my_product_orders();
				
				mpo.setBid(rs.getString("bid"));
				mpo.setOamount(rs.getString("oamount"));
				mpo.setOaddress(rs.getString("oaddress"));
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
	
	// 파트너사 내 상품 주문 내역 보기 페이징
	public int get_mysale_Product_count(String id) {
		int count = 0;
		String sql = "select count(*) from (select rownum rn,order_tbl.ono,product_tbl.aid,order_tbl.bid,order_tbl.pno,order_tbl.pimage,order_tbl.pname,order_tbl.pprice,order_tbl.oamount,order_tbl.totalprice,order_tbl.odate from order_tbl join product_tbl on order_tbl.pno = product_tbl.pno where aid=? order by odate desc)";
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
	
	//주문한 회원주소 가져오는 메서드
	
	public static String getOAddress(String bid) {
		
		String sql = "SELECT baddress,bdetailaddress FROM basic_member_tbl where bid = ?";
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		String oaddress = null;
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, bid);
			psmt.executeUpdate();
			rs = psmt.executeQuery();
			if(rs.next()) {
				oaddress = rs.getString("baddress") +"  "+rs.getString("bdetailaddress");
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return oaddress;
	}
	
}
