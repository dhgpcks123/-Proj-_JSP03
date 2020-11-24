package com.Team03Proj.www.dao;

import java.sql.*;
import java.util.*;

import com.Team03Proj.www.sql.*;
import com.Team03Proj.www.vo.*;

import db.*;

public class InfoDao {
	private ClsDBCP db;
	private InfoSQL iSQL;
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public InfoDao() {
		db = new ClsDBCP();
		iSQL = new InfoSQL();
	}
	

	public ArrayList<ReviewVO> getReviewInfo(double rx, double ry){
		
		con = db.getCon();		
		ArrayList<ReviewVO> list = new ArrayList<ReviewVO>();
		String sql = iSQL.getSQL(iSQL.SEL_REVIEW);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setDouble(1, rx);
			pstmt.setDouble(2, ry);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO rVO = new ReviewVO();
				rVO.setRno(rs.getInt("rno"));
				rVO.setId(rs.getString("id"));
				rVO.setRhit(rs.getInt("rhit"));
				rVO.setRtitle(rs.getString("rtitle"));
				rVO.setRbody(rs.getString("rbody"));
				rVO.setJoinDate(rs.getDate("rdate"));
				rVO.setJoinTime(rs.getTime("rdate"));
				rVO.setRgrade(rs.getInt("rgrade"));
				
				Connection rcon = db.getCon();
						
			ArrayList<RphotoVO> rlist = new ArrayList<RphotoVO>();
			String rsql = iSQL.getSQL(iSQL.SEL_REVIEW_PHOTO);
			PreparedStatement rpstmt = db.getPSTMT(rcon, rsql);
			rpstmt = db.getPSTMT(con, rsql);

				rpstmt.setDouble(1, rx);
				rpstmt.setDouble(2, ry);
				
				ResultSet rrs = rpstmt.executeQuery();
				while(rrs.next()) {
					RphotoVO pVO = new RphotoVO();
					pVO.setRno(rrs.getInt("rno"));
					pVO.setRdir(rrs.getString("rpdir"));
					pVO.setRponame(rrs.getString("rponame"));
					pVO.setRpsname(rrs.getString("rpsname"));
					
					rlist.add(pVO);
				}
				rVO.setRphotovoList(rlist);
				
				list.add(rVO);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}

		return list;

	};
	
	
	public ArrayList<InfoVO> getStoreInfo(double ax, double ay){
		ArrayList<InfoVO> list = new ArrayList<InfoVO>();
		con = db.getCon();
		String sql = iSQL.getSQL(iSQL.SEL_STORE);
		pstmt = db.getPSTMT(con, sql);
		
		try {
			pstmt.setDouble(1, ax);
			pstmt.setDouble(2, ay);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				InfoVO iVO = new InfoVO();
				iVO.setAno(rs.getInt("ano"));
				iVO.setAname(rs.getString("aname"));
				iVO.setAloc(rs.getString("aloc"));
				iVO.setAtel(rs.getString("atel"));
				iVO.setAtno(rs.getInt("atno"));
				iVO.setApno(rs.getInt("apno"));
				iVO.setAbody(rs.getString("abody"));
				iVO.setAponame(rs.getString("aponame"));
				iVO.setApsname(rs.getString("apsname"));
				iVO.setAdir(rs.getString("apdir"));
				list.add(iVO);
			}
		} catch (Exception e) {
			System.out.println("에러문이 실행됐다");
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	}
}