package com.bobjo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;

public class IDDupCheckAjaxAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		request.setAttribute("flag", new MemberDAO().isDup(request.getParameter("m_id")));
		
		ActionForward forward = new ActionForward();
		forward.setPath("./member/idDupAjax.jsp");
		forward.setRedirect(false);		
		return forward;
	}

}
