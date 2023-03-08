package com.bobjo.utils.test;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.t")
public class TestCon extends BasicFrontController{

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/Test.t")) {
			forward = new ActionForward();
			forward.setPath("./store/searchTest.jsp");
			forward.setRedirect(false);
		}
	}

}
