package com.bobjo.payInfo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
import com.bobjo.basicform.controller.BasicFrontController;

public class PayFrontController extends BasicFrontController{

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/Pay.pa")) {
			System.out.println("C :"+command+" 호출");
			request.setAttribute("rsrv_no", request.getParameter("rsrv_no"));
			request.setAttribute("price", request.getParameter("price"));
			request.setAttribute("store_no", request.getParameter("store_no"));
			forward = new ActionForward();
			forward.setPath("./pay/pay.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/PayAdd.pa")) {
			System.out.println("C :"+command+" 호출");
			action = new PayAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
