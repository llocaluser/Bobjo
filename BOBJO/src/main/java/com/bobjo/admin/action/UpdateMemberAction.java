package com.bobjo.admin.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.admin.db.AdminDAO;
import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDTO;

public class UpdateMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : UpdateMemberAction_execute 호출 ");
	    
	    AdminDAO dao = new AdminDAO();
	    MemberDTO dto = new MemberDTO();
	    
	    dto.setM_id(request.getParameter("m_id"));
	    dto.setPw(request.getParameter("pw"));
	    dto.setM_name(request.getParameter("m_name"));
	    dto.setPhone(request.getParameter("phone"));
	    dto.setNickname(request.getParameter("nickname"));
	    dto.setEmail(request.getParameter("email"));
	    dto.setCeo_num(request.getParameter("ceo_num"));
	    dto.setPoint(Integer.parseInt(request.getParameter("point") == null ? "0" : request.getParameter("point")));
	    dto.setAlcohol_level(request.getParameter("alcohol_level"));
	    
	    dao.updateMember(dto);
		
		return null;
	}

}
