package com.bobjo.reservation.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.reservation.db.ReservationDAO;
import com.bobjo.store.db.StoreDTO;

public class ReservationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("M : ReservationAction_execute 호출");
		String m_id = (String)request.getSession().getAttribute("m_id");
		ActionForward forward = new ActionForward();
		if(m_id == null) {
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}
           
		ReservationDAO dao = new ReservationDAO();
		request.setAttribute("store_no", request.getParameter("store_no"));
		StoreDTO dto = dao.getStoreInfoForRsrv(Integer.parseInt(request.getParameter("store_no")));
		request.setAttribute("dto", dto);
		request.setAttribute("open", Integer.parseInt(dto.getOpen().split(":")[0]));
		request.setAttribute("close", Integer.parseInt(dto.getClose().split(":")[0]));
		request.setAttribute("menu_no", request.getParameter("menu_no"));
		request.setAttribute("menu_amount", request.getParameter("menu_amount"));
		request.setAttribute("price", request.getParameter("price"));
		
		// 포인트 정보 추가 0327 
		request.setAttribute("point", dao.getPoint(m_id));
		// 포인트 정보 추가 0327 
		
		forward.setPath("./reservation/rsrv.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
