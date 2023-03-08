package com.bobjo.utils.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnectionManager {
	// 디비연결 메서드 - Connection getCon()
	public static Connection getConnection() throws Exception{
		return ((DataSource)new InitialContext().lookup("java:comp/env/jdbc/bobjo")).getConnection();
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
