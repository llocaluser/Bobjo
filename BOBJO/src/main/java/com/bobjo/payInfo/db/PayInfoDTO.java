package com.bobjo.payInfo.db;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PayInfoDTO {
	private int pay_no;
	private String m_p_id;
	private String m_c_id;
	private Timestamp pay_date;
	private int price;
	private String pay_type;
	private char cancel;
}
