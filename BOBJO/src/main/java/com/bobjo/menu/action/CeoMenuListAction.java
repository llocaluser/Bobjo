package com.bobjo.menu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.menu.db.MenuDAO;
import com.bobjo.store.db.StoreDAO;

public class CeoMenuListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		
		MenuDAO dao = new MenuDAO();
		List cMenuList = dao.getMenuList(store_no);
		
		request.setAttribute("cMenuList",cMenuList);
		if(request.getParameter("menu_no") != null) {
			request.setAttribute("cdto", dao.getMenu(Integer.parseInt(request.getParameter("menu_no"))));
		}
		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./ceo/ceoMenuList.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
