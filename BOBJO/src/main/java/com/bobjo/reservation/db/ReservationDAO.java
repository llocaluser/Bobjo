package com.bobjo.reservation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bobjo.utils.db.ConnectionManager;

public class ReservationDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";

	public void insertReservation(ReservationDTO dto) {
		try {
			con = ConnectionManager.getConnection();
			sql = "select max(rsrv_no) from bobjo_reservation";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			dto.setRsrv_no(rs.getInt(1)+1);
			
			sql = "insert into bobjo_reservation values(?,?,?,?,?,?,?,now(),null,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getRsrv_no());
			pstmt.setString(2, dto.getM_id());
			pstmt.setString(3, dto.getRsrv_name());
			pstmt.setString(4, dto.getRsrv_phone());
			pstmt.setInt(5, dto.getStore_no());
			pstmt.setTimestamp(6, dto.getRsrv_date());
			pstmt.setInt(7, dto.getPeople_num());
			pstmt.setString(8, dto.getStatus());
			pstmt.setString(9, dto.getRsrv_msg());
			pstmt.setString(10, dto.getMenu_no());
			pstmt.setString(11, dto.getMenu_amount());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}

	public void updateRsrvWhenCompletePay(int rsrv_no, int pay_no) {
		try {
			con = ConnectionManager.getConnection();
			
			sql = "update bobjo_reservation set status = '예약완료', pay_no = ? where rsrv_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pay_no);
			pstmt.setInt(2, rsrv_no);
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}

	public String getRefundPolicy(int store_no) {
		String refundPolicy = null;
		try {
			con = ConnectionManager.getConnection();
			
			sql = "select refund_policy from bobjo_store where store_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			
			rs = pstmt.executeQuery();
			rs.next();
			refundPolicy = rs.getString(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		return refundPolicy;
	}
	
	
}
