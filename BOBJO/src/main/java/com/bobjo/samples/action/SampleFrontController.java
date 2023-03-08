package com.bobjo.samples.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.ActionForward;
import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.sa")
public class SampleFrontController extends BasicFrontController{

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {
		
		if(command.equals("/SampleTest1.sa")) {
			System.out.println(" C : /SampleTest1.sa 호출 ");
			System.out.println(" C : DB동작 X, view O");
			// 패턴 1
			forward = new ActionForward();
			forward.setPath("./samples/sample1.jsp");
			forward.setRedirect(false);			
		}
		
		else if(command.equals("/SampleTest2.sa")) {
			System.out.println(" C : /SampleTest2.sa 호출! ");
			System.out.println(" C : DB동작 O, view 이동");
			// 패턴 2
			action = new SampleTest2Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/SampleTest3.sa")) {
			System.out.println(" C : /SampleTest3.sa 호출! ");
			System.out.println(" C : DB동작 O, view O");
			// 패턴 3
			action = new SampleTest3Action();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// end of if-else
		
	}
	// end of setActionForward

}
