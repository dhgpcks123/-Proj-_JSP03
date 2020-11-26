package com.Team03Proj.www.controller.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.dao.*;
import com.Team03Proj.www.vo.*;
import com.Team03Proj.www.controller.*;

public class MemerJoinProc implements ClsMain {
	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view = "/Team03Proj/memberJoinEnd.cls";
		// 페이지 요청방식  설정
		req.setAttribute("isRedirect", true);
		
		// 할일
		// 1. 파라미터 받고 
		String sid = req.getParameter("id");
		String sname = req.getParameter("mname");
		String spw = req.getParameter("pw");
		String smail = req.getParameter("mail");
		String stel = req.getParameter("tel");
		String sgen = req.getParameter("gen");
		String sblood1 = req.getParameter("blood1");
		String sblood2 = req.getParameter("blood2");
		String sbirth = req.getParameter("birth");
		String ssos = req.getParameter("sos");
		
		
		// VO에 데이터 담고
		JoinVO jVO = new JoinVO();
		
		jVO.setId(sid);
		jVO.setMname(sname);
		jVO.setPw(spw);
		jVO.setMail(smail);
		jVO.setGen(stel);
		jVO.setGen(sgen);
		jVO.setGen(sblood1);
		jVO.setGen(sblood2);
		jVO.setGen(sbirth);
		jVO.setGen(ssos);
		
		// 데이터베이스 작업하고 
		JoinDao jDAO = new JoinDao();
		int cnt = jDAO.addMemb(jVO);
		if(cnt == 0) {
			// 회원가입 실패한경우
			view = "/Team03proc/memberJoin.cls";
		} else {
			// 이 경우는 데이터베이스에 정보입력이 성공한 경우이므로 로그인 처리를 해준다. 
			req.getSession().setAttribute("SID", sid);
		}
			
		return view;
	}
}
