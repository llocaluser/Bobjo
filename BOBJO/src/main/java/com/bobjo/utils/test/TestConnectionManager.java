package com.bobjo.utils.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 톰캣 서버 없이 커넥션 가져오는 클래스
 * 
 * @author bcdc124
 *
 */
public class TestConnectionManager {
	// 디비연결 메서드 - Connection getCon()
	public static Connection getConnection() throws Exception{
		Connection con = null;
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://db.itwillbs.dev:3306/class6_221128_team2";
		String id = "class6_221128_team2";
		String pw = "1234";
		
		con = DriverManager.getConnection(url, id, pw);
		
		return con;
	}
	// 디비연결 메서드 - Connection getCon()
	
	// 디비연결해제 메서드 - void closeConnection()
	public static void closeConnection(ResultSet rs, PreparedStatement pstmt, Connection con) {
		try {
			if (rs != null)	rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (pstmt != null) pstmt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			if (con != null) con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 디비연결해제 메서드 - void closeConnection()

}
