package com.bobjo.reservation.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bobjo.store.db.StoreDTO;
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
			
			sql = "insert into bobjo_reservation values(?,?,?,?,?,?,?,now(),?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, dto.getRsrv_no());
			pstmt.setString(2, dto.getM_id());
			pstmt.setString(3, dto.getRsrv_name());
			pstmt.setString(4, dto.getRsrv_phone());
			pstmt.setInt(5, dto.getStore_no());
			pstmt.setTimestamp(6, dto.getRsrv_date());
			pstmt.setInt(7, dto.getPeople_num());
			if(dto.getPay_no() == 0) {
				pstmt.setObject(8, null);
			}else {
				pstmt.setInt(8, dto.getPay_no());
			}
			pstmt.setString(9, dto.getStatus());
			pstmt.setString(10, dto.getRsrv_msg());
			pstmt.setString(11, dto.getMenu_no());
			pstmt.setString(12, dto.getMenu_amount());
			
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

	
	// 결제 진행을 위한 추가정보 -  가게 이름, 최대예약인원, 영업시간, 환불정책
	public StoreDTO getStoreInfoForRsrv(int store_no) {
		StoreDTO dto = new StoreDTO();
		
		try {
			con = ConnectionManager.getConnection();
			
			sql = "select store_name,max_rsrv,open,close,refund_policy "
				+ "from bobjo_store "
				+ "where store_no = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				dto.setStore_name(rs.getString(1));
				dto.setMax_rsrv(rs.getInt(2));
				dto.setOpen(rs.getString(3));
				dto.setClose(rs.getString(4));
				dto.setRefund_policy(rs.getString(5));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return dto;
	}
	// 결제 진행을 위한 추가정보 -  가게 이름, 최대예약인원
	
	// 다빈 - 예약자 목록 조회
	public List CeoRsvList(String id){
		List cRsvList = new ArrayList<>();
		try {
			// 1.2 디비 연결
			con = ConnectionManager.getConnection();
			// 3. sql 작성
			sql = "select r.reg_date,r.store_no,r.rsrv_no,r.rsrv_name,r.rsrv_phone,s.store_name,r.rsrv_date,r.people_num,r.pay_no,r.status,r.rsrv_msg,r.menu_no,r.menu_amount "
					+ " from bobjo_reservation r join bobjo_store s on (r.store_no = s.store_no) " 
					+ " where r.store_no in (select store_no from bobjo_store where m_id=?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			// 4. sql 실행
			rs = pstmt.executeQuery();
			// 5. 데이터 처리 
			while(rs.next()) {
				List subList = new ArrayList<>();
				ReservationDTO dto = new ReservationDTO();
				StoreDTO sdto = new StoreDTO();
				
				dto.setRsrv_no(rs.getInt("rsrv_no"));
				dto.setRsrv_name(rs.getString("rsrv_name"));
				dto.setRsrv_phone(rs.getString("rsrv_phone"));
				dto.setStore_no(rs.getInt("store_no"));
				dto.setRsrv_date(rs.getTimestamp("rsrv_date"));
				dto.setPeople_num(rs.getInt("people_num"));
				//dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setPay_no(rs.getInt("pay_no"));
				dto.setStatus(rs.getString("status"));
				dto.setRsrv_msg(rs.getString("rsrv_msg"));
				dto.setMenu_no(rs.getString("menu_no"));
				dto.setMenu_amount(rs.getString("menu_amount"));
				sdto.setStore_name(rs.getString("store_name"));
				subList.add(dto);
				subList.add(sdto);
				cRsvList.add(subList);
			}
			System.out.println(" DAO : 예약자 목록 조회 성공! ");

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		return cRsvList;
	}


	// 예약시 포인트 가져오는 메서드
	public int getPoint(String m_id) {
		int point = 0;
		
		try {
			con = ConnectionManager.getConnection();
			sql = "select point from bobjo_member where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			rs = pstmt.executeQuery();
			rs.next();
			return rs.getInt(1);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return point;
	}
	// 예약시 포인트 가져오는 메서드

	// 포인트 사용시 포인트 차감하는 메서드
	public void spentPoint(int point, String m_id) {
		try {
			
			con = ConnectionManager.getConnection();
			sql = "update bobjo_member set point = point - ? where m_id = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, point);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
	// 포인트 사용시 포인트 차감하는 메서드


}
