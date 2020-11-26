package com.Team03Proj.www.sql;

public class MemberSQL {
	public final int SEL_LOGIN_CNT 	= 1001;
	public final int SEL_ID_CNT 	= 1002;
	public final int SEL_ID_INFO 	= 1004;
	
	public final int EDIT_MEMB 		= 2001;
	public final int DEL_MEMB 		= 2002;
	
	public final int ADD_MEMB 		= 3001;
	
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_LOGIN_CNT:
			buff.append("SELECT ");
			buff.append("	count(*) cnt ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	id = ? ");
			buff.append("	AND pw = ? ");
			buff.append("	AND isshow = 'Y' ");
			break;
		}
		return buff.toString();
	}
}
