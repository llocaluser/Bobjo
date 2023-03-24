package com.bobjo.reservation.db;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReservationDTO {

	private int rsrv_no;
	private String m_id;
	private String rsrv_name;
	private String rsrv_phone;
	private int store_no;
	private Timestamp rsrv_date;    // 고객이 예약한 시각 
	private int people_num;
	private Timestamp reg_date; // 예약이 등록된 시각 - 현재시각이 필요하므로 now()를 이용
	private int pay_no;
	private String status;
	private String rsrv_msg;
	private String menu_no;
	private String menu_amount;
	
}