package com.bobjo.store.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.st")
public class StoreFrontController extends BasicFrontController {

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/StoreList.st")) {
			action = new StoreListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/StoreInfo.st")) {
			action = new StoreInfoAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}

}
