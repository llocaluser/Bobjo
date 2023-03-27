package com.bobjo.member.action;

import java.io.PrintWriter;

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
		  dto.setCeo_num(request.getParameter("ceo_num").equals("")?null:request.getParameter("ceo_num"));
		  
		  System.out.println("M :" + dto.toString());  
		  
		  // DB 저장
		  MemberDAO dao = new MemberDAO();
		  dao.insertMember(dto);
		  
		// 2. 컨트롤러 사용 X (JS)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
						
			out.write("<script>");
			out.write(" alert('회원가입 성공!'); ");
			out.write(" location.href='./MemberLogin.me'; ");
			out.write("</script>");
			out.close();		
						
			return null; 
		
//		// 로그인 페이지로 이동티켓 생성(직접이동x)
//		 ActionForward forward = new ActionForward();
//		 forward.setPath("./MemberLogin.me");
//		 forward.setRedirect(true);	
//			
//		return forward;
	}

}