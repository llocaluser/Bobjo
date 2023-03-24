package com.bobjo.store.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;

public class CeoStoreListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			String[] classPath = this.getClass().getName().split("\\.");
			System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
			// DAO - 등록한 가게정보 조회
			StoreDAO dao = new StoreDAO();
			List cStoreList = dao.CeoStoreList((String)request.getSession().getAttribute("m_id"));
			
			
			// request 영역에 저장
			request.setAttribute("cStoreList", cStoreList);
			if(request.getParameter("store_no") != null) {
				request.setAttribute("cdto", dao.getStore(Integer.parseInt(request.getParameter("store_no"))));
			}
			
			// 페이지 이동
			ActionForward forward = new ActionForward();
			forward.setPath("./ceo/ceoStoreList.jsp");
			forward.setRedirect(false);
			
			return forward;
		
	}

}
