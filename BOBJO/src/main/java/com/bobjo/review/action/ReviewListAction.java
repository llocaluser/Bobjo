package com.bobjo.review.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;
import com.bobjo.review.db.ReviewDAO;

public class ReviewListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(" M : 리뷰 - ReviewList_execute 동작 ");
		
		String sort = request.getParameter("sort");
		if(sort == null) sort = "recent";
		ReviewDAO dao = new ReviewDAO();
		// 에러 방지
		String no = request.getParameter("store_no") == null ? "1" : request.getParameter("store_no");
		int store_no = Integer.parseInt(no);
		
		Map<Integer, Integer> map = dao.getReviewScore(store_no);
		int sum = 0;
		double total = 0;
		int pageSize = 10;
		
		
		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		// 페이지 시작행 번호 계산
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1) * pageSize;

		// 페이지 끝행 번호 계산
		int endRow = currentPage * pageSize;
		
		
		for(int i : map.keySet()) {
			sum += map.getOrDefault(i, 0);
		}
		double[] arr = new double[6];
		for(int i = 0; i < 6; i++) {
			arr[i] = map.getOrDefault(i, 0)/(double)sum;
			total += map.getOrDefault(i, 0) * i;
		}
		
		// 해당 식당 전체 리뷰글 개수
		int cnt = dao.getCountReview(store_no);
		
		
		int pageCount = cnt / pageSize + (cnt % pageSize == 0 ? 0 : 1);
		// pageCount = (int)Math.ceil(count / (double)pageSize)

		// 한 화면에 출력할 페이지 블럭의 개수
		int pageBlock = 5;

		int startPage = currentPage - (pageBlock / 2);
		if(startPage < 1) startPage = 1;

		int endPage = currentPage + (pageBlock / 2);
		if (endPage > pageCount) {
			endPage = pageCount;
		}
		
		double avg = Math.round(total/cnt*100)/(double)100;
		
		request.setAttribute("store_name", dao.getStoreName(store_no));
		request.setAttribute("ReviewList", dao.getReviewList(sort, startRow, pageSize, store_no));
		request.setAttribute("pageCount", cnt);
		request.setAttribute("scoreList", arr);
		request.setAttribute("Count", cnt);
		request.setAttribute("AVG", avg);
		request.setAttribute("startPage", startPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("pageBlock", pageBlock);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("pageNum", pageNum);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("./store/storeReview.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
