package com.Team03Proj.www.controller.a333;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;

public class MemberJoin implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "333/MemberJoin";
		return view;
	}

}
