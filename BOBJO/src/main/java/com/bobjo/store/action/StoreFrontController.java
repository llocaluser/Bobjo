package com.bobjo.store.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
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
		else if(command.equals("/StoreListAjax.st")) {
			action = new StoreListAjaxAction();
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
		else if (command.equals("/StoreImg.st")) {
			action = new StoreImgAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoAddStore.st")) {
			// 패턴1
			forward = new ActionForward();
			forward.setPath("./ceo/ceoAddStore.jsp");
			forward.setRedirect(false);
		}
		else if(command.equals("/CeoAddStoreAction.st")) {
			action = new CeoAddStoreAction();
			try{
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoStoreList.st")) {
			action = new CeoStoreListAction();
			try{
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoStoreUpdate.st")) {
			action = new CeoStoreUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/CeoStoreDelete.st")) {
			action = new CeoStoreDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
				
		
				
				
		
		
	}

}
