package com.bobjo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;

public class MemberdelReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 전달된 정보
		int review_no = Integer.parseInt(request.getParameter("review_no"));	
		
		// dao 메서드 삭제
		MemberDAO dao = new MemberDAO();
		dao.deleteReviewMember(review_no);
		
		 ActionForward forward = new ActionForward();
		 forward.setPath("./MemberReview.me");
		 forward.setRedirect(true);
				
		 return forward;
		
		}

}
