package com.bobjo.menu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.menu.db.MenuDAO;
import com.bobjo.menu.db.MenuDTO;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;

public class StoreMenuAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
/*		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");*/
		System.out.println(" M :  StoreMenuAction_execute() 호출! ");
		
		
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		
		System.out.println(store_no);
		MenuDAO dao = new MenuDAO();
		List<MenuDTO> menuList = dao.getMenuList(store_no);
		
		
		
		request.setAttribute("menuList", menuList);
		
		
		System.out.println(menuList);
		
		
		// DAO - 특정 상품의 정보를 가져오기
				// request 영역에 저장
				StoreDAO dao1 = new StoreDAO();
				
				StoreDTO dto = dao1.getStore(store_no);
				dto.setStore_no(store_no);
				request.setAttribute("dto",dto);
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./menu/storemenu.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
