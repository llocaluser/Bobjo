package com.bobjo.basicform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Action {
	// => 동작(DB사용) 통일하기 위해서 (다형성)
	
	/**
	 * 
	 * @param req
	 * @param resp
	 * @return ActionForward (이동정보)
	 * @throws Exception
	 */
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
						