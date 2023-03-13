package com.bobjo.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;

public class StoreListAjaxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"))+1;
		int pageSize = 12;
		String[] srch_data = new String[4];
		srch_data[0] = request.getParameter("srch_location") == null ? "" : request.getParameter("srch_location");
		srch_data[1] = request.getParameter("srch_category") == null ? "" : request.getParameter("srch_category");
		srch_data[2] = request.getParameter("srch_text") == null ? "" : request.getParameter("srch_text");
		srch_data[3] = request.getParameter("order_standard") == null ? "" : request.getParameter("order_standard");
		
		request.setAttribute("list",  new StoreDAO().getStoreList(pageNum, pageSize, srch_data));

		ActionForward forward = new ActionForward();
		forward.setPath("./store/storeListAjax.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
