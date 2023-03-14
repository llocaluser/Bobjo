package com.bobjo.store.db;

import lombok.Data;

@Data
public class StoreDTO {
	private int store_no;
	private String store_name;
	private String addr;
	private String addr_details;
	private String tel;
	private String open;
	private String close;
	private int total_tables;
	private int max_rsrv;
	private String extra_info;
	private String store_content;
	private String store_img;
	private String refund_policy;
	private String store_category;
	private String m_id;
	
	private double score;
	private int minPrice;
	private int maxPrice;
	
}
