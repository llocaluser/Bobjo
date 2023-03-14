package com.bobjo.review.action;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.controller.BasicFrontController;

@WebServlet("*.rv")
public class ReviewFrontController extends BasicFrontController {

	@Override
	protected void setActionForward(String command, HttpServletRequest request, HttpServletResponse response) {

		// 리뷰 메인
		if (command.equals("/ReviewList.rv")) {
			System.out.println(" C : 리뷰 - ReviewList 호출 ");
			action = new ReviewListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 리뷰 페이지 이동
		else if (command.equals("/ReviewRegform.rv")) {
			System.out.println(" C : 리뷰 - ReviewRegform 이동 ");
			action = new ReviewRegformAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 리뷰 등록
		else if (command.equals("/ReviewReg.rv")) {
			System.out.println(" C : 리뷰 - ReviewReg 호출 ");
			action = new ReviewRegAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 리뷰 수정 페이지 이동
		else if (command.equals("/ReviewModform.rv")) {
			System.out.println(" C : 리뷰 - ReviewModform 이동 ");
			action = new ReviewModformAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		// 리뷰 수정
		else if (command.equals("/ReviewMod.rv")) {
			System.out.println(" C : 리뷰 - ReviewMod 호출 ");
			action = new ReviewModAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

}
