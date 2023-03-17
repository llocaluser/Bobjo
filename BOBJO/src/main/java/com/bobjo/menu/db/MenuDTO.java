package com.bobjo.menu.db;

import lombok.Data;

@Data
public class MenuDTO {
	
	private int menu_no;
	private String menu_name;
	private int price;
	private String menu_info;
	private String menu_img;
	private int store_no;
	private String menu_category;
}	
