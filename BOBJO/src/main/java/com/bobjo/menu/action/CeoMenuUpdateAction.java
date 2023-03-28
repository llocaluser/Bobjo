package com.bobjo.menu.action;

import java.io.File;

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

public class CeoMenuUpdateAction implements Action {

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

		// 기존파일 -> 파일 삭제
		File f = new File("경로+이름");
		f.delete();
		// 수정파일 -> 정보 수정
		MenuDTO dto = new MenuDTO();
		int store_no = Integer.parseInt(multi.getParameter("store_no"));
		dto.setStore_no(store_no);
		dto.setMenu_no(Integer.parseInt(multi.getParameter("menu_no")));
		dto.setMenu_name(multi.getParameter("menu_name"));
		dto.setPrice(Integer.parseInt(multi.getParameter("price")));
		dto.setMenu_info(multi.getParameter("menu_info"));
		dto.setMenu_category(multi.getParameter("menu_category"));
		String menu_img = multi.getFilesystemName("menu_img");
		dto.setMenu_img(menu_img);

		// DAO - 정보 수정 메서드
		MenuDAO dao = new MenuDAO();
		dao.updateMenu(dto);

		ActionForward forward = new ActionForward();
		forward.setPath("./CeoMenuList.nu?store_no="+store_no);
		forward.setRedirect(true);
		return forward;
	}

}
