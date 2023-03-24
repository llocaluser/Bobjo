package com.bobjo.utils.test;

import java.io.IOException;

public class TestMain {

	public static void main(String[] args) throws IOException {
		TestMain tm = new TestMain();
//		tm.insertStore();
		
	}
	
	private void insertStore() throws IOException {
		String path = "C:\\Users\\ITWILL\\git\\Bobjo\\BOBJO\\src\\main\\java\\com\\bobjo\\utils\\test\\";
		new GwangjinguCSV(path+"광진구.csv").insertFile();
		new SeochoguCSV(path+"서초구.csv").insertFile();
		new YangcheonguCSV(path+"양천구.csv").insertFile();
		new EnpyungguCSV(path+"은평구.csv").insertFile();
		new JungrangguCSV(path+"중랑구.csv").insertFile();
	}
	
}
