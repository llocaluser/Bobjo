package com.bobjo.utils.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bobjo.store.db.StoreDTO;

public class CSVInsertor {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public void insertStore(StoreDTO dto) {
		try {
			con = TestConnectionManager.getConnection();
			
			sql = "insert into bobjo_store values(default,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getStore_name());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getAddr_details());
			pstmt.setString(4, dto.getTel());
			pstmt.setString(5, dto.getOpen());
			pstmt.setString(6, dto.getClose());
			pstmt.setInt(7, dto.getTotal_tables());
			pstmt.setInt(8, dto.getMax_rsrv());
			pstmt.setString(9, dto.getExtra_info());
			pstmt.setString(10, dto.getStore_content());
			pstmt.setString(11, dto.getStore_img());
			pstmt.setString(12, dto.getRefund_policy());
			pstmt.setString(13, dto.getStore_category());
			pstmt.setString(14, dto.getM_id());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			TestConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
	
}
