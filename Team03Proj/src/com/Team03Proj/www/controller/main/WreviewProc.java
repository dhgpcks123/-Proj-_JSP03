package com.Team03Proj.www.controller.main;

import java.io.File;
import java.util.*;

import javax.servlet.http.*;

import com.Team03Proj.www.controller.ClsMain;
import com.Team03Proj.www.dao.*;
import com.Team03Proj.www.vo.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class WreviewProc implements ClsMain {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) {
		String view;
		
		req.setAttribute("isRedirect", true);
		int cnt = 0;
		
		// 1. 파라미터 받기- 지금은 스트림 방식이므로 MultipartRequest에서 꺼내와야한다.
		String path = req.getSession().getServletContext().getRealPath("\\WEB-INF\\resources\\img\\review");
		try {
			MultipartRequest multi = new MultipartRequest(req, path, 1024*1024*10, "UTF-8",	new DefaultFileRenamePolicy());
		
			String title = multi.getParameter("reviewTitle");
			String body = multi.getParameter("reviewBody");
//#######################SID 받아줘야함
//			String id = multi.getParameter("reviewId");
//#######################SID 받아줘야함###########################
			String id = "chan";
			String srpno = multi.getParameter("rpno");
			int rpno = Integer.parseInt(srpno)+1;
			String star = multi.getParameter("reviewStar");
			int grade = Integer.parseInt(star);
			
			String tx = multi.getParameter("reviewX");
			String ty = multi.getParameter("reviewY");
			double x = Double.parseDouble(tx);
			double y = Double.parseDouble(ty);
			
			
			
			System.out.println("title :"+title);
			System.out.println("body : " +body);
			System.out.println("id : " +id);
			System.out.println("별갯수 : " +star);
			System.out.println(x + "||" + y);
			
			//VO에 채우고
			ReviewVO rVO = new ReviewVO();
			rVO.setId(id);
			rVO.setRtitle(title);
			rVO.setRbody(body);
			rVO.setRgrade(grade);
			rVO.setRx(x);
			rVO.setRy(y);
			
			InfoDao iDao = new InfoDao();
			cnt = iDao.addReview(rVO);
			
			try {
				ArrayList<FileVO> list = getFileInfo(rpno, multi);
				int fcnt = iDao.addFile(list);
				System.out.println("사진 : "+ fcnt +"개 등록");
			}catch (Exception e) {}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		view = "/Team03Proj/main.cls";
		if(cnt == 1 ) {
			view = "/Team03Proj/main.cls#wReviewSuccess";
			System.out.println("글쓰기에 성공했습니다");
		}else {
			view = "/Team03Proj/main.cls#wReviewfrm";
			System.out.println("글쓰기에 실패했습니다.");
		}
		
		return view;
	}

	
	
	// 파일 처리 함수
	public ArrayList<FileVO> getFileInfo(int rpno, MultipartRequest multi){
		ArrayList<FileVO> list = new ArrayList<FileVO>();
		/*
		 	MultipartRequest의 파일 관련 함수
		 	
		 		1. String getOrginalFilename("키값")
		 			==> 업로드하는 파일 원 이름을 꺼내주는 함수
		 		2. String getFilesystemName("키값")
		 			==> 업로드하는 파일의 서버에 저장된 이름을 꺼내는 함수
		 		3. Enumeration getFileNames()
		 			==> 업로드하는 파일들의 키값들을 Enumeration 으로 반환해준다
		 		4. String[] getParameterValues("키값")
		 			==> 하나의 키값으로 전달되는 파라미터를 배열형태로 반환해준다.
		 		5. String[] getParameterNames()
		 			==> 파라미터 키 값들을 문자열배열로 반환해준다.
		 */
		String rtno = multi.getParameter("reviewRtno");
		System.out.println("review rtno"+ rtno);
		Enumeration en = multi.getFileNames();
		
		int idx = 0;
		while(en.hasMoreElements()) {
			String name = (String) en.nextElement();
			System.out.println(name);
			String oriname = multi.getOriginalFileName(name);
			if(oriname == null) continue;
			
			String savename = multi.getFilesystemName(name);
			File file = multi.getFile(name);
			int len = (int) file.length();
			
			FileVO fVO = new FileVO();
			fVO.setRpdir("img/review/");
			fVO.setRpno(rpno);
			fVO.setRponame(oriname);
			fVO.setRpsize(len);
			fVO.setRpsname(savename);
			fVO.setRtno(rtno);
			list.add(fVO);
		}
		return list;
		
	}
	
}






