package com.bobjo.store.action;

import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;

public class StoreListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		int pageNum = 1;
		int pageSize = 12;
		String[] srch_data = new String[4];
		srch_data[0] = request.getParameter("srch_location") == null ? "" : request.getParameter("srch_location");
		srch_data[1] = request.getParameter("srch_category") == null ? "" : request.getParameter("srch_category");
		srch_data[2] = request.getParameter("srch_text") == null ? "" : request.getParameter("srch_text");
		srch_data[3] = request.getParameter("order_standard") == null ? "" : request.getParameter("order_standard");
		
		
		StoreDAO dao = new StoreDAO();
		request.setAttribute("list",  dao.getStoreList(pageNum, pageSize, srch_data));
		request.setAttribute("totalPage", dao.getTotalPage(srch_data, pageSize));
		request.setAttribute("srch_location", srch_data[0]);
		request.setAttribute("srch_category", srch_data[1]);
		request.setAttribute("srch_text", srch_data[2]);
		request.setAttribute("order_standard", srch_data[3]);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/storeList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
