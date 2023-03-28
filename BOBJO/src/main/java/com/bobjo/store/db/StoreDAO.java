package com.bobjo.store.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
	
	// 검색된 컨텐츠 수 조회
	/**
	 * 
	 * @param srch_data[0] == srch_location
	 * @param srch_data[1] == srch_category
	 * @param srch_data[2] == srch_text
	 * @return int
	 */
	public int getTotalPage(String[] srch_data, int pageSize) {
		int totalPage = 0;
		
		try {
			con = ConnectionManager.getConnection();
			
			StringBuilder sqlBuilder = new StringBuilder();
			sqlBuilder.append("select count(*) ");
			sqlBuilder.append("from bobjo_store ");
			sqlBuilder.append("where store_name like ? ");

			if(!srch_data[0].equals("")) {
				sqlBuilder.append("and substring_index(substring_index(addr,' ',2),' ',-1) = '");
				sqlBuilder.append(srch_data[0]);
				sqlBuilder.append("' ");
			}
			if(!srch_data[1].equals("")) {
				sqlBuilder.append("and store_category = '");
				sqlBuilder.append(srch_data[1]);
				sqlBuilder.append("' ");
			}
			
			pstmt = con.prepareStatement(sqlBuilder.toString());
			pstmt.setString(1, "%"+srch_data[2]+"%");

			rs = pstmt.executeQuery();
			rs.next();
			totalPage = rs.getInt(1)%pageSize == 0 ? rs.getInt(1)/pageSize : rs.getInt(1)/pageSize + 1;
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return totalPage;
	}
	// 검색된 컨텐츠 수 조회
	
	// 검색 리스트 조회
	/**
	 * 
	 * @param pageNum
	 * @param pageSize
	 * @param srch_data[0] == srch_location
	 * @param srch_data[1] == srch_category
	 * @param srch_data[2] == srch_text
	 * @param srch_data[3] == order_standard
	 * @return List
	 */
	public List getStoreList(int pageNum, int pageSize, String[] srch_data) {
		List list = new ArrayList<>();
		
		try {
			con = ConnectionManager.getConnection();
			
			StringBuilder sqlBuilder = new StringBuilder();
			sqlBuilder.append("select s.store_no,s.store_name,substring_index(s.addr,' ',2) addr,substring_index(s.store_img,',',1) store_img,s.store_category,r.score ");
			sqlBuilder.append("from bobjo_store s left join (select store_no, round(avg(score),1) score, count(*) cnt from bobjo_review group by store_no) r ");
			sqlBuilder.append("on s.store_no = r.store_no ");
			sqlBuilder.append("where s.store_name like ? ");

			if(!srch_data[0].equals("")) {
				sqlBuilder.append("and substring_index(substring_index(s.addr,' ',2),' ',-1) = '");
				sqlBuilder.append(srch_data[0]);
				sqlBuilder.append("' ");
			}
			if(!srch_data[1].equals("")) {
				sqlBuilder.append("and s.store_category = '");
				sqlBuilder.append(srch_data[1]);
				sqlBuilder.append("' ");
			}
			if(!srch_data[3].equals("")) {
				sqlBuilder.append("order by r.");
				sqlBuilder.append(srch_data[3]);
				sqlBuilder.append(" desc ");
			}
			
			sqlBuilder.append("limit ? offset ? ");
			
			pstmt = con.prepareStatement(sqlBuilder.toString());
			pstmt.setString(1, "%"+srch_data[2]+"%");
			pstmt.setInt(2, pageSize);
			pstmt.setInt(3, (pageNum-1)*pageSize);
			
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
	// 검색 리스트 조회
	
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
					
					dto.setStore_img(rs.getString("store_img"));
					dto.setStore_name(rs.getString("store_name"));
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
				sql = "select min(price), max(price) from bobjo_menu where store_no=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, store_no);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					dto.setMinPrice(rs.getInt(1));
					dto.setMaxPrice(rs.getInt(2));
				}

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				ConnectionManager.closeConnection(rs, pstmt, con);
			}
			return dto;
		}
		// 특정 가게 조회
		
		// 사진 보기
				public StoreDTO getImg(int store_no) {
					StoreDTO dto = null;
					try {
						con = ConnectionManager.getConnection();
						sql = "select store_img,store_no,store_name,addr,addr_details,tel,open,close,store_category "
								+ "  from bobjo_store where store_no =?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, store_no);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							dto = new StoreDTO();
							dto.setStore_img(rs.getString(1));
							
							dto.setStore_no(rs.getInt(2));
							dto.setStore_name(rs.getString(3));
							dto.setAddr(rs.getString(4));
							dto.setAddr_details(rs.getString(5));
							dto.setTel(rs.getString(6));
							dto.setOpen(rs.getString(7));
							dto.setClose(rs.getString(8));
							dto.setStore_category(rs.getString(9));
						}
						sql = "select min(price), max(price) from bobjo_menu where store_no=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, store_no);
						rs = pstmt.executeQuery();
						if (rs.next()) {
							dto.setMinPrice(rs.getInt(1));
							dto.setMaxPrice(rs.getInt(2));
						}
						System.out.println(" DAO : 상품 사진 조회 !");

					} catch (Exception e) {
						e.printStackTrace();
					} finally {
						ConnectionManager.closeConnection(rs, pstmt, con);
					}

					return dto;
				}
				// 사진 보기 

				// 다빈, 가게 목록 조회
				public List<StoreDTO> CeoStoreList(String id){
					List<StoreDTO> cStoreList = new ArrayList<>();
					try {
						// 1.2 디비 연결
						con = ConnectionManager.getConnection();
						// 3. sql 작성
						sql = "select * from bobjo_store where m_id=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, id);
						// 4. sql 실행
						rs = pstmt.executeQuery();
						// 5. 데이터 처리 (rs -> DTO -> List)
						while(rs.next()) {
							StoreDTO dto = new StoreDTO();
							dto.setStore_name(rs.getString("store_name"));
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
							dto.setStore_img(rs.getString("store_img"));
							
							cStoreList.add(dto);
						}
						System.out.println(" DAO : 상품목록 조회 성공! ");
		
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						ConnectionManager.closeConnection(rs, pstmt, con);
					}
					return cStoreList;
				}
				// 가게 수정 - 다빈
				public void updateStore(StoreDTO dto) {
					
					try {
						con = ConnectionManager.getConnection();
						sql = "update bobjo_store set store_name=?,addr=?,addr_details=?,tel=?,open=?,"
								+ " close=?,total_tables=?,max_rsrv=?,extra_info=?,store_content=?,"
								+ " store_img=?,refund_policy=?,store_category=?"
								+ "where store_no=?";
						pstmt = con.prepareStatement(sql);
						// ? 14개
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
						pstmt.setInt(14, dto.getStore_no());
						
						pstmt.executeUpdate();
						
						System.out.println(" DAO : 가게정보 수정완료!");
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						ConnectionManager.closeConnection(rs, pstmt, con);
					}
				}
				// 가게 수정 
				
				// 다빈 - 가게 삭제
				public void deleteStore(int store_no) {
					try {
						con = ConnectionManager.getConnection();
						sql = "delete from bobjo_store where store_no=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, store_no);
						pstmt.executeUpdate();
						
						System.out.println(" DAO : 가게 삭제 완료 !");
					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						ConnectionManager.closeConnection(rs, pstmt, con);
					}
				}
				
				// 가게 삭제
		
		
}