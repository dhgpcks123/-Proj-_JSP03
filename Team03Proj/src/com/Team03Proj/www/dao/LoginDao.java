package com.Team03Proj.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;


import com.Team03Proj.www.sql.*;

import db.ClsDBCP;

public class LoginDao {
	private ClsDBCP db;
	private LoginSQL lSQL;
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public LoginDao() {
		db = new ClsDBCP();
		lSQL = new LoginSQL();
	}
	
	public int getLoginCnt(String id, String pw) {
		int cnt = 0;
			con = db.getCon();
			String sql = lSQL.getSQL(lSQL.SEL_LOGIN_CNT);
			pstmt = db.getPSTMT(con, sql);
			try {
				pstmt.setString(1, id);
				pstmt.setString(2, pw);
				
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
	
}
