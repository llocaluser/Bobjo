package com.bobjo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.admin.db.AdminDAO;
import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;

public class GenerateNewPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println(" M : GenerateNewPwAction_execute 호출 ");
		
		
		String id = request.getParameter("m_id");
		
		AdminDAO dao = new AdminDAO();
		String pw = dao.generateNewPw(id)[0];
		String email = dao.generateNewPw(id)[1];
		
		response.setContentType("text/plain");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(pw + "|" + email);
		
		return null;
	}

}
