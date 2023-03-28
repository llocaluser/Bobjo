package com.bobjo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;

public class AdminMyPageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : AdminMyPageAction_execute 호출 ");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("m_id");
		if(id == null) id = "";
		
		ActionForward forward = new ActionForward();
		
		if(!id.equals("admin")) {
			forward.setPath("./Main.me");
			forward.setRedirect(true);
			return forward;
		}
		
		id = "admin";
		
		MemberDAO mdao = new MemberDAO();
		request.setAttribute("Info", mdao.getMemberInfo(id));
		
		
		
		forward.setPath("./admin/AdminMyPage.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
