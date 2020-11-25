package com.Team03Proj.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;

public class MemberLogoutProc implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/Team03Proj/main.cls";
		// 뷰요청방식
		req.setAttribute("isRedirect", true);
		
		// 세션의 속성 지우고\
		try {
			req.getSession().removeAttribute("SID");
		} catch(Exception e) {}
		
		return view;
	}

}
