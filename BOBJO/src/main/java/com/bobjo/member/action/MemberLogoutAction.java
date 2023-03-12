package com.bobjo.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;

public class MemberLogoutAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 세션제어
		HttpSession session = request.getSession();
		session.invalidate();
		
		// 2. 컨트롤러 사용 X (JS)
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				
			out.write("<script>");
			out.write(" alert('로그아웃 성공!'); ");
			out.write(" location.href='./Main.me'; ");
			out.write("</script>");
			out.close();		
				
			return null;
	}

}
