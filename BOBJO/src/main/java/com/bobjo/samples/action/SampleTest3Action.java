package com.bobjo.samples.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.samples.db.SampleDAO;

public class SampleTest3Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ActionForward forward = new ActionForward();
//		if(id == null) {
//			forward.setPath("./Main.me");
//			forward.setRedirect(true);
//			return forward;						
//		}
		
		SampleDAO dao = new SampleDAO();
		List list = dao.getSampleList();
		
		request.setAttribute("list", list);
		
		
		forward.setPath("./samples/sample3.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
