package com.bobjo.review.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.bobjo.utils.db.ConnectionManager;

public class ReviewDAO {

	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	String sql = "";
	
	// 전체 리뷰 목록
	public List<ReviewDTO> getReviewList(String sort, int startRow, int pageSize, int store_no){
		List<ReviewDTO> list = new ArrayList<>();
		ReviewDTO dto;
		
		try {
			conn = ConnectionManager.getConnection();
			sql = "SELECT * FROM BOBJO_REVIEW WHERE STORE_NO = ?";
			if(sort.equals("high")) {
				sql = sql + " ORDER BY SCORE DESC";
			}
			else if(sort.equals("low")) {
				sql = sql + " ORDER BY SCORE";
			}
			else if(sort.equals("recent")) {
				sql = sql + " ORDER BY REVIEW_NO DESC";
			}
			sql = sql + " LIMIT ?, ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, pageSize);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new ReviewDTO();
				
				dto.setReview_no(rs.getInt("review_no"));
				dto.setM_id(rs.getString("m_id"));
				dto.setStore_no(rs.getInt("store_no"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getDate("reg_date"));
				dto.setScore(rs.getFloat("score"));
				dto.setReview_img(rs.getString("review_img"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return list;
	}
	// 전체 리뷰 목록
	
	// 식당 리뷰 개수
	public int getCountReview(int store_no) {
		int count = 0;
		
		try {
			conn = ConnectionManager.getConnection();
			sql = "SELECT COUNT(*) FROM BOBJO_REVIEW WHERE STORE_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) count = rs.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return count;
	}
	// 식당 리뷰 개수
	
	// 점수
	public Map<Integer, Integer> getReviewScore(int store_no) {
		Map<Integer, Integer> map = new HashMap<>();
		int key;
		
		try {
			conn = ConnectionManager.getConnection();
			sql = "SELECT SCORE FROM BOBJO_REVIEW WHERE STORE_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				key = (int) rs.getFloat(1);
				map.put(key, map.getOrDefault(key, 0) + 1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return map;
	}
	// 점수

	// 리뷰 등록
	public void registerReview(ReviewDTO dto) {
		int result;
		try {
			conn = ConnectionManager.getConnection();
			sql = "INSERT INTO BOBJO_REVIEW VALUES (DEFAULT, ?, ?, ?, NOW(), ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			pstmt.setInt(2, dto.getStore_no());
			pstmt.setString(3, dto.getContent());
			pstmt.setFloat(4, dto.getScore());
			pstmt.setString(5, dto.getReview_img());
			
			result = pstmt.executeUpdate();
			
			if(result == 1) System.out.println("등록 성공!");
			else System.out.println("등록 실패!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
	}
	// 리뷰 등록

	
	// 리뷰 수정
	public void modifyReview(ReviewDTO dto) {
		int result;
		try {
			conn = ConnectionManager.getConnection();
			sql = "UPDATE BOBJO_REVIEW SET CONTENT = ?, SCORE = ?, REVIEW_IMG = ?"
					+ " WHERE REVIEW_NO = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getContent());
			pstmt.setFloat(2, dto.getScore());
			pstmt.setString(3, dto.getReview_img());
			pstmt.setInt(4, dto.getReview_no());
			
			result = pstmt.executeUpdate();
			
			if(result == 1) System.out.println("수정 성공!");
			else System.out.println("수정 실패!");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
	}
	// 리뷰 수정

	public String getStoreName(int store_no) {
		String name = "";
		
		try {
			conn = ConnectionManager.getConnection();
			sql = "select store_name from bobjo_store"
					+ " where store_no = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, store_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) name = rs.getString(1);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return name;
	}
}
