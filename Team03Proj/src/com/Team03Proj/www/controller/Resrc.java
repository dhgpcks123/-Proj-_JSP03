package com.Team03Proj.www.controller;

import javax.servlet.annotation.*;
import javax.servlet.*;
import javax.servlet.http.*;

//@WebServlet({"/css/*", "/js/*", "/img/*"})
public class Resrc extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse resp) {

		String url = req.getRequestURI();

		url = url.substring(url.indexOf("/", 1));

		String view = "/WEB-INF/resources" + url;
		
		System.out.println("#######view 경로 : " + view);

		RequestDispatcher rd = req.getRequestDispatcher(view);

		try {
			rd.forward(req, resp);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
