package com.bobjo.reservation.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.re")
public class ReservationFrontController extends BasicFrontController {

	@Override
	protected void setActionForward(String command, 
			HttpServletRequest request, HttpServletResponse response) {
	
	      if(command.equals("/ReservationAction.re")) {
			action = new ReservationAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
					
		}
		
		
	}

}
