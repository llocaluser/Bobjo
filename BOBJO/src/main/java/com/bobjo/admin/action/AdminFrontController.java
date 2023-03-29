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
		else if(command.equals("/GenerateNewPw.ad")) {
			System.out.println(" C : GenerateNewPw.ad 호출 ");
			
			action = new GenerateNewPwAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/LoadMemberTable.ad")) {
			System.out.println(" C : LoadMemberTable.ad 호출 ");
			
			action = new LoadMemberTableAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/DeleteMember.ad")) {
			System.out.println(" C : DeleteMember.ad 호출 ");
			
			action = new DeleteMemberAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/UpdateMember.ad")) {
			System.out.println(" C : UpdateMember.ad 호출 ");
			
			action = new UpdateMemberAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
