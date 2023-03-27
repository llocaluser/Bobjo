package com.bobjo.review.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.review.db.ReviewDAO;

public class ReviewRegformAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String store_no = request.getParameter("store_no");
		request.setAttribute("store_no", store_no);
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		//리뷰 작성권한 확인
		if(!new ReviewDAO().canRegReview(id, Integer.parseInt(store_no))) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.write("<script>");
			out.write(" alert('방문 1회당 1번만 리뷰를 등록할 수 있습니다 '); ");
			out.write(" history.back(); ");
			out.write("</script>");
			out.close();
			return null;
		}
		//리뷰 작성권한 확인
		
		forward.setPath("./review/reviewReg.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
