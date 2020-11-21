package com.Team03Proj.www.controller.main;

import javax.servlet.http.*;

import com.Team03Proj.www.controller.ClsMain;

public class MainPage implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
	
	String view = "/main/MainPage";
	req.setAttribute("isRedirect", false);

	return view;
	}
}
