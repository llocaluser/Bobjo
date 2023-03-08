package com.bobjo.utils.test;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import com.bobjo.store.db.StoreDTO;

public class SeochoguCSV {
	private String filePath;
	
	public SeochoguCSV(String filePath) {
		this.filePath = filePath;
	}

	public void insertFile() throws IOException {
		FileReader fr = new FileReader(filePath);
		BufferedReader br = new BufferedReader(fr);
		String tmp = null;
		CSVInsertor dao = new CSVInsertor();
		br.readLine();
		while((tmp = br.readLine()) != null) {
			String[] data = tmp.split(",");
			if(data.length > 8) continue;
			StoreDTO dto = new StoreDTO();
			dto.setStore_category(data[0]);
			dto.setStore_name(data[1]);
			dto.setAddr(data[2]);
			dto.setAddr_details(data[3]);
			dto.setTel(data[4]);
			dto.setOpen("test open");
			dto.setClose("test close");
			int totalTable = (int)(Math.random()*200+10);
			dto.setTotal_tables(totalTable);
			dto.setMax_rsrv((int)(Math.random()*totalTable+1));
			dto.setStore_img("f-"+((int)(Math.random()*6+1))+".jpg");
			dto.setM_id("c_test");
			dao.insertStore(dto);
		}
		br.close();
	}
}
