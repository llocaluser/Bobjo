package com.bobjo.samples.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bobjo.utils.db.ConnectionManager;

public class SampleDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	public List getSampleList() {
		List list = new ArrayList<>();
		
		try {
			con = ConnectionManager.getConnection();
			
			sql = "select * from samples where sampleid like ?";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, "%%");
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SampleDTO dto = new SampleDTO();
				dto.setSampleId(rs.getString(1));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return list;
	}
	
	public void insertSample(SampleDTO dto) {
		try {
			con = ConnectionManager.getConnection();
			
			sql = "insert into samples values(?)";
			
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getSampleId());
			
			pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
}
