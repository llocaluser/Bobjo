package com.bobjo.utils.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public abstract class StoreCSV {
	protected String filePath;
	private List<String> extList;
	protected static int phone; 
	
	public StoreCSV(String filePath) {
		this.filePath = filePath;
	}
	
	public abstract void insertFile() throws IOException;
	
	protected final String getExtraInfo() {
		extList = new ArrayList<>();
		extList.add("노키즈존");
		extList.add("주차장");
		extList.add("흡연구역");
		int maxOption = (int)(Math.random()*4);
		String extraInfo = "";
		for(int i=0; i<maxOption; i++) {
			extraInfo += extList.remove(((int)(Math.random()*extList.size()))) + ",";
		}
		try {
			extraInfo.substring(0, extraInfo.length()-1);
		}catch (Exception e) {
			return null;
		}
		return extraInfo;
	}
	
	protected final String getUKPhoneNumber() {
		String result = "02-";
		phone++;
		if(phone < 10) result += "000"+phone;
		else if(phone < 100) result += "00"+phone;
		else if(phone < 1000) result += "0"+phone;	
		else result += phone;
		result += "-"+((int)(Math.random()*8999+1000));
		return result;
	}
}
