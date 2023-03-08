package com.bobjo.samples.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.samples.db.SampleDAO;
import com.bobjo.samples.db.SampleDTO;

public class SampleTest2Action implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		SampleDTO dto = new SampleDTO();
		dto.setSampleId(request.getParameter("sampleid"));
		
		SampleDAO dao = new SampleDAO();
		dao.insertSample(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./SampleTest3.sa");
		forward.setRedirect(true);
		return forward;
	}

}
