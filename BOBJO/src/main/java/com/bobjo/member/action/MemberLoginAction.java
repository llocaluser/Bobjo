package com.bobjo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;
import com.bobjo.member.db.MemberDTO;

public class MemberLoginAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 한글처리 - 필터
		
		// 전달정보 저장
		MemberDTO dto = new MemberDTO();
		dto.setM_id(request.getParameter("m_id"));
        dto.setPw(request.getParameter("pw")); 
        
        System.out.println("M :"+ dto);
        
        // DAO 객체 - 로그인 호출
        MemberDAO dao = new MemberDAO();
        int result = dao.loginMember(dto);
        
     // 호출결과에 따른 페이지 이동(JS사용)
     	if(result == 0) { // 비밀번호 오류
     		System.out.println(" M : JS-페이지 이동(컨트롤러 X) ");
     		response.setContentType("text/html; charset=UTF-8");
     		PrintWriter out = response.getWriter();
     			
     		out.write("<script>");
     		out.write("  alert('비밀번호 오류!'); ");
     		out.write("  history.back(); ");
     		out.write("</script>");
     		out.close();
     		return null;	// 자바스크립트로만 이동, 컨트롤러에서는 이동 X		
     	}
     	if(result == -1) { // 회원정보 없음
     		System.out.println(" M : JS-페이지 이동(컨트롤러 X) ");
     		response.setContentType("text/html; charset=UTF-8");
     		PrintWriter out = response.getWriter();
     			
     		out.write("<script>");
     		out.write("  alert('회원정보 없음!'); ");
     	    out.write("  history.back(); ");
     		out.write("</script>");
     		out.close();
     		return null;	// 자바스크립트로만 이동, 컨트롤러에서는 이동 X	
     	}
     		// result == 1 // 로그인 성공
     		
     	// 로그인 성공 => 로그인정보 저장(세션객체)
     	  HttpSession session = request.getSession();
     	  session.setAttribute("m_id", dto.getM_id());
     			
     	// main페이지 이동티켓
     	 ActionForward forward = new ActionForward();
     	 forward.setPath("./Main.me");
     	 forward.setRedirect(true);		
     		
     	return forward;
	}

}
