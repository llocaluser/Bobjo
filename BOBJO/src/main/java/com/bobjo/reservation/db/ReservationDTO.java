package com.bobjo.reservation.db;

import java.sql.Date;

public class ReservationDTO {

	
	private int rsrv_no;
	private String m_id;
	private int store_no;
	private Date rsrv_date;     // 현재시각이 필요하므로 now()를 이용
	private String people_num;
	private Date reg_date;
	private int pay_no;
	private String status;
	private String rsrv_msg;
	private String menu_id;
	private int menu_amount;
	
		
	
	
}
