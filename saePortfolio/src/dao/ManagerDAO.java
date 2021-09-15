package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import db.DBConnection;
import vo.AccountMemberInfo;
import vo.BasicMemberInfo;
import vo.PointInfo;
import vo.managerMemberInfo;

public class ManagerDAO {

	
	private ManagerDAO () {}
	
	public static ManagerDAO dao = new ManagerDAO();
	
	public static ManagerDAO getInstance() {
		return dao;
	}
	
	// 관리자 회원정보수정 불러오는 코드
		public static List<managerMemberInfo>managerMemberInfo(String id) {
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			String sql = "SELECT * FROM manager_member_tbl where mid = ?";
			
			List<managerMemberInfo> list = new ArrayList<>();
			
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				while(rs.next()) {
					managerMemberInfo mm = new managerMemberInfo();
					
					int idx = rs.getString("memail").indexOf("@");
					
					
					mm.setmId(rs.getString("mid"));
					mm.setmPw(rs.getString("mpw"));
					mm.setmName(rs.getString("mname"));
					if(rs.getString("mtel").length()== 11) {
						mm.setmTel1(rs.getString("mtel").substring(0, 2));
						mm.setmTel2(rs.getString("mtel").substring(3, 6));
						mm.setmTel3(rs.getString("mtel").substring(7, 11));
					}else if(rs.getString("mtel").length()== 12) {
						mm.setmTel1(rs.getString("mtel").substring(0, 3));
						mm.setmTel2(rs.getString("mtel").substring(4, 7));
						mm.setmTel3(rs.getString("mtel").substring(8, 12));
					}else {
						mm.setmTel1(rs.getString("mtel").substring(0, 3));
						mm.setmTel2(rs.getString("mtel").substring(4, 8));
						mm.setmTel3(rs.getString("mtel").substring(9, 13));
					}
					mm.setmEmail1(rs.getString("memail").substring(0,idx));
					mm.setmEmail2(rs.getString("memail").substring(idx+1));
					list.add(mm);
				}
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return list;
		}	
		
		// 관리자 포인트 요청 페이지 - 페이징
		public static List<PointInfo> GetList_Request(int startRow, int endRow){
			String sql = "select * from (select rownum rn, pno,bid,rqp,afterpoint,bank,presult,rdate "
					+ "from (select * from point_tbl order by rdate desc)) "
					+ "where ( rn between ? and ? ) order by rn";
			
			Connection conn = null;
			PreparedStatement psmt = null;
			ResultSet rs = null;
			
			List<PointInfo> list = new ArrayList<>();
			
			try {
				conn = DBConnection.getDBconnect();
				psmt = conn.prepareStatement(sql);
				psmt.setInt(1, startRow);
				psmt.setInt(2, endRow);
				psmt.executeUpdate();
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					PointInfo pi = new PointInfo();
					
					pi.setAfterpoint(rs.getString("afterpoint").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
					pi.setBank(rs.getString("bank"));
					pi.setBid(rs.getString("bid"));
					pi.setPno(rs.getString("pno"));
					pi.setPresult(rs.getString("presult"));
					pi.setRdate(rs.getString("rdate"));
					pi.setRqp(rs.getString("rqp").replaceAll("\\B(?=(\\d{3})+(?!\\d))", ","));
					list.add(pi);
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}finally {
				DBConnection.close(rs, psmt, conn);
			}
			return list;
		}
		
		public int GetList_Request_count() {
			int count = 0;
			String sql = "select count(*) from point_tbl";
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
		
		// 파트너사회원 관리 페이징 카운트
				public int account_management_count() {
					int count = 0;
					String sql = "select count(*) from account_member_tbl";
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
				
			// 일반회원 관리 페이징 카운트
					public int basic_management_count() {
						int count = 0;
						String sql = "select count(*) from basic_member_tbl";
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
					
				// 파트너사 회원 관리 페이징 - 신기호
				public static List<AccountMemberInfo> GetList_account_management(int startRow, int endRow){
					String sql = "select * from (select rownum rn, aid,aname,atel from (select * from account_member_tbl)) where ( rn between ? and ? )";
					
					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;
					
					List<AccountMemberInfo> list = new ArrayList<>();
					
					try {
						conn = DBConnection.getDBconnect();
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, startRow);
						psmt.setInt(2, endRow);
						psmt.executeUpdate();
						rs = psmt.executeQuery();
						
						while(rs.next()) {
							AccountMemberInfo am = new AccountMemberInfo();
							
							am.setaId(rs.getString("aid"));
							am.setaName(rs.getString("aname"));
							am.setaTel1(rs.getString("atel"));
							list.add(am);
						}
						
					}catch (Exception e) {
						e.printStackTrace();
					}finally {
						DBConnection.close(rs, psmt, conn);
					}
					return list;
				}		
				
				
				// 일반 회원 관리 페이징 - 신기호
				public static List<BasicMemberInfo> GetList_basic_management(int startRow, int endRow){
					String sql = "select * from (select rownum rn, bid,bname,btel from (select * from basic_member_tbl)) where ( rn between ? and ? )";
					
					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;
					
					List<BasicMemberInfo> list = new ArrayList<>();
					
					try {
						conn = DBConnection.getDBconnect();
						psmt = conn.prepareStatement(sql);
						psmt.setInt(1, startRow);
						psmt.setInt(2, endRow);
						psmt.executeUpdate();
						rs = psmt.executeQuery();
						
						while(rs.next()) {
							BasicMemberInfo bm = new BasicMemberInfo();
							
							bm.setbId(rs.getString("bid"));
							bm.setbName(rs.getString("bname"));
							bm.setbTel1(rs.getString("btel"));
							list.add(bm);
						}
						
					}catch (Exception e) {
						e.printStackTrace();
					}finally {
						DBConnection.close(rs, psmt, conn);
					}
					return list;
				}
			
				public static String getPoint(String bid) {
					Connection conn = null;
					PreparedStatement psmt = null;
					ResultSet rs = null;
					
					String sql = "SELECT bpoint FROM basic_member_tbl where bid = ?";
					
					String result = null;
					
					try {
						conn = DBConnection.getDBconnect();
						psmt = conn.prepareStatement(sql);
						psmt.setString(1, bid);
						psmt.executeUpdate();
						rs = psmt.executeQuery();
						while(rs.next()){
							result = rs.getString("bpoint");
						}
					}catch(Exception e) {
						e.printStackTrace();
					}finally {
						DBConnection.close(rs, psmt, conn);
					}
					return result;
				}
				
	// 관리자 회원 PW 찾기
	public static List<managerMemberInfo> manager_find_pw(String tel, String id){
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<managerMemberInfo> list = new ArrayList<>();
		
		String sql = "select * from manager_member_tbl where mtel = ? and mid = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, id);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				managerMemberInfo bm = new managerMemberInfo();
				
				bm.setmPw(rs.getString("mpw"));
				
				list.add(bm);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
	
	// 관리자 ID 찾기
	public static List<managerMemberInfo> manager_find_id(String tel, String email){
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		List<managerMemberInfo> list = new ArrayList<>();
		
		String sql = "select * from manager_member_tbl where mtel = ? and memail = ?";
		
		try {
			conn = DBConnection.getDBconnect();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, tel);
			psmt.setString(2, email);
			rs = psmt.executeQuery();
			
			
			while(rs.next()) {
				managerMemberInfo mm = new managerMemberInfo();
				
				mm.setmId(rs.getString("mid"));
				
				list.add(mm);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			DBConnection.close(rs, psmt, conn);
		}
		return list;
	}
		
}
