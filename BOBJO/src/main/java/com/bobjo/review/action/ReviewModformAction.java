package com.bobjo.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.review.db.ReviewDTO;

public class ReviewModformAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String temp = request.getParameter("list");
		temp = temp.substring(10).replaceAll("\\)", "");
        String[] arr = temp.split(", ");
        
        String store_no = request.getParameter("store_no");
		request.setAttribute("store_no", store_no);
		request.setAttribute("review_no", arr[0].split("=")[1]);
        request.setAttribute("content", arr[3].split("=")[1]);
        request.setAttribute("score", arr[5].split("=")[1]);
        request.setAttribute("review_img", arr[6].split("=")[1]);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./review/reviewMod.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
