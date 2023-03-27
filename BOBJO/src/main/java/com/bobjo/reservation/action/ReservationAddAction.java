package com.bobjo.reservation.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.payInfo.db.PayInfoDAO;
import com.bobjo.payInfo.db.PayInfoDTO;
import com.bobjo.reservation.db.ReservationDAO;
import com.bobjo.reservation.db.ReservationDTO;
import com.bobjo.utils.date.TimestampParser;

public class ReservationAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		String m_id = (String)request.getSession().getAttribute("m_id");
		if(m_id == null) {
			ActionForward forward = new ActionForward();
			forward.setPath("./MemberLogin.me");
			forward.setRedirect(true);
			return forward;
		}

		ReservationDTO rsrvDTO = new ReservationDTO();
		rsrvDTO.setM_id(m_id);
		rsrvDTO.setRsrv_name(request.getParameter("rsrv_name"));
		rsrvDTO.setRsrv_phone(request.getParameter("rsrv_phone").replaceAll("-",""));
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		rsrvDTO.setStore_no(store_no);
		rsrvDTO.setRsrv_date(TimestampParser.stringToTimestamp(request.getParameter("rsrv_dateOnly"),request.getParameter("rsrv_timeOnly")));
		rsrvDTO.setPeople_num(Integer.parseInt(request.getParameter("people_num")));
		rsrvDTO.setRsrv_msg(request.getParameter("rsrv_msg"));
		rsrvDTO.setMenu_no(request.getParameter("menu_no"));
		rsrvDTO.setMenu_amount(request.getParameter("menu_amount"));

		// 예약
		String priceStr = request.getParameter("price");
		if(priceStr == null || priceStr.equals("") || Integer.parseInt(priceStr) < 1) {
			rsrvDTO.setStatus("예약완료");
			new ReservationDAO().insertReservation(rsrvDTO);
			redirectWithJS(request, response, "예약이 완료되었습니다.", rsrvDTO.getRsrv_no(), store_no);
		}
		// 예약 및 결제
		else {
			
			PayInfoDAO dao = new PayInfoDAO();
			PayInfoDTO payDTO = new PayInfoDTO();
			payDTO.setM_p_id(m_id);
			payDTO.setM_c_id(dao.getCeoId(Integer.parseInt(request.getParameter("store_no"))));
			payDTO.setPrice(Integer.parseInt(request.getParameter("price")));
			payDTO.setPay_type(request.getParameter("pay_type"));
			
			// 결제 성공시 로직
			if(dao.insertPayInfo(payDTO)) {
				rsrvDTO.setStatus("예약완료");
				rsrvDTO.setPay_no(payDTO.getPay_no());
				ReservationDAO rsrvDAO = new ReservationDAO();
				rsrvDAO.insertReservation(rsrvDTO);
				//포인트 사용시 포인트 차감
				if(request.getParameter("point") != null) {
					int point = Integer.parseInt(request.getParameter("point"));
					if(point > 0) {
						rsrvDAO.spentPoint(point, m_id);
					}
				}
				//포인트 사용시 포인트 차감
				redirectWithJS(request, response, "결제가 완료되었습니다.", rsrvDTO.getRsrv_no(), store_no);
			}
			// 결제 실패시 로직
			else {
				rsrvDTO.setStatus("결제대기");
				new ReservationDAO().insertReservation(rsrvDTO);
				redirectWithJS(request, response, "결제를 실패했습니다.", rsrvDTO.getRsrv_no(), store_no);
			}

		}
		
		return null;
	}
	
	private void redirectWithJS(HttpServletRequest request, HttpServletResponse response, String msg, int rsrv_no, int store_no) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write("  if(confirm('"+msg+" 예약 정보를 확인하시겠습니까?')) { ");
		out.write("  location.href = './MemberBook.me?rsrv_no="+rsrv_no+"'; ");
		out.write("  } else { ");
		out.write("  location.href = './StoreInfo.st?store_no="+store_no+"'; ");
		out.write("  } ");
		out.write("</script>");
		out.close();
	}

}
