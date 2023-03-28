package com.bobjo.store.action;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;
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

		int maxSize = (10 * 1024 * 1024)*3; // 30MB

		MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

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
		
		// 체크된 파일 삭제
		String[] deleteImgs = multi.getParameterValues("deleteImg");
		if(deleteImgs != null && deleteImgs.length > 0) {
		    for(String deleteImg : deleteImgs) {
		        File file = new File(realPath + "/" + deleteImg);
		        if(file.exists()) {
		            file.delete();
		        }
		    }
		}
		
		// 수정 파일 업로드
		String[] existingImages = multi.getParameterValues("existingImg");
		List<String> uploadedImages = new ArrayList<>();

		 // 다중 파일 업로드
		Enumeration<String> fileNames = multi.getFileNames();
		Stack<String> st = new Stack<>();
		while(fileNames.hasMoreElements()) {
		    String fileName = fileNames.nextElement();
		    String store_img = multi.getFilesystemName(fileName);
		    st.push(store_img);
		    st.push(",");
		    uploadedImages.add(store_img);
		}
		if(st.size() > 0) st.pop();
		
		StringBuilder sb = new StringBuilder();
		while(!st.isEmpty()) {
			sb.append(st.pop());
		}

		// 기존 파일에서 삭제할 목록 삭제
		Set<String> extSet = new HashSet<>(Arrays.asList(existingImages));
		if(deleteImgs != null) {
			for(String del : deleteImgs) {
				extSet.remove(del);
			}
		}
		// 기존 파일과 새로 업로드한 파일의 리스트를 합침
		List<String> allImages = new ArrayList<>();
		if(existingImages != null) {
		    allImages.addAll(extSet);
		}
		allImages.addAll(uploadedImages);
		

		// 중복을 제거한 파일 리스트를 새로운 이미지 목록으로 설정
		Set<String> imageSet = new LinkedHashSet<>(allImages);
		dto.setStore_img(String.join(",", imageSet));

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