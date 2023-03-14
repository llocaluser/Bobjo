package com.bobjo.review.db;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewDTO {
	private int review_no;
	private String m_id;
	private int store_no;
	private String content;
	private Date reg_date;
	private float score;
	private String review_img;
}
