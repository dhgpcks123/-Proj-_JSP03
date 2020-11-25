package com.Team03Proj.www.controller.main;

import java.util.ArrayList;

import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Team03Proj.www.controller.ClsMain;
import com.Team03Proj.www.dao.MapDao;
import com.Team03Proj.www.vo.MapVO;

public class MarkerList implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		// ajax 처리 속성 
				req.setAttribute("isRedirect", null);
				
				StringBuffer buff = new StringBuffer();
				
				// 1. 파라미터 꺼내오고
				
				// 2. 데이터베이스 작업하고
				MapDao mDao = new MapDao();
				ArrayList<MapVO> list = mDao.getMapInfo();
				// 3. 결과만들고
				resp.setHeader("Content-Type", "application/xml");
				resp.setContentType("text/xml;charset=UTF-8");
				resp.setCharacterEncoding("utf-8");


				buff.append(" [ ");
				for(int i = 0 ; i< list.size()-1; i ++) {
					buff.append(" { ");
					buff.append("	\"title\": \"'" + list.get(i).getAname()+"'\"  " + ", ");
					buff.append("	\"x\": \"" + list.get(i).getAx() +" \", " );		
					buff.append("	\"y\": \"" + list.get(i).getAy() + " \"" );		
					buff.append(" }, ");
				};
				
					buff.append(" {");
					buff.append("	\"title\": \"'" + list.get(list.size()-1).getAname()+"'\"  " + ", ");
					buff.append("	\"x\": \"" + list.get(list.size()-1).getAx() + "\", " );		
					buff.append("	\"y\": \"" + list.get(list.size()-1).getAy() + "\"" );		
					buff.append(" } ");
				
					buff.append(" ] ");
				System.out.println(buff.toString());
				
				
				return buff.toString();
				
			
	}

}
