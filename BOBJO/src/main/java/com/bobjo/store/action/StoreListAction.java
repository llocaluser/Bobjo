package com.bobjo.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;

public class StoreListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		String srch_location = request.getParameter("srch_location") == null ? "" : request.getParameter("srch_location");
		String srch_category = request.getParameter("srch_category") == null ? "" : request.getParameter("srch_category");
		String srch_text = request.getParameter("srch_text") == null ? "" : request.getParameter("srch_text");
		
		List list = new StoreDAO().getStoreList(srch_location, srch_category, srch_text);
		for(Object obj : list) {
			StoreDTO dto = (StoreDTO)obj;
			String[] addrTemp = dto.getAddr().split(" ");
			dto.setAddr(addrTemp[1]+" "+addrTemp[2]);
			if(dto.getStore_img() != null) {
				dto.setStore_img(dto.getStore_img().split(",")[0]);
			}
		}
		
		request.setAttribute("list", list);
		request.setAttribute("srch_location", srch_location);
		request.setAttribute("srch_category", srch_category);
		request.setAttribute("srch_text", srch_text);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/storeList.jsp");
		forward.setRedirect(false);
		return forward;
	}
	
//	private String arrayToString(String[] arr) {
//		String result = null;
//		
//		if(arr != null) {
//			StringBuilder tmp = new StringBuilder();
//			for(String s : arr) {
//				tmp.append("'");
//				tmp.append(s);
//				tmp.append("'");
//				tmp.append(",");
//			}
//			tmp.deleteCharAt(tmp.length()-1);
//			result = tmp.toString();
//		}
//		
//		return result;
//	}

}
