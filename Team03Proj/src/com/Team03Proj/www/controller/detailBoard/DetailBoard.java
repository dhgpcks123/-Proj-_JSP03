package com.Team03Proj.www.controller.detailBoard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;

public class DetailBoard implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/detailBoard/DetailBoard";
		req.setAttribute("isRedirect", false);
		return view;
	}

}
