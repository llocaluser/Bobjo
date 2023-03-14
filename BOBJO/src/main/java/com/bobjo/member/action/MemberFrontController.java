package com.bobjo.member.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.me")
public class MemberFrontController extends BasicFrontController {

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/MemberJoin.me")) {			
			System.out.println("C :/MemberJoin.me 호출");
			
			// 패턴1
			forward = new ActionForward();
			forward.setPath("./member/insertMember.jsp");
			forward.setRedirect(false);
		}
		  else if(command.equals("/MemberJoinAction.me")) {
		     System.out.println("C :/MemberJoinAction.me 호출");
		  
		  action = new MemberJoinAction();
		  try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
	  }
	 }
	    else if(command.equals("/MemberLogin.me")) {
	       System.out.println("C : /MemberLogin.me 호출");
			  
	         // 패턴1
			forward = new ActionForward();
			forward.setPath("./member/loginMember.jsp");
			forward.setRedirect(false);
			  
	  }
	    else if(command.equals("/MemberLoginAction.me")) {
	    	 System.out.println("MemberLoginAction.me호출");
	    	 
	    	 // 패턴2
	    	 action = new MemberLoginAction();
	    	 try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}    	
	    }
	    else if(command.equals("/Main.me")) {
	    	System.out.println("Main.me 호출");
	    	
	    	// 패턴1
	    	forward = new ActionForward();
			forward.setPath("./main/main.jsp");
			forward.setRedirect(false);
	    }
	    else if(command.equals("/MemberLogoutAction.me")) {
	    	System.out.println("MemberLogoutAction.me");
	    	
	    	// 패턴2
	    	action = new MemberLogoutAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
		  }
	    } 	
	    else if(command.equals("/MemberMypage.me")) {
	      System.out.println("MemberMypage.me 호출");
	      
	      // 패턴1
	      forward = new ActionForward();
	      forward.setPath("./member/myPage.jsp");
	      forward.setRedirect(false);
	   }
	    else if(command.equals("/MemberDeleteAction.me")) {
	    	System.out.println("MemberDeleteAction.me 호출");
	    	
	    	//패턴3
	    	action = new MemberDeleteAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    else if(command.equals("/MemberDeleteProAction.me")) {
	    	System.out.println("MemberDeleteProAction.me 호출");
	    	
	    	// 패턴2
	    	action = new MemberDeleteProAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    	
	    }
		
		
		
	    	
	    }
	
	
	
	
	
	}
