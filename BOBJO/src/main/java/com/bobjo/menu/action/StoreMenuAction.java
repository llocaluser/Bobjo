package com.bobjo.menu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.menu.db.MenuDAO;
import com.bobjo.menu.db.MenuDTO;
import com.mysql.cj.Session;

public class StoreMenuAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
/*		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");*/
		System.out.println(" M :  StoreMenuAction_execute() 호출! ");
		
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		
		
		MenuDAO dao = new MenuDAO();
		List<MenuDTO> menuList = dao.getMenuList(store_no);
		
		
		
		request.setAttribute("menuList", menuList);
		
		
		System.out.println(menuList);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./menu/storemenu.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
