package com.bobjo.menu.action;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.menu.db.MenuDAO;
import com.bobjo.menu.db.MenuDTO;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CeoMenuAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  " + classPath[classPath.length - 1] + "_execute() 호출! ");

		// 파일업로드 접근경로
		ServletContext ctx = request.getServletContext();
		String realPath = ctx.getRealPath("/images");

		int maxSize = 10 * 1024 * 1024; // 10MB

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8",
		        new DefaultFileRenamePolicy());
		System.out.println(" M : 첨부파일 업로드 성공!");

		// 나머지 정보들 저장(DTO 객체)
		MenuDTO dto = new MenuDTO();
		
		dto.setMenu_name(multi.getParameter("menu_name"));
		dto.setPrice(Integer.parseInt(multi.getParameter("price")));
		dto.setMenu_info(multi.getParameter("menu_info"));
		int store_no = Integer.parseInt(multi.getParameter("store_no"));
		dto.setStore_no(store_no);
		dto.setMenu_category(multi.getParameter("menu_category"));
		
		String menu_img = multi.getFilesystemName("menu_img");
		dto.setMenu_img(menu_img);

		// 디비 연결 - 메뉴등록
		MenuDAO dao = new MenuDAO();
		dao.insertMenu(dto);
		
		ActionForward forward = new ActionForward();
		forward.setPath("./CeoMenuList.nu?store_no="+store_no);
		forward.setRedirect(true);

		return forward;
	}

}
