package com.bobjo.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;

public class ReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : ReservationAction_execute 호출");
		
         // 예약정보 받기 
		
		
		
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./reservation/rsrv.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
