package com.Team03Proj.www.controller.member;

import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;
//import com.Team03Proj.www.controller.*;

public class MemberJoin implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "member/MemberJoin";
		return view;
	}

}
