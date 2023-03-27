package com.bobjo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;
import com.bobjo.member.db.MemberDTO;

public class MemberDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 세션제어
		 HttpSession session = request.getSession();
		 String m_id = (String) session.getAttribute("m_id");
		 session.invalidate();
						
		 ActionForward forward = new ActionForward();
		 if(m_id == null) {
		 forward.setPath("./MemberLogin.me");
		 forward.setRedirect(true);
		 return forward;
	}
		
		MemberDTO dto = new MemberDTO();
		dto.setM_id(request.getParameter("m_id"));
		dto.setPw(request.getParameter("pw"));
		
		MemberDAO dao = new MemberDAO();
		int rs = dao.deleteMember(dto);
		
		// 페이지 이동(JS)
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		if(rs == 0) {
		    out = response.getWriter();
              
			out.write("<script>");
			out.write("  alert('비밀번호 오류!'); ");
			out.write("  history.back(); ");
			out.write("</script>");
			out.close();

			return null;
		}
//		if (rs == 1) {
//			response.setContentType("text/html; charset=UTF-8");
//			PrintWriter out = response.getWriter();
//
//			out.write("<script>");
//			out.write("  alert('회원탈퇴 완료!'); ");
//			out.write("  location.href='./Main.me'; ");
//			out.write("</script>");
//			out.close();
//			return null;
//	     }
		
		out.println("<script>");
		out.println(" alert(' 회원탈퇴 완료! '); ");
		out.println(" location.href='./Main.me'; ");
		out.println("</script>");
		out.close();
		
		return null;
	}
	   
		
		
		
		
		/*
		 * request.setAttribute("dto", dto); 
		 * forward.setPath("./main/main.jsp");
		 * forward.setRedirect(false);
		 */
	
}
