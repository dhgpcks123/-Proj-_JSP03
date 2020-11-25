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
				rVO.setRbody(rs.getString("rbody").replaceAll("\r\n", "<br>"));
				rVO.setJoinDate(rs.getDate("rdate"));
				rVO.setJoinTime(rs.getTime("rdate"));
				rVO.setRgrade(rs.getInt("rgrade"));
				rVO.setRpno(rs.getInt("rpno"));
				rVO.setRx(rs.getDouble("rx"));
				rVO.setRy(rs.getDouble("ry"));
				
				Connection rcon = db.getCon();
				ResultSet rrs = null;
			ArrayList<RphotoVO> rlist = new ArrayList<RphotoVO>();
			String rsql = iSQL.getSQL(iSQL.SEL_REVIEW_PHOTO);
			PreparedStatement rpstmt = db.getPSTMT(rcon, rsql);
			rpstmt = db.getPSTMT(con, rsql);
				try {
				rpstmt.setDouble(1, rx);
				rpstmt.setDouble(2, ry);
				
				rrs = rpstmt.executeQuery();
				while(rrs.next()) {
					RphotoVO pVO = new RphotoVO();
					pVO.setRno(rrs.getInt("rno"));
					pVO.setRdir(rrs.getString("rpdir"));
					pVO.setRponame(rrs.getString("rponame"));
					pVO.setRpsname(rrs.getString("rpsname"));
					
					rlist.add(pVO);
				}
				}catch(Exception e) {
				}finally {
					db.close(rrs);
					db.close(rpstmt);
					db.close(rcon);
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
			db.close(pstmt);
			db.close(con);
		}
		return list;
	}
	
	
	public int addReview(ReviewVO rVO) {
		int cnt = 0 ;
		con = db.getCon();
		String sql = iSQL.getSQL(iSQL.ADD_REVIEW);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setString(1, rVO.getId());
			pstmt.setString(2, rVO.getRtitle() );
			pstmt.setString(3, rVO.getRbody());
			pstmt.setInt(4, rVO.getRgrade());
			pstmt.setDouble(5, rVO.getRx());
			pstmt.setDouble(6, rVO.getRy());
			
			cnt = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(pstmt);
			db.close(con);
		}
		
		
		return cnt;
	}
	
	public int addFile(ArrayList<FileVO> list) {
		int cnt =0;
			for(FileVO fVO : list) {
				cnt =+ addFile(fVO);
			}
		
		return cnt;
	}

	// 파일정보 입력 전담 처리함수
		public int addFile(FileVO fVO) {
			int cnt = 0;
			con = db.getCon();
			String sql = iSQL.getSQL(iSQL.ADD_REVIEW_FILE);
			pstmt = db.getPSTMT(con, sql);
			try {
				// 질의명령 완성
				pstmt.setInt(1, fVO.getRpno());
				pstmt.setString(2, fVO.getRponame());
				pstmt.setString(3, fVO.getRpsname());
				pstmt.setInt(4, fVO.getRpsize());
				pstmt.setString(5, fVO.getRpdir());
				pstmt.setString(6, fVO.getRtno());
				
				// 질의보내고 결과받고
				cnt = pstmt.executeUpdate();
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(pstmt);
				db.close(con);
			}
			
			return cnt;
		}
	
	
}