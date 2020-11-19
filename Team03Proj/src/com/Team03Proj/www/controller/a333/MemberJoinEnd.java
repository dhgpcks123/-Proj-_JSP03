package com.Team03Proj.www.controller.a333;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.increpas.cls.controller.ClsMain;

public class MemberJoinEnd implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "333/MemberJoinEnd";
		return view;
	}

}
