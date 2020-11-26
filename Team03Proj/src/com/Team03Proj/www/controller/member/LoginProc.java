package com.Team03Proj.www.controller.member;

import javax.servlet.http.*;

import com.Team03Proj.www.controller.*;
import com.Team03Proj.www.dao.*;

public class LoginProc implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// 뷰 요청방식 결정하고
		req.setAttribute("isRedirect", true);
		//String view = "/main/MainPage";
		String view = "/Team03Proj/main.cls";
		// 파라미터 받고
		String sid = req.getParameter("id");
		String spw = req.getParameter("pw");
		
		// 데이터베이스 작업하고 결과받고
		MemberDAO mDao = new MemberDAO();
		int cnt = mDao.getLoginCnt(sid, spw);
		if(cnt != 1) {
			System.out.println("입력된 id: " +sid);
			System.out.println("입력된 pw: " +spw);
			//String view = "/main/MainPage";
		} else {
			// 이 경우는 로그인에 성공한 경우이므로 세션에 데이터를 기록해 둔다.
			System.out.println("check");
			req.getSession().setAttribute("SID", sid);
		}
		
		// 뷰를 부른다.
		return view;
	}

}
