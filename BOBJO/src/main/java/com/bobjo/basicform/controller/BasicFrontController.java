package com.bobjo.basicform.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bobjo.basicform.action.Action;
import com.bobjo.basicform.action.ActionForward;



public abstract class BasicFrontController extends HttpServlet {
	protected Action action = null;
	protected ActionForward forward = null;
	
	protected abstract void setActionForward(String command, HttpServletRequest request, HttpServletResponse response);
	
	private void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] classPath = this.getClass().getName().split("\\.");
		System.out.println(" C : "+classPath[classPath.length-1]+"-doProcess() 호출 ");
		/////////////////////// 1. 가상주소 계산 //////////////////////////
		System.out.println("\n\n 1. 가상주소 계산 - 시작 ");
		String requestURI = request.getRequestURI();
		System.out.println(" C : requestURI - "+requestURI);
		String ctxPath = request.getContextPath();
		System.out.println(" C : ctxPath - "+ctxPath);
		String command = requestURI.substring(ctxPath.length());
		System.out.println(" C : command - "+command);
		System.out.println("\n 1. 가상주소 계산 - 끝 ");
		/////////////////////// 1. 가상주소 계산 //////////////////////////
		
		
		/////////////////////// 2. 가상주소 매핑 //////////////////////////
		System.out.println("\n\n 2. 가상주소 매핑 - 시작 ");
		
		setActionForward(command, request, response);
		
		System.out.println("\n 2. 가상주소 매핑 - 끝 ");
		/////////////////////// 2. 가상주소 매핑 //////////////////////////
		
		
		/////////////////////// 3. 가상주소 이동 //////////////////////////
		System.out.println("\n\n 3. 가상주소 이동 - 시작 ");
		
		if(forward != null) {  // 이동정보가 있을때
			if(forward.isRedirect()) { // true
				System.out.println(" C : 방식 - "+forward.isRedirect()+", 주소 - "+forward.getPath());
				response.sendRedirect(forward.getPath());					
			}else {//false
				System.out.println(" C : 방식 - "+forward.isRedirect()+", 주소 - "+forward.getPath());
				RequestDispatcher dis =
						request.getRequestDispatcher(forward.getPath());
				dis.forward(request, response);
			}
		}
		
		System.out.println("\n 3. 가상주소 이동 - 끝 ");
		/////////////////////// 3. 가상주소 이동 //////////////////////////
	}
	
	@Override
	protected final void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected final void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
}
