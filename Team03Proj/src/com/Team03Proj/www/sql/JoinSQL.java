package com.Team03Proj.www.sql;

public class JoinSQL {
	public final int SEL_CK_ID	=	1001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_CK_ID:
			buff.append("SELECT ");
			buff.append("	COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	id = ? ");
			break;
		}
		
		return buff.toString();
	}
}
