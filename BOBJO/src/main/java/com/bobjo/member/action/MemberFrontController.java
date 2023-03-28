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
//	    else if(command.equals("/Main.me")) {
//	    	System.out.println("Main.me 호출");
//	    	
//	    	// 패턴1
//	    	forward = new ActionForward();
//			forward.setPath("./main/main.jsp");
//			forward.setRedirect(false);
//	    }
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
	      
	      // 패턴3
	      action = new MemberMypageAction();
	      try {
			forward = action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}  
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
	    else if(command.equals("/MemberUpdateAction.me")) {
	    	System.out.println("MemberUpdateAction.me 호출 ");
	    	
	    	// 패턴3
	    	action = new MemberUpdateAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    else if(command.equals("/MemberUpdateProAction.me")) {
	    	System.out.println("MemberUpdateProAction.me 호출");
	    	
	    	// 패턴2
	    	action = new MemberUpdateProAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    else if(command.equals("/MemberFindid.me")) {
	    	System.out.println("MemberFindid.me 호출");
	    	
	    	// 패턴1
			forward = new ActionForward();
			forward.setPath("./member/findidMember.jsp");
			forward.setRedirect(false);
	  }
	    else if(command.equals("/MemberFindidAction.me")) {
	    	System.out.println("MemberFindidAction.me 호출");
	    	
	    	// 패턴3
	    	action = new MemberFindIdAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
		
//		Main.me 수정
	    else if(command.equals("/Main.me")) {
	    	System.out.println("Main.me 호출");
	    	
//	    패턴1
	    	action = new MainAction();
	    	try {
	    		forward = action.execute(request, response);
	    	} catch (Exception e) {
	    		e.printStackTrace();
	    	}
	    }
	    else if(command.equals("/MemberFindpw.me"))	{
	    	System.out.println("./MemberFindpw.me 호출");
	    	
	    	// 패턴1
	    	forward = new ActionForward();
	    	forward.setPath("./member/findpwMember.jsp");
	    	forward.setRedirect(false);
	    }
	    else if(command.equals("/MemberFindpwAction.me")) {
	    	System.out.println("/MemberFindpwAction.me 호출");
	    	
	    	// 패턴3
	    	action = new MemberFindpwAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    else if(command.equals("/MemberBook.me")) {
	    	System.out.println("/MemberBook.me 호출");
	    	
	    	//패턴3
	    	action = new MemberBookAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }else if(command.equals("/IDDupCheckAjax.me")) {
	    	System.out.println("/IDDupCheckAjax.me 호출");
	    	
	    	action = new IDDupCheckAjaxAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    else if(command.equals("/MemberCancel.me")) {
	    	System.out.println("/MemberCancel.me 호출");
	    	
	    	action = new MemberCancelAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	    else if(command.equals("/MemberReview.me")) {
	    	System.out.println("/MemberReview.me 호출");
	    	
	    	action = new MemberReviewAction();
	    	try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}	
	    }
	    else if(command.equals("/MemberdelReview.me")) {
	    	System.out.println("/MemberdelReview.me 호출");
	    	
	        action = new MemberdelReviewAction();
	        try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
	    }
	
	
	
	}
}
