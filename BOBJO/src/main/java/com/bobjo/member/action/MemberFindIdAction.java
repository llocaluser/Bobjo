package com.bobjo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;
import com.bobjo.member.db.MemberDTO;


public class MemberFindIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 전달정보 저장
		MemberDTO dto = new MemberDTO();
		dto.setM_name(request.getParameter("m_name"));
		dto.setEmail(request.getParameter("email"));
		
		// DAO 객체 - 로그인 호출
        MemberDAO dao = new MemberDAO();

	   return null;
		
	

	}

}
