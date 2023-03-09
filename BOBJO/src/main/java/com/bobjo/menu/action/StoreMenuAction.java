package com.bobjo.menu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDTO;

public class StoreMenuAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		StoreDTO dto = new StoreDTO();
		dto.setStore_no(Integer.parseInt(request.getParameter("store_no")));
		
		int menu_no = Integer.parseInt(request.getParameter("menu_no"));
		
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./menu/storemenu.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
