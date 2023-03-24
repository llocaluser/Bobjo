package com.bobjo.utils.test;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

import com.bobjo.store.db.StoreDTO;

public class EnpyungguCSV extends StoreCSV{
	
	public EnpyungguCSV(String filePath) {
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
			if(data.length > 7) continue;
			StoreDTO dto = new StoreDTO();
			dto.setStore_category(data[6]);
			dto.setStore_name(data[1]);
			try {
				dto.setAddr("서울특별시 은평구 " + data[2].split(" ")[2]);
			}catch (Exception e) {
				continue;
			}
			String addrDetailts = "";
			String[] addArr = data[2].split(" ");
			for(int i=3; i<addArr.length; i++) {
				addrDetailts += addArr[i] + " ";
			}
			dto.setAddr_details(addrDetailts.trim());
			dto.setTel(getUKPhoneNumber());
			dto.setOpen("9:00");
			dto.setClose("21:00");
			dto.setTotal_tables(100);
			dto.setStore_content(data[0]);
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