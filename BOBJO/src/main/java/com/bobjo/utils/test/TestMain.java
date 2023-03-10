package com.bobjo.utils.test;

import java.io.IOException;

public class TestMain {

	public static void main(String[] args) throws IOException {
		String path = "C:\\Users\\ITWILL\\git\\Bobjo\\BOBJO\\src\\main\\java\\com\\bobjo\\utils\\test\\";
		GwangjinguCSV csv1 = new GwangjinguCSV(path+"광진구.csv");
		csv1.insertFile();
	}
	
}
