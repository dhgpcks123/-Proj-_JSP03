package com.Team03Proj.www.controller.member;

import javax.servlet.http.*;

import com.Team03Proj.www.controller.ClsMain;
import com.Team03Proj.www.dao.JoinDao;

public class MemberIdCheck implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		// ajax처리 속성
		req.setAttribute("isRedirect", null);
		
		
		
		StringBuffer buff = new StringBuffer();
		
		// 1. 파라미터 꺼내오고
		String sid = req.getParameter("id");
		JoinDao jDao = new JoinDao();
		int cnt = jDao.getCheckId(sid);
		
		String result = "";
		if(cnt == 0) {
			result = "OK";
		} else {
			result = "NO";
		}
		
		buff.append("{");
		buff.append("	\"result\": \"" + result + "\"");
		buff.append("}");
		
		
		
		return buff.toString();
	}

}
