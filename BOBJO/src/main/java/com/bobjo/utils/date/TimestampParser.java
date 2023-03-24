package com.bobjo.utils.date;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class TimestampParser {

	/**
	 * @param dateStr yyyy-MM-dd HH:mm
	 * @return Timestamp
	 */
	public static Timestamp stringToTimestamp(String dateStr) {
		Timestamp datetime = null;
		
		try {
			datetime = new Timestamp( new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(dateStr).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return datetime;
	}
	
	/**
	 * @param dateStr1 yyyy-MM-dd
	 * @param dateStr2 HH:mm
	 * @return Timestamp
	 */
	public static Timestamp stringToTimestamp(String dateStr1, String dateStr2) {
		Timestamp datetime = null;
		
		try {
			datetime = new Timestamp( new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(dateStr1+" "+dateStr2).getTime());
		} catch (ParseException e) {
			e.printStackTrace();
		}

		return datetime;
	}
	
}
