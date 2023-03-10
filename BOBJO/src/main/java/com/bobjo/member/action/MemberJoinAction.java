package com.bobjo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;
import com.bobjo.member.db.MemberDTO;

public class MemberJoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M :/MemberJoinAction_execute() 호출");
		
		
		
		// 한글처리 - 필터
		
		// 전달정보 저장(파라미터)
		// MemberDTO 객체 생성 -> 정보 저장(확인)
		
		 MemberDTO dto = new MemberDTO();
		 
		  dto.setM_id(request.getParameter("m_id"));
		  dto.setPw(request.getParameter("pw")); 
		  dto.setM_name(request.getParameter("m_name"));
		  dto.setPhone(request.getParameter("phone"));
		  dto.setNickname(request.getParameter("nickname"));
		  dto.setEmail(request.getParameter("email"));
		  dto.setAlcohol_level(request.getParameter("alcohol_level"));
		
		  System.out.println("M :" + dto.toString());  
		  
		  // DB 저장
		  MemberDAO dao = new MemberDAO();
		  dao.insertMember(dto);
		
		// 로그인 페이지로 이동티켓 생성(직접이동x)
		 ActionForward forward = new ActionForward();
		 forward.setPath("./MemberLogin.me");
		 forward.setRedirect(true);	
			
		return forward;
	}

}
