package com.bobjo.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;
import com.bobjo.member.db.MemberDTO;

public class MemberMypageAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 세션제어
		  HttpSession session = request.getSession();
		  String m_id = (String)session.getAttribute("m_id");
				
		  ActionForward forward = new ActionForward();
		  if(m_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;						
	}
		  
		   // DAO 객체 생성 - 회원정보 조회()
			MemberDAO dao = new MemberDAO();
			MemberDTO dto = dao.getMemberInfo(m_id);
			int count = dao.countMember(m_id);
			
			
		// DB에서 가져온 DTO정보를 request 영역에 저장
			request.setAttribute("dto", dto);
			request.setAttribute("count", count);
			
		// 페이지 이동 -> 출력
			forward.setPath("./member/myPage.jsp");
			forward.setRedirect(false);
			
			return forward;
		}
}
