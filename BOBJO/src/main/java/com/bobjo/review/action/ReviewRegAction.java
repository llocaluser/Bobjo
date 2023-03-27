package com.bobjo.review.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.review.db.ReviewDAO;
import com.bobjo.review.db.ReviewDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ReviewRegAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		ActionForward forward = new ActionForward();
		if(id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		
		
		ReviewDAO dao = new ReviewDAO();
		ReviewDTO dto = new ReviewDTO();
		
		String savePath = request.getServletContext().getRealPath("img");
		 
		// 파일 크기 15MB로 제한
		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = 
				new MultipartRequest(request,
						savePath,
						sizeLimit,
						"utf-8",
						new DefaultFileRenamePolicy());
		
		
		dto.setM_id(id);
		int store_no = Integer.parseInt(multi.getParameter("store_no"));
		dto.setStore_no(store_no);
		dto.setContent(multi.getParameter("content"));
		dto.setScore(Float.parseFloat(multi.getParameter("score")));
		dto.setReview_img(multi.getFilesystemName("review_img"));
		
		dao.registerReview(dto);
		
		forward.setPath("./ReviewList.rv?store_no="+store_no);
		forward.setRedirect(true);
		return forward;
	}

}
