package com.bobjo.payInfo.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bobjo.utils.db.ConnectionManager;

public class PayInfoDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public boolean insertPayInfo(PayInfoDTO dto) {
		
		try {
			con = ConnectionManager.getConnection();
			sql = "select max(pay_no) from bobjo_payinfo";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setPay_no(rs.getInt(1)+1);
			
			sql = "insert into bobjo_payinfo values(?,?,?,now(),?,?,default)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getPay_no());
			pstmt.setString(2, dto.getM_p_id());
			pstmt.setString(3, dto.getM_c_id());
			pstmt.setInt(4, dto.getPrice());
			pstmt.setString(5, dto.getPay_type());
			
			if(pstmt.executeUpdate() > 0) return true;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return false;
	}

	public String getCeoId(int store_no) {
		String ceoId = null;
		
		try {
			con = ConnectionManager.getConnection();
			
			sql = "select m_id "
				+ "from bobjo_store "
				+ "where store_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			
			rs = pstmt.executeQuery();
			rs.next();
			ceoId = rs.getString(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return ceoId;
	}
	
}
