package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class DBConnection {
	
	
	//데이터 연결 코드 - 전준표
	
	public static Connection getDBconnect() throws Exception {
		String url = "jdbc:oracle:thin:@db.interstander.com:41521:XE";
		String uid = "sae";
		String upw = "sae1234";
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url,uid,upw);
		
		return conn;
	}
	
	//데이터 연결 close코드 (rs,psmt,conn)
	public static void close(ResultSet rs , PreparedStatement psmt ,Connection conn) {
		try {
			if(rs!=null) {rs.close();}
			if(psmt!=null) {psmt.close();}
			if(conn!=null) {conn.close();}
		}catch (Exception e) {
			e.printStackTrace();
			}
			
		}
	//데이터 연결 close코드(psmt,conn)
	public static void close(PreparedStatement psmt ,Connection conn) {
		try {
			if(psmt!=null) {psmt.close();}
			if(conn!=null) {conn.close();}
		}catch (Exception e) {
			e.printStackTrace();
			}
			
		}
	
	
	
	}

