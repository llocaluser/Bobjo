package com.bobjo.menu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bobjo.store.db.StoreDTO;
import com.bobjo.utils.db.ConnectionManager;

public class MenuDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql = "";
	
	
	
	public List<MenuDTO> getMenuList(int store_no){
		List<MenuDTO> menuList = new ArrayList<MenuDTO>();		
		try {
			
		con = ConnectionManager.getConnection();
		sql="select * from bobjo_menu where store_no = ? ";
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, store_no);
		
		rs = pstmt.executeQuery();
		
		
		while(rs.next()){
		MenuDTO dto = new MenuDTO();
		dto.setMenu_no(rs.getInt("menu_no"));
		dto.setMenu_name(rs.getString("menu_name"));
		dto.setMenu_img(rs.getString("menu_img"));
		dto.setMenu_info(rs.getString("menu_info"));
	    dto.setPrice(rs.getInt("price"));
	    dto.setStore_no(store_no);
	    dto.setMenu_category(rs.getString("menu_category"));
	    menuList.add(dto);
		}
		
		
		System.out.println("M : 디비 정보 가져오기 성공");
		System.out.println(" DAO : "+menuList.size());
		} catch (Exception e) {
		System.out.println("M : 디비에 정보가 없습니다");
		/* 알림 창띄우기 */
		e.printStackTrace();
		} finally {
		ConnectionManager.closeConnection(rs, pstmt, con);
		}
		
		return menuList;
		}
	
	// 다빈 - 메뉴등록
	public void insertMenu(MenuDTO dto) {
		try {
			con = ConnectionManager.getConnection();
			
			sql = "insert into bobjo_menu values(default,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getMenu_name());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getMenu_info());
			pstmt.setString(4, dto.getMenu_img());
			pstmt.setInt(5, dto.getStore_no());
			pstmt.setString(6, dto.getMenu_category());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
	// 다빈 - 메뉴등록
	
	// 다빈 - 특정 메뉴 조회
	public MenuDTO getMenu(int menu_no) {
		MenuDTO dto = null;
		try {
			con = ConnectionManager.getConnection();
			sql = "select * from bobjo_menu where menu_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, menu_no);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				dto = new MenuDTO();

				dto.setMenu_no(rs.getInt("menu_no"));
				dto.setMenu_name(rs.getString("menu_name"));
				dto.setMenu_img(rs.getString("menu_img"));
				dto.setMenu_info(rs.getString("menu_info"));
				dto.setPrice(rs.getInt("price"));
				dto.setStore_no(rs.getInt("store_no"));
				dto.setMenu_category(rs.getString("menu_category"));
			}
			System.out.println(" DAO : 메뉴 정보 조회성공!");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
		return dto;
	}
	// 다빈 - 특정 메뉴 조회
	
	// 다빈 - 메뉴 삭제
	public void deleteMenu(int menu_no) {
		try {
			con = ConnectionManager.getConnection();
			sql = "delete from bobjo_menu where menu_no=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, menu_no);
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 메뉴 삭제 완료 !");
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
	
	// 메뉴 삭제
	
	// 다빈 - 메뉴 수정
	public void updateMenu(MenuDTO dto) {
		try {
			con = ConnectionManager.getConnection();
			sql = "update bobjo_menu set menu_name=?,price=?,menu_info=?,menu_img=?,menu_category=? "
					+ "where menu_no=?";
			pstmt = con.prepareStatement(sql);
			// ? 6개
			pstmt.setString(1, dto.getMenu_name());
			pstmt.setInt(2, dto.getPrice());
			pstmt.setString(3, dto.getMenu_info());
			pstmt.setString(4, dto.getMenu_img());
			pstmt.setString(5, dto.getMenu_category());
			pstmt.setInt(6, dto.getMenu_no());
			
			pstmt.executeUpdate();
			
			System.out.println(" DAO : 메뉴정보 수정완료!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			ConnectionManager.closeConnection(rs, pstmt, con);
		}
	}
	// 다빈 - 메뉴 수정

}	