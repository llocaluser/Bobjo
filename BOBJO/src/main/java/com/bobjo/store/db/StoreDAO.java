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
			pstmt.setString(9, dto.getExstra_info());
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
}
