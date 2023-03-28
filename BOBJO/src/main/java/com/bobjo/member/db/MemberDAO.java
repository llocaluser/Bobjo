package com.bobjo.member.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Request;

import com.bobjo.menu.db.MenuDTO;
import com.bobjo.reservation.db.ReservationDTO;
import com.bobjo.review.db.ReviewDTO;
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
				sql = "select m_id,m_name,phone,nickname,email,alcohol_level,point from bobjo_member where m_id=?";
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
					dto.setPoint(rs.getInt("point"));
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
		
		// 아이디 찾기 - getFindID
		   public MemberDTO getFindID(String m_name, String phone) {
			 MemberDTO dto = null;
			  try {
				  // 1.2. 디비연결
				 con = ConnectionManager.getConnection();
				 
				 // 3. sql 작성 & pstmt
				 sql = "select m_id from bobjo_member where m_name=? and phone=?";
				 pstmt = con.prepareStatement(sql);
				 pstmt.setString(1,m_name);
				 pstmt.setString(2,phone);
				 
				// 4. SQL 실행
				rs = pstmt.executeQuery();
				
				// 5. 데이터 처리
				// 화면에 출력X -> 출력정보 저장 (리턴)
				if (rs.next()) {
					dto = new MemberDTO();
				dto.setM_id(rs.getString("m_id"));
				}

				System.out.println(" DAO : 회원아이디 조회 성공! ");			 
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}
			 return dto;
		 }
		// 아이디 찾기 - getFindID

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
			sql = "SELECT BS.STORE_NAME, BS.STORE_CONTENT, BS.STORE_IMG, BS.STORE_NO "
					+ "FROM BOBJO_STORE BS RIGHT JOIN BOBJO_RESERVATION BR "
					+ "ON BS.STORE_NO = BR.STORE_NO "
					+ "GROUP BY BR.STORE_NO "
					+ "ORDER BY COUNT(BR.STORE_NO) DESC "
					+ "LIMIT 10";
			pstmt = con.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				dto = new StoreDTO();
				
				dto.setStore_name(rs.getString(1));
				dto.setStore_content(rs.getString(2));
				dto.setStore_img(rs.getString(3).split(",")[0]);
				dto.setStore_no(rs.getInt(4));
				
				list.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return list;
	}
	// 메인페이지 추천식당 받기
	
	
	// 비밀번호 찾기 - getFindPw
	   public MemberDTO getFindPw(String m_id, String m_name, String phone) {
		 MemberDTO dto = null;
		  try {
			  // 1.2. 디비연결
			 con = ConnectionManager.getConnection();
			 
			 // 3. sql 작성 & pstmt
			 sql = "select pw from bobjo_member where m_id=? and m_name=? and phone=?";
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, m_id);
			 pstmt.setString(2,m_name);
			 pstmt.setString(3,phone);
			 
			// 4. SQL 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			// 화면에 출력X -> 출력정보 저장 (리턴)
			if (rs.next()) {
				dto = new MemberDTO();
			    dto.setPw(rs.getString("pw"));
			}

			System.out.println(" DAO : 회원아이디 조회 성공! ");			 
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		 return dto;
	 }
	// 비밀번호 찾기 - getFindPw
	   
	// 예약정보 불러오기 - getMemberBookList()
	   public List getMemberBookList(String m_id) {
		   List totalList =  new ArrayList();
		   
		   try {
			   
			   // 1.2. 디비연결
			con = ConnectionManager.getConnection();
			
			// 3. sql 연결 & pstmt
			sql ="select r.rsrv_no, r.rsrv_name,r. rsrv_phone,r.status,r.rsrv_msg,s.store_name, r.menu_no, r.menu_amount,r.rsrv_date "
					+ "from bobjo_reservation r join bobjo_store s on (r.store_no = s.store_no) "
					+ "where r.m_id =?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			

			// 4. SQL 실행
			  rs = pstmt.executeQuery();
			  
			// 5. 데이터 처리
			 while(rs.next()) {
				 List subList = new ArrayList();
				 ReservationDTO dto = new ReservationDTO();
				 StoreDTO sdto = new StoreDTO();
				 dto.setRsrv_no(rs.getInt("rsrv_no"));
				 dto.setRsrv_name(rs.getString("rsrv_name"));
				 dto.setRsrv_phone(rs.getString("rsrv_phone"));
				 dto.setStatus(rs.getString("status"));
				 dto.setRsrv_msg(rs.getString("rsrv_msg"));
				 dto.setRsrv_date(rs.getTimestamp("rsrv_date"));
				 
				 sdto.setStore_name(rs.getString("store_name"));
				 
				 subList.add(dto);
				 subList.add(sdto);
				 subList.add(rs.getString("menu_no")); // 메뉴이름1,메뉴이름1,메뉴이름1
				 subList.add(rs.getString("menu_amount"));
				 
				 totalList.add(subList);
			 }

			 
			 System.out.println(" DAO : 예약 정보 불러오기완료");
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		   return totalList;
	   }
    // 예약정보 불러오기 - getMemberBookList()   
	   
	 //아이디 중복확인 - loginMember(dto)
	   public int isDup(String m_id) {
	   	try {
	   		// 1.2. 디비연결
	   		con = ConnectionManager.getConnection();
	   		
	   		// 3. sql 작성 & pstmt 객체
	   		sql = "select count(*) from bobjo_member where m_id=?";
	   		pstmt = con.prepareStatement(sql);
	   		pstmt.setString(1, m_id);
	   		
	   		// 4. sql 실행
	   		rs = pstmt.executeQuery();
	   		rs.next();
	   		return rs.getInt(1);
	   	} catch (Exception e) {
	   		e.printStackTrace();
	   	}finally {
	   		ConnectionManager.closeConnection(rs, pstmt, con);
	   	}
	   	return 1;
	   }
	   //아이디 중복확인 - loginMember(dto)
	   
	   
	   // 예약한 갯수 정보 확인 - countMember
	   public int countMember(String m_id) {
		      int cnt =0;
		   try {
			   // 1.2. 디비연결
			con = ConnectionManager.getConnection();
			
			// 3. sql 작성 & pstmt 객체
			sql ="select count(*) from bobjo_reservation where m_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, m_id);
			
			// 4. sql 실행
			rs = pstmt.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()) {
				cnt = rs.getInt(1);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		 }  
		   return cnt;
	   }
	   // 예약한 갯수 정보 확인 - countMember
	   
	   // 예약 취소 - cancelMember
	      public void cancelMember(int rsrv_no) {
	    	  
	    	  try {
	    		  // 1.2. 디비연결
				con = ConnectionManager.getConnection();
				
				// 3. sql 작성 & pstmt 객체
				sql ="delete from bobjo_reservation where rsrv_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, rsrv_no);
				
				// 4. sql 실행
			    pstmt.executeUpdate();
				
				System.out.println("DAO : 예약 취소 완료!");
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}  
	      }  
	       // 예약 취소 - cancelMember	
	      
	      // 내가 작성한 리뷰확인 - reviewMember
	        public List reviewMemberList(String m_id) {
	        	List totalList = new ArrayList();
	        	
	        	try {
	        		//1.2. 디비연결
	        		con = ConnectionManager.getConnection();
					
					// 3. sql 작성 & pstmt객체
					sql ="select r.review_no,r.content,s.store_name from bobjo_review r join bobjo_store s "
							+ "on (r.store_no = s.store_no) where r.m_id =?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, m_id);
					
					// 4. SQL 실행
					  rs = pstmt.executeQuery();
					  
					// 5. 데이터 처리
					 while(rs.next()) {
						 List subList = new ArrayList();
						 ReviewDTO dto = new ReviewDTO();
						 StoreDTO sdto = new StoreDTO();
						 
						 dto.setReview_no(rs.getInt("review_no"));
						 dto.setContent(rs.getString("content"));
						 
						 sdto.setStore_name(rs.getString("store_name"));
						 
						 subList.add(dto);
						 subList.add(sdto);
						 
						 totalList.add(subList);		 
					 }
					 System.out.println(" DAO : 내가 작성한 리뷰확인 완료!");
					 
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.closeConnection(rs, pstmt, con);
				}
	        	return totalList;
	        }
	      // 내가 작성한 리뷰확인 - reviewMember
	        
	        // 리뷰 삭제 - deleteReviewMember
		      public void deleteReviewMember(int review_no) {
		    	  
		    	  try {
		    		  // 1.2. 디비연결
					con = ConnectionManager.getConnection();
					
					// 3. sql 작성 & pstmt 객체
					sql ="delete from bobjo_review where review_no=?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, review_no);
					
					// 4. sql 실행
				    pstmt.executeUpdate();
					
					System.out.println("DAO : 리뷰 삭제 완료!");
					
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					ConnectionManager.closeConnection(rs, pstmt, con);
				}  
		      }  
		       // 리뷰 삭제 - deleteReviewMember	  



}

