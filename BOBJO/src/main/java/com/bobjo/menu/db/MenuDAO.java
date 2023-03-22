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
	
}	