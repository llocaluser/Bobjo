package com.bobjo.reservation.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.reservation.db.ReservationDAO;

public class CeoRsrvListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  " + classPath[classPath.length - 1] + "_execute() 호출! ");
		
		// DAO - 등록한 예약자정보 조회
		ReservationDAO dao = new ReservationDAO();
		List cRsvList = dao.CeoRsvList((String)request.getSession().getAttribute("m_id"));
		
		// request 영역에 저장
		request.setAttribute("cRsvList", cRsvList);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./reservation/ceoRsvList.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
