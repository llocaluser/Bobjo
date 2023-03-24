package com.bobjo.admin.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.controller.BasicFrontController;
import com.bobjo.member.action.MainAction;

@WebServlet("*.ad")
public class AdminFrontController extends BasicFrontController {

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/AdminMyPage.ad")) {
			System.out.println(" C : AdminMyPage.ad 호출 ");
			
			action = new AdminMyPageAction();
	    	try {
	    		forward = action.execute(request, response);
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
		}
		
	}

}
