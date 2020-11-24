package com.Team03Proj.www.controller.main;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;
import com.Team03Proj.www.dao.InfoDao;
import com.Team03Proj.www.dao.MapDao;
import com.Team03Proj.www.vo.InfoVO;
import com.Team03Proj.www.vo.MapVO;
import com.Team03Proj.www.vo.ReviewVO;

public class MainPage implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		
		String view = "/main/MainPage";
		req.setAttribute("isRedirect", false);
	
		
		Double x =33.23574587023389;;
		Double y =126.36351258114277;
//		x = req.getParameter("x");
//		y = req.getParameter("y");
		
		
		InfoDao iDao = new InfoDao();
		MapDao mDao = new MapDao();
		

		
		ArrayList<ReviewVO> review = iDao.getReviewInfo(x,y);
		ArrayList<InfoVO> store = iDao.getStoreInfo(x,y);
		ArrayList<MapVO> maplist = mDao.getMapInfo();
		
		req.setAttribute("REVIEW", review);
		req.setAttribute("STORE", store);
		req.setAttribute("MAPLIST", maplist);
		

		return view;
	}

}
