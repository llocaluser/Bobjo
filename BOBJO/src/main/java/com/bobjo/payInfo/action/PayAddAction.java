package com.bobjo.payInfo.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.payInfo.db.PayInfoDAO;
import com.bobjo.payInfo.db.PayInfoDTO;
import com.bobjo.reservation.db.ReservationDAO;

public class PayAddAction implements Action {

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
		
		int rsrv_no = Integer.parseInt(request.getParameter("rsrv_no"));
		PayInfoDAO dao = new PayInfoDAO();
		PayInfoDTO dto = new PayInfoDTO();
		dto.setM_p_id(m_id);
		dto.setM_c_id(dao.getCeoId(Integer.parseInt(request.getParameter("store_no"))));
		dto.setPrice(Integer.parseInt(request.getParameter("price")));
		dto.setPay_type(request.getParameter("pay_type"));
		
		if(dao.insertPayInfo(dto)) {
			new ReservationDAO().updateRsrvWhenCompletePay(rsrv_no, dto.getPay_no());
			forward.setPath("./StoreInfo.st?store_no="+request.getParameter("store_no"));
			forward.setRedirect(true);
		}
		
		return null;
	}

}
