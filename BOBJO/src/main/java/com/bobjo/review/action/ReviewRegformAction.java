package com.bobjo.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;

public class ReviewRegformAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String store_no = request.getParameter("store_no");
		request.setAttribute("store_no", store_no);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./review/reviewReg.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
