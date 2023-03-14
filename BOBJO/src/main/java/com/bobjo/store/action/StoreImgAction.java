package com.bobjo.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;

public class StoreImgAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		
		StoreDAO dao = new StoreDAO();
		
		StoreDTO dto = dao.getImg(store_no);
		dto.setStore_no(store_no);
		request.setAttribute("dto",dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/storeimg.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}