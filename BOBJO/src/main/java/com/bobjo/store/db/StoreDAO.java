package com.bobjo.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.bobjo.utils.db.ConnectionManager;

public class StoreDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public void insertStore(StoreDTO dto) {
		try {
			con = ConnectionManager.getConnection();
			
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
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
	
	public List getStoreList(String srch_location, String srch_category, String srch_text) {
		List list = new ArrayList<>();
		
		try {
			con = ConnectionManager.getConnection();
			
			StringBuilder sqlBuilder = new StringBuilder();
			sqlBuilder.append("select s.store_no,s.store_name,s.addr,s.store_img,s.store_category,r.score ");
			sqlBuilder.append("from bobjo_store s left join (select store_no, round(avg(score),1) score from bobjo_review group by store_no) r ");
			sqlBuilder.append("on s.store_no = r.store_no ");
			sqlBuilder.append("where s.store_name like ? ");

			if(!srch_location.equals("")) {
				sqlBuilder.append("and substring_index(substring_index(s.addr,' ',2),' ',-1) in(");
				sqlBuilder.append(srch_location);
				sqlBuilder.append(") ");
			}
			if(!srch_category.equals("")) {
				sqlBuilder.append("and s.store_category in(");
				sqlBuilder.append(srch_category);
				sqlBuilder.append(") ");
			}
			
			pstmt = con.prepareStatement(sqlBuilder.toString());
			pstmt.setString(1, "%"+srch_text+"%");

			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				StoreDTO dto = new StoreDTO();
				dto.setStore_no(rs.getInt(1));
				dto.setStore_name(rs.getString(2));
				dto.setAddr(rs.getString(3));
				dto.setStore_img(rs.getString(4));
				dto.setStore_category(rs.getString(5));
				dto.setScore(rs.getDouble(6));
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return list;
	}
	
	// 특정 가게 조회
		public StoreDTO getStore(int store_no) {
			StoreDTO dto = null;
			try {
				con = ConnectionManager.getConnection();
				sql = "select * from bobjo_store where store_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, store_no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto = new StoreDTO();
					
					dto.setStore_no(rs.getInt("store_no"));
					dto.setAddr(rs.getString("addr"));
					dto.setAddr_details(rs.getString("addr_details"));
					dto.setTel(rs.getString("tel"));
					dto.setOpen(rs.getString("open"));
					dto.setClose(rs.getString("close"));
					dto.setRefund_policy(rs.getString("refund_policy"));
					dto.setTotal_tables(rs.getInt("total_tables"));
					dto.setMax_rsrv(rs.getInt("max_rsrv"));
					dto.setExtra_info(rs.getString("extra_info"));
					dto.setStore_category(rs.getString("store_category"));
					dto.setStore_content(rs.getString("store_content"));
				}
				System.out.println(" DAO : 가게 정보 조회성공!");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}
			return dto;
		}
		// 특정 가게 조회
}
