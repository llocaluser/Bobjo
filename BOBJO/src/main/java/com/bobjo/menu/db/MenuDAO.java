package com.bobjo.menu.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.connector.Request;

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
	
}	
