package com.bobjo.menu.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;

public class CeoMenuAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  " + classPath[classPath.length - 1] + "_execute() 호출! ");
		
		StoreDAO dao = new StoreDAO();
		List cStoreList = dao.CeoStoreList((String)request.getSession().getAttribute("m_id"));
		
		
		// request 영역에 저장
		request.setAttribute("cStoreList", cStoreList);
		if(request.getParameter("store_no") != null) {
			request.setAttribute("cdto", dao.getStore(Integer.parseInt(request.getParameter("store_no"))));
		}
		
	
		ActionForward forward = new ActionForward();
		forward.setPath("./ceo/ceoMenuAdd.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
