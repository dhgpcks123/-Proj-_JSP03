package com.Team03Proj.www.controller.a333;

import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;

import com.increpas.cls.controller.*;
//import com.Team03Proj.www.controller.*;

public class MemberJoin implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "333/MemberJoin";
		return view;
	}

}