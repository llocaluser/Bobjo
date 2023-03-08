package com.bobjo.utils.test;

import java.io.IOException;

public class TestMain {

	public static void main(String[] args) throws IOException {
		GwangjinguCSV csv1 = new GwangjinguCSV("C:\\workspace_jsp6\\BOBJO\\src\\main\\java\\com\\bobjo\\utils\\test\\광진구.csv");
		csv1.insertFile();
//		SeochoguCSV csv2 = new SeochoguCSV();
	}
	
}
