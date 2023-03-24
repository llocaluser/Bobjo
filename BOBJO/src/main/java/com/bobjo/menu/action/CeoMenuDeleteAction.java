package com.bobjo.menu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.menu.db.MenuDAO;
import com.bobjo.store.db.StoreDAO;

public class CeoMenuDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 전달된 정보 menu_no
		int menu_no = Integer.parseInt(request.getParameter("menu_no"));
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		// DAO 객체 생성 - 메뉴정보 삭제 메서드
		MenuDAO dao = new MenuDAO();
		dao.deleteMenu(menu_no);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./CeoMenuList.nu?store_no="+store_no);
		forward.setRedirect(true);
		
		return forward;
	}

}
