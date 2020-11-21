package com.Team03Proj.www.controller.bridgeBoard;

import javax.servlet.http.*;

import com.Team03Proj.www.controller.ClsMain;

public class BridgeBoard implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
	
	String view = "/bridgeBoard/BridgeBoard";
	req.setAttribute("isRedirect", false);

	return view;
	}
}
