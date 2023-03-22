package com.bobjo.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.reservation.db.ReservationDAO;
import com.bobjo.reservation.db.ReservationDTO;
import com.bobjo.utils.date.TimestampParser;

public class ReservationAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		String m_id = (String)request.getSession().getAttribute("m_id");
		ActionForward forward = new ActionForward();
		if(m_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}

		ReservationDTO dto = new ReservationDTO();
		dto.setM_id(m_id);
		dto.setRsrv_name(request.getParameter("rsrv_name"));
		dto.setRsrv_phone(request.getParameter("rsrv_phone").replaceAll("-",""));
		dto.setStore_no(Integer.parseInt(request.getParameter("store_no")));
		dto.setRsrv_date(TimestampParser.stringToTimestamp(request.getParameter("rsrv_dateOnly"),request.getParameter("rsrv_timeOnly")));
		dto.setPeople_num(Integer.parseInt(request.getParameter("people_num")));
		dto.setRsrv_msg(request.getParameter("rsrv_msg"));
		dto.setMenu_no(request.getParameter("menu_no"));
		dto.setMenu_amount(request.getParameter("menu_amount"));

		// 예약
		if(request.getParameter("price") == null) {
			dto.setStatus("예약완료");
			new ReservationDAO().insertReservation(dto);
			forward.setPath("./StoreInfo.st?store_no="+request.getParameter("store_no"));
			forward.setRedirect(true);
		}
		// 예약 및 결제
		else {
			dto.setStatus("결제대기");
			new ReservationDAO().insertReservation(dto);
			request.setAttribute("rsrv_no", dto.getRsrv_no());
			request.setAttribute("price", request.getParameter("price"));
			request.setAttribute("store_no", request.getParameter("store_no"));
			forward.setPath("./Pay.pa");
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
