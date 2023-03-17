package com.bobjo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.member.db.MemberDAO;
import com.bobjo.member.db.MemberDTO;

public class MemberUpdateProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 세션제어
		 HttpSession session = request.getSession();
		 String m_id = (String) session.getAttribute("m_id");
						
		 ActionForward forward = new ActionForward();
		 if(m_id == null) {
		 forward.setPath("./MemberLogin.me");
		 forward.setRedirect(true);
		 return forward;
	}
		
		// 전달된 정보 저장(수정할 정보)
			MemberDTO dto = new MemberDTO();
        	dto.setM_id(m_id);
        	dto.setPw(request.getParameter("pw"));
			dto.setPhone(request.getParameter("phone"));
			dto.setNickname(request.getParameter("nickname"));
			dto.setEmail(request.getParameter("email"));
			dto.setAlcohol_level(request.getParameter("alcohol_level"));
			
			// DAO 객체  - 회원정보 수정()
			MemberDAO dao = new MemberDAO();
			int result = dao.updateMember(dto);
			
			// 페이지 이동(JS)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			
			if(result == 0) {
				out.println("<script>");
				out.println(" alert('비밀번호 오류'); ");
				out.println(" history.back(); ");
				out.println("</script>");
				out.close();
				return null;			
			}
			
			if(result == -1) {
				out.println("<script>");
			    out.println(" alert(' 아이디없음 오류'); ");
				out.println(" history.back(); ");
				out.println("</script>");
				out.close();
				return null;
			}	
			
			out.println("<script>");
			out.println(" alert(' 수정완료! '); ");
			out.println(" location.href='./MemberMypage.me'; ");
			out.println("</script>");
			out.close();
			
			return null;
		}

	}