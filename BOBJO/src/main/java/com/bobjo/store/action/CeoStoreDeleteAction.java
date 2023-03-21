package com.bobjo.store.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;

public class CeoStoreDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  "+classPath[classPath.length-1]+"_execute() 호출! ");
		
		// 전달된 정보 store_no
		int store_no = Integer.parseInt(request.getParameter("store_no"));

		// DAO 객체 생성 - 상품정보 삭제 메서드
		StoreDAO dao = new StoreDAO();
		dao.deleteStore(store_no);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./CeoStoreList.st");
		forward.setRedirect(true);
		
		return forward;
	}

}
