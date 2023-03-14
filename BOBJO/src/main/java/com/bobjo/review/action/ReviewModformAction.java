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
		
        request.setAttribute("content", arr[3].split("=")[1]);
        request.setAttribute("score", arr[5].split("=")[1]);
        request.setAttribute("img", arr[6].split("=")[1]);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./review/reviewMod.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
