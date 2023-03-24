package com.bobjo.store.action;

import java.io.File;
import java.util.Enumeration;
import java.util.Stack;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.store.db.StoreDAO;
import com.bobjo.store.db.StoreDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class CeoStoreUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  " + classPath[classPath.length - 1] + "_execute() 호출! ");

		// 파일업로드 접근경로
		ServletContext ctx = request.getServletContext();
		String realPath = ctx.getRealPath("/images");
		// System.out.println(realPath);

		int maxSize = 10 * 1024 * 1024; // 10MB

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 기존파일 -> 파일 삭제
//		File f = new File("/images"+multi.getParameter("deleteImg"));
//		f.delete();
		// 수정파일 -> 정보 수정
		StoreDTO dto = new StoreDTO();
		dto.setStore_no(Integer.parseInt(multi.getParameter("store_no")));
		dto.setStore_name(multi.getParameter("store_name"));
		dto.setAddr(multi.getParameter("addr"));
		dto.setAddr_details(multi.getParameter("addr_details"));
		dto.setTel(multi.getParameter("tel"));
		dto.setOpen(multi.getParameter("open"));
		dto.setClose(multi.getParameter("close"));
		dto.setTotal_tables(Integer.parseInt(multi.getParameter("total_tables")));
		dto.setMax_rsrv(Integer.parseInt(multi.getParameter("max_rsrv")));
		dto.setExtra_info(multi.getParameter("extra_info"));
		dto.setStore_content(multi.getParameter("store_content"));
		dto.setRefund_policy(multi.getParameter("refund_policy"));
		dto.setStore_category(multi.getParameter("store_category"));
//		String store_img = multi.getFilesystemName("store_img");
//		dto.setStore_img(store_img);
		 // 다중 파일 업로드 - 순서대로 나열
				Enumeration<String> fileNames = multi.getFileNames();
				Stack<String> st = new Stack<>();
				while(fileNames.hasMoreElements()) {
				    String fileName = fileNames.nextElement();
				    String store_img = multi.getFilesystemName(fileName);
				    st.push(store_img);
				    st.push(",");
				}
				st.pop();
				
				StringBuilder sb = new StringBuilder();
				while(!st.isEmpty()) {
					sb.append(st.pop());
				}
				dto.setStore_img(sb.toString());
		// 다중 파일 업로드 - 순서대로 나열

		// DAO - 정보 수정 메서드
		StoreDAO dao = new StoreDAO();
		dao.updateStore(dto);

		// 페이지 이동
		ActionForward forward = new ActionForward();
		forward.setPath("./CeoStoreList.st");
		forward.setRedirect(true);

		return forward;
	}

}
