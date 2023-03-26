package com.bobjo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.admin.db.AdminDAO;
import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;

public class DeleteMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : DeleteMemberAction_execute 호출 ");
		
		AdminDAO dao = new AdminDAO();
		
		String id = request.getParameter("id");
		
		dao.deleteMember(id);
		
		return null;
	}

}
