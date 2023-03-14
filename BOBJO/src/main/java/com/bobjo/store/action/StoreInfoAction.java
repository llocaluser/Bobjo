package com.bobjo.store.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;

public class StoreInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 전달 정보 저장 store_no
		int store_no = Integer.parseInt(request.getParameter("store_no"));
		
		// DAO - 특정 상품의 정보를 가져오기
		// request 영역에 저장
		StoreDAO dao = new StoreDAO();
		
		StoreDTO dto = dao.getStore(store_no);
		dto.setStore_no(store_no);
		request.setAttribute("dto",dto);
		
		// 페이지 이동 & 출력(./store/info.jsp)
		ActionForward forward = new ActionForward();
		forward.setPath("./store/info.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
