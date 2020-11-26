package com.Team03Proj.www.dao;

import java.sql.*;

import com.Team03Proj.www.sql.*;

import db.ClsDBCP;

public class JoinDao {
	private ClsDBCP db;
	private JoinSQL jSQL;
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public JoinDao() {
		db = new ClsDBCP();
		jSQL = new JoinSQL();
	}
	
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
}
