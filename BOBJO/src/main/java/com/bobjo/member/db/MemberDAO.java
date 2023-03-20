package com.bobjo.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bobjo.store.db.StoreDTO;
import com.bobjo.utils.db.ConnectionManager;
import com.mysql.cj.Session;

public class MemberDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	// 회원가입 - insertMember(dto)
	public void insertMember(MemberDTO dto) {
		try {
			// 1,2 디비연결
			con = ConnectionManager.getConnection();
			// 3 sql 작성 & pstmt 객체
			sql = "insert into bobjo_member(m_id,pw,m_name,phone,nickname,email,alcohol_level,ceo_num) "
					+ " values(?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			// ???
			pstmt.setString(1, dto.getM_id());
			pstmt.setString(2, dto.getPw());
			pstmt.setString(3, dto.getM_name());
			pstmt.setString(4, dto.getPhone());
			pstmt.setString(5, dto.getNickname());
			pstmt.setString(6, dto.getEmail());
			pstmt.setString(7, dto.getAlcohol_level());
			pstmt.setString(8, dto.getCeo_num());
			
			// 4 sql 실행		
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 회원가입 성공! ");
			
		} catch (Exception e) {
			System.out.println(" DAO : 회원가입 실패! ");
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}		
	}
	// 회원가입 - insertMember(dto)
	
	//로그인 - loginMember(dto)
	public int loginMember(MemberDTO dto) {
		int result = -1;
		
		try {
			// 1.2. 디비연결
			con = ConnectionManager.getConnection();
			
			// 3. sql 작성 & pstmt 객체
			sql = "select pw from bobjo_member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			
			// 4. sql 실행
			ResultSet rs = pstmt.executeQuery();
			
			// 5. 데이터처리
			if(rs.next()) {
				if(dto.getPw().equals(rs.getString("pw"))) {
					//본인		
					result = 1;
				}else {
					// 비밀번호 오류
					result = 0;
				}			
			}else {
				// 비회원(아이디 정보없음)
				result = -1;
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		return result;
	}
	//로그인 - loginMember(dto)

	
	//회원탈퇴 - deleteMember(dto)
	public int deleteMember(MemberDTO dto) {
		int result = 1;
		
		try {
			con = ConnectionManager.getConnection();
			
			sql = "select pw from bobjo_member where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getM_id());
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(dto.getPw().equals(rs.getString("pw"))) {
					sql = "delete from bobjo_member where m_id=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, dto.getM_id());
					
					pstmt.executeUpdate();
					
					result = 1;
				}else {
					result = 0;
				}
			}else {
				result = -1;
			}
			System.out.println("회원 삭제 결과 : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return result;
	}
    //회원탈퇴 - deleteMember(dto)
	
	// 회원 정보 조회 - getMemberInfo(String m_id)
		public MemberDTO getMemberInfo(String m_id) {
			MemberDTO dto = null;

			try {
				con = ConnectionManager.getConnection();
				
				// 3. SQL 작성(select) & pstmt 객체
				sql = "select m_id,m_name,phone,nickname,email,alcohol_level from bobjo_member where m_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_id);
				
				// 4. SQL 실행
				rs = pstmt.executeQuery();

				// 5. 데이터 처리
				// 화면에 출력X -> 출력정보 저장 (리턴)
				if (rs.next()) {
					dto = new MemberDTO();
					dto.setM_id(rs.getString("m_id"));
					dto.setM_name(rs.getString("m_name"));
					dto.setPhone(rs.getString("phone"));
					dto.setNickname(rs.getString("nickname"));
					dto.setEmail(rs.getString("email"));
					dto.setAlcohol_level(rs.getString("alcohol_level"));	
				}

				System.out.println(" DAO : 회원정보 조회 성공! ");

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}

			return dto;
		}

		// 회원 정보 조회 - getMemberInfo(String m_id)
		
		// 회원정보 수정 -  updateMember(dto)
		public int updateMember(MemberDTO dto) {
			int result = -1;
			try {
				//1.2 디비연결
				con = ConnectionManager.getConnection();
				//3. sql 구문 & pstmt
				sql = "select pw from bobjo_member where m_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getM_id());
				
				//4. sql 실행
				rs = pstmt.executeQuery();
				
				//5. 데이터처리 (수정)
				if(rs.next()) {
					
					if(dto.getPw().equals(rs.getString("pw"))) {
						//3 sql (수정)
						sql = "update bobjo_member set phone=?,nickname=?,email=?,alcohol_level=? where m_id=?";
						pstmt = con.prepareStatement(sql);
						
						pstmt.setString(1, dto.getPhone());
						pstmt.setString(2, dto.getNickname());
						pstmt.setString(3, dto.getEmail());
						pstmt.setString(4, dto.getAlcohol_level());
						pstmt.setString(5, dto.getM_id());
						
						result = pstmt.executeUpdate();
						
					}else {
						result = 0;
					}
					
				}else {
					result = -1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
		    } finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}
			return result;
		}	
		// 회원정보 수정 -  updateMember(dto)
		
		// 아이디 정보 조회 - getFindID
		 public MemberDTO getFindID(String m_name, String email) {
			 MemberDTO dto = null;
			  try {
				  // 1.2. 디비연결
				 con = ConnectionManager.getConnection();
				 
				 // 3. sql 작성 & pstmt
				 sql = "select m_id from bobjo_member where m_name=? and email=?";
				 pstmt = con.prepareStatement(sql);
				 pstmt.setString(1, dto.getM_name());
				 pstmt.setString(2, dto.getEmail());
				 
				// 4. SQL 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				// 화면에 출력X -> 출력정보 저장 (리턴)
				if (rs.next()) {
					dto = new MemberDTO();
					dto.setM_name("m_name");
					dto.setEmail("email");
				}

				System.out.println(" DAO : 회원아이디 조회 성공! ");			 
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}
			 return dto;
		 }
		// 아이디 정보 조회 - getFindID

		// 회원 정보 조회

		// 0316-다빈 로그인 세션?
		public MemberDTO loginCeo(String m_id) {
			MemberDTO dto = null;
			try {
				con = ConnectionManager.getConnection();
				// 3. SQL 작성(select) & pstmt 객체
				sql = "select ceo_num,alcohol_level from bobjo_member where m_id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, m_id);
				// 4. SQL 실행
				rs = pstmt.executeQuery();
				if(rs.next()) {
					dto = new MemberDTO();
					dto.setCeo_num(rs.getString("ceo_num"));
					dto.setAlcohol_level(rs.getString("alcohol_level"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}
				
			return dto;
		}
		// 로그인 세션?

		

	
	
	
	

	// 메인페이지 추천식당 받기
	public List<StoreDTO> getStoreList() {
		List<StoreDTO> list = new ArrayList<>();
		StoreDTO dto;
		
		try {
			con = ConnectionManager.getConnection();
			sql = "SELECT STORE_NAME, STORE_CONTENT, STORE_IMG FROM BOBJO_STORE "
					+ "WHERE STORE_NO IN (SELECT STORE_NO "
					+ "FROM BOBJO_RESERVATION "
					+ "GROUP BY STORE_NO "
					+ "ORDER BY COUNT(STORE_NO) DESC) LIMIT 10";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new StoreDTO();
				
				dto.setStore_name(rs.getString(1));
				dto.setStore_content(rs.getString(2));
				dto.setStore_img(rs.getString(3));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		System.out.println("list:" + list);
		return list;
	}
	// 메인페이지 추천식당 받기
	
}




