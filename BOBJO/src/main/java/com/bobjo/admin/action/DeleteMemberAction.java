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
		
		int result = dao.deleteMember(id);
		
		if(result > 0) {
			response.setStatus(HttpServletResponse.SC_OK);
		} else {
			throw new DeleteMemberException("삭제 실패");
		}
		
		return null;
	}

}

class DeleteMemberException extends Exception{

	public DeleteMemberException(String string) {
		super(string);
	}
	
}
