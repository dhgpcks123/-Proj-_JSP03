package com.Team03Proj.www.dao;

import java.sql.*;
import java.util.*;

import com.Team03Proj.www.sql.*;
import com.Team03Proj.www.vo.*;

import db.*;

public class MapDao {
	private ClsDBCP db;
	private MapSQL mSQL;
	private Connection con;
	private PreparedStatement pstmt;
	private Statement stmt;
	private ResultSet rs;
	
	public MapDao() {
		db = new ClsDBCP();
		mSQL = new MapSQL();
	}
	
	public ArrayList<MapVO> getMapInfo(){
		ArrayList<MapVO> list = new ArrayList<MapVO>();
		con = db.getCon();
		stmt = db.getSTMT(con);
		String sql = mSQL.getSQL(mSQL.SEL_MAPINFO_ALL);
		
		try {
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				MapVO mVO = new MapVO();
				mVO.setAno(rs.getInt("ano"));
				mVO.setAname(rs.getString("aname"));
				mVO.setAx(rs.getDouble("ax"));
				mVO.setAy(rs.getDouble("ay"));
				list.add(mVO);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.close(rs);
			db.close(stmt);
			db.close(con);
		}
		return list;
	}
}
