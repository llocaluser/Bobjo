package com.bobjo.utils.test;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import com.bobjo.store.db.StoreDTO;

public class SeochoguCSV extends StoreCSV{
	
	public SeochoguCSV(String filePath) {
		super(filePath);
	}

	@Override
	public void insertFile() throws IOException {
		FileReader fr = new FileReader(filePath);
		BufferedReader br = new BufferedReader(fr);
		String tmp = null;
		CSVInsertor dao = new CSVInsertor();
		br.readLine();
		int imgNum = 0;
		while((tmp = br.readLine()) != null) {
			String[] data = tmp.split(",");
			if(data.length > 5) continue;
			StoreDTO dto = new StoreDTO();
			dto.setStore_category(data[3]);
			dto.setStore_name(data[1]);
			dto.setAddr("서울특별시 서초구 " + data[2].split(" ")[0]);
			String addrDetailts = "";
			String[] addArr = data[2].split(" ");
			for(int i=1; i<addArr.length; i++) {
				addrDetailts += addArr[i] + " ";
			}
			dto.setAddr_details(addrDetailts.trim());
			dto.setTel(getUKPhoneNumber());
			dto.setOpen("9:00");
			dto.setClose("21:00");
			dto.setTotal_tables(100);
			dto.setStore_content(data[4]);
			dto.setMax_rsrv((int)(Math.random()*9+2));
			dto.setExtra_info(getExtraInfo());
			imgNum %= 100;
			dto.setStore_img("res_img/restaurant"+ ++imgNum +".jpg");
			dto.setM_id("c_test");
			
			dao.insertStore(dto);
		}
		br.close();
	}

}
