package com.bobjo.store.action;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
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

public class CeoAddStoreAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" M :  " + classPath[classPath.length - 1] + "_execute() 호출! ");

		// 파일 다중 업로드 접근경로
		ServletContext ctx = request.getServletContext();
		String realPath = ctx.getRealPath("/images");

		int maxSize = (10 * 1024 * 1024)*3; // 30MB

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8",
		        new DefaultFileRenamePolicy());

		// 나머지 정보들 저장(DTO 객체)
		StoreDTO dto = new StoreDTO();
		dto.setM_id((String)request.getSession().getAttribute("m_id"));
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

		// 디비 연결 - 가게등록
		StoreDAO dao = new StoreDAO();
		dao.insertStore(dto);

		ActionForward forward = new ActionForward();
		forward.setPath("./CeoStoreList.st");
		forward.setRedirect(true);

		return forward;
	}

}