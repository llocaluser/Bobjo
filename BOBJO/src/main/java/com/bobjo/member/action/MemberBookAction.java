package com.bobjo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;

public class MemberBookAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 세션제어
		 HttpSession session = request.getSession();
		 String m_id = (String) session.getAttribute("m_id");
				
		 ActionForward forward = new ActionForward();
		 if(m_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
		 
		 MemberDAO dao = new MemberDAO();
		 
		// request 영역 저장
		request.setAttribute("getMemberBookList", dao.getMemberBookList());
		
		//이동
		forward.setPath("./member/myBook.jsp");
		forward.setRedirect(false);		
		return forward;

	}	
}
