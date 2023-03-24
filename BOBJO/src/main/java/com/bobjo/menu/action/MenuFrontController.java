package com.bobjo.menu.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.nu")
public class MenuFrontController extends BasicFrontController {

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/StoreMenu.nu")) {
			action = new StoreMenuAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoMenuAdd.nu")) {
			forward = new ActionForward();
			request.setAttribute("store_no", request.getParameter("store_no"));
			forward.setPath("./ceo/ceoMenuAdd.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/CeoMenuAddAction.nu")) {
			action = new CeoMenuAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoMenuList.nu")) {
			action = new CeoMenuListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
					
		}
		else if(command.equals("/CeoMenuDelete.nu")) {
			action = new CeoMenuDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoMenuUpdate.nu")) {
			action = new CeoMenuUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

	}

}
