package com.Team03Proj.www.dao;

import java.sql.*;
import java.util.*;
import db.*;

import com.Team03Proj.www.vo.*;
import com.Team03Proj.www.sql.*;

public class JoinDao {
	ClsDBCP db;
	Connection con;
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	JoinSQL jSQL;
	
	public JoinDao() {
		db = new ClsDBCP();
		jSQL = new JoinSQL();
	}
	// 로그인 데이터베이스작업 전담 처리함수
		public int getLoginCnt(String sid, String spw) {
			int cnt = 0 ;
			con = db.getCon();
			String sql = jSQL.getSQL(jSQL.SEL_LOGIN_CNT);
			pstmt = db.getPSTMT(con, sql);
			try {
				pstmt.setString(1, sid);
				pstmt.setString(2, spw);
				
				rs = pstmt.executeQuery();
				rs.next();
				
				cnt = rs.getInt("cnt");
			} catch(Exception e) {
				e.printStackTrace();
			} finally {
				db.close(rs);
				db.close(pstmt);
				db.close(con);
			}
			return cnt;
		}
		
	// 아이디체크 처리함수
	public int getCheckId(String id) {
		int cnt = 0;
		con = db.getCon();
		String sql = jSQL.getSQL(jSQL.SEL_CK_ID);
		pstmt = db.getPSTMT(con, sql);
		try {
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			rs.next();
			
			cnt = rs.getInt("cnt");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(pstmt);
			db.close(con);
		}
		return cnt;
	}
	
	// 회원가입 처리함수
	public int addMemb(JoinVO mVO) {
		int cnt = 0 ;
		con = db.getCon();
		String sql = jSQL.getSQL(jSQL.ADD_MEMB);
		pstmt = db.getPSTMT(con, sql);
		try {
			rs=pstmt.executeQuery(sql);
			
			pstmt.setString(1, mVO.getId());
			pstmt.setString(2, mVO.getMname());
			pstmt.setString(3, mVO.getPw());
			pstmt.setString(4, mVO.getMail());
			pstmt.setString(5, mVO.getGen());
			pstmt.setString(6, mVO.getBlood1());
			pstmt.setString(7, mVO.getBlood2());
			pstmt.setString(8, mVO.getBirth());
			pstmt.setString(9, mVO.getSos());
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
