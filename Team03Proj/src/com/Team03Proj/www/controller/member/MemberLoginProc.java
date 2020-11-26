package com.Team03Proj.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;
import com.Team03Proj.www.dao.LoginDao;

public class MemberLoginProc implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		req.setAttribute("isRedirect", true);

		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
		int cnt = 0;
		LoginDao lDao = new LoginDao();
		cnt = lDao.getLoginCnt(id, pw);
		if(cnt == 1) {
			System.out.println("[ "+id+" ]님이 로그인하셨습니다");
			req.getSession().setAttribute("SID", id);
		}else {
			System.out.println("로그인 실패");
		}
		
		String view = "/Team03Proj/main.cls";
		return view;
	}

}
