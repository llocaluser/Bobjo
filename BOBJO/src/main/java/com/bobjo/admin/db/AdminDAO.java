package com.bobjo.admin.db;

import java.security.SecureRandom;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.bobjo.member.db.MemberDTO;
import com.bobjo.utils.db.ConnectionManager;

public class AdminDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	// 회원 비밀번호 재설정해서 보내기
	public String[] generateNewPw(String id) {
		final int SIZE = 16;
		String pw = "";
		String email = "";
		
		try {
			conn = ConnectionManager.getConnection();
			pw = getRamdomPassword(SIZE);
			sql = "UPDATE BOBJO_MEMBER"
					+ " SET PW = ?"
					+ " WHERE M_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, id);
			
			int result = pstmt.executeUpdate();
			
			if (result > 0) {
				sql = "SELECT EMAIL FROM BOBJO_MEMBER"
						+ " WHERE M_ID = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) email = rs.getString(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return new String[] {pw, email};
	}
	// 회원 비밀번호 재설정해서 보내기
	
	// 난수 비밀번호 생성
	public String getRamdomPassword(final int size) {
        char[] charSet = new char[] {
                '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
                'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
                '!', '@', '#'};

        StringBuffer sb = new StringBuffer();
        SecureRandom sr = new SecureRandom();
        sr.setSeed(new Date().getTime());

        int idx = 0;
        int len = charSet.length;
        for (int i=0; i<size; i++) {
            idx = sr.nextInt(len);
            sb.append(charSet[idx]);
        }

        return sb.toString();
    }
	// 난수 비밀번호 생성
	
	// 모든 회원정보 조회
	public List<MemberDTO> viewMember(){
		MemberDTO dto;
		List<MemberDTO> list = new ArrayList<>();
		try {
			conn = ConnectionManager.getConnection();
			sql = "SELECT * FROM BOBJO_MEMBER"
					+ " WHERE LEVEL < 1";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new MemberDTO();
				
				dto.setM_id(rs.getString("m_id"));
				dto.setPw(rs.getString("pw"));
				dto.setM_name(rs.getString("m_name"));
				dto.setPhone(rs.getString("phone"));
				dto.setNickname(rs.getString("nickname"));
				dto.setEmail(rs.getString("email"));
				dto.setPoint(rs.getInt("point"));
				dto.setCeo_num(rs.getString("ceo_num"));
				dto.setAlcohol_level(rs.getString("alcohol_level"));
				
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return list;
	}
	// 모든 회원정보 조회
	
	// 특정 회원 삭제
	public int deleteMember(String id) {
		int result = 0;
		
		try {
			conn = ConnectionManager.getConnection();
			sql = "DELETE FROM BOBJO_MEMBER"
					+ " WHERE M_ID = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return result;
	}
	// 특정 회원 삭제
	
	// 특정 회원 수정
	public int updateMember(MemberDTO dto) {
		int result = 0;
		
		try {
			conn = ConnectionManager.getConnection();
			sql = "UPDATE BOBJO_MEMBER"
					+ " SET PW = ?, M_NAME = ?, PHONE = ?, NICKNAME = ?, EMAIL = ?,"
					+ " POINT = ?, ALCOHOL_LEVEL = ?"
					+ " WHERE M_ID = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getPw());
			pstmt.setString(2, dto.getM_name());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getNickname());
			pstmt.setString(5, dto.getEmail());
			pstmt.setInt(6, dto.getPoint());
			pstmt.setString(7, dto.getAlcohol_level());
			pstmt.setString(8, dto.getM_id());
			
			result = pstmt.executeUpdate();
			
			if(dto.getCeo_num() != null) {
				sql = "UPDATE BOBJO_MEMBER SET CEO_NUM = ?"
						+ " WHERE M_ID = ?";
				pstmt.setString(1, dto.getCeo_num());
				pstmt.setString(2, dto.getM_id());
				
				pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, conn);
		}
		
		return result;
	}
	// 특정 회원 수정
}
