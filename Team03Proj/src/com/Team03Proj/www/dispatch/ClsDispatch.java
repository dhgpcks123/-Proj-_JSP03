package com.Team03Proj.www.dispatch;

import javax.servlet.*;
import javax.servlet.http.*;

import com.Team03Proj.www.controller.ClsMain;

import java.util.*;
import java.io.*;



// url 패턴 매핑은 web.xml에서 정의
public class ClsDispatch extends HttpServlet {
	private HashMap<String, ClsMain> map;
	
	public void init(ServletConfig config) throws ServletException {
		
		Properties prop = new Properties();
		FileInputStream fin = null;
		try {
			// 할 일
			// 먼저 읽어올 파일의 경로를 알아낸다
			String spath = this.getClass().getResource("").getPath();
			fin = new FileInputStream(spath + "../resources/clsProperties.properties");
			prop.load(fin);
			
		} catch (Exception e) {
			System.out.println("#### .cls init 실패 ####");
			e.printStackTrace();
		} finally {
			try {
				fin.close();
			} catch (IOException e) {}
		}
		// 문자열로 만들어진 맵을 이용해서 실제 사용가능한 map을 초기화 주자
		map = new HashMap<String, ClsMain>();
		
		//먼저 키 값만 뽑아온다.
		Set set = prop.keySet();
		ArrayList list = new ArrayList(set);
		for(Object o  : list) {
			//키 값을 문자열로 강제 형변환
			String skey = (String) o;
			// 키 값을 이용해서 경로 뽑아오고
			String classPath = (String) prop.get(skey);
			
			//실제 실행가능한 클래스로 변환해준다.
			try {
				Class tmp =Class.forName(classPath);
				ClsMain cls = (ClsMain) tmp.newInstance();
				
				//map에 추가해준다
				map.put(skey, cls);
			} catch (Exception e) {
			}
		}
	}
	
	// 실제 요청 내용에 맞는 처리를 담당하는 함수
	public void service(HttpServletRequest req, HttpServletResponse resp)
			 throws ServletException, IOException {
		
		// 할일
		// 1.	요청내용을 알아낸다 <== .cls로 끝나는 모든 요청이 이 함수에서 실행되므로
		//								요청내용에 맞는 실행을 찾아서 해줘야 하겠다.
		String full = req.getRequestURI();
		// 2. full <== /jspcls/xxxx~~/xxx~~.cls
		String realPath = full.substring(full.indexOf('/',1));
		
		// 3. 요청 내용에 맞는 실제 실행할 클래스를 가져온다.
		ClsMain cls = map.get(realPath);
		System.out.println("요청:[ "+realPath+" ], MainCls:[ " + cls + " ]");
		Boolean bool = null;
		/*
		 	bool == null	: 비동기 통신 처리
		 	bool == false	: forward
		 	bool == true	: redirect
		 */
		req.setAttribute("isRedirect", false);
		String view = cls.exec(req, resp);
		try {
			bool = (Boolean)req.getAttribute("isRedirect");
			
		} catch (Exception e) {}
		
		if(bool == null) {
			// 이 경우는 비동기 통신이므로 반환되는 문자열을 응답문서로 만들어준다.
			PrintWriter pw = resp.getWriter();
			pw.print(view);
		} else if(bool) {
			//redirect 시켜야 하는 경우
			resp.sendRedirect(view);
		} else if(!bool) {
			//forward 시켜야 하는 경우
			String prefix = "/WEB-INF/views/com/Team03Proj/www/";
			String surffix = ".jsp";
			RequestDispatcher rd = req.getRequestDispatcher(prefix+view+surffix);
			rd.forward(req, resp);
		}
		
	}
}


























