package com.Team03Proj.www.sql;

public class JoinSQL {
	public final int SEL_LOGIN_CNT 	= 1001;
	public final int SEL_CK_ID	=	1002;
	
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
		case SEL_CK_ID:
			buff.append("SELECT ");
			buff.append("	COUNT(*) cnt ");
			buff.append("FROM ");
			buff.append("	member ");
			buff.append("WHERE ");
			buff.append("	id = ? ");
			break;
		case ADD_MEMB:
			buff.append("INSERT INTO ");
			buff.append("	member(mno, id, mname, pw, mail, gen, blood1, blood2, birth, sos) ");
			buff.append("VALUES( ");
			buff.append("	( ");
			buff.append("		SELECT NVL(MAX(mno) + 1, 1001) FROM member ");
			buff.append("	), ");
			buff.append("	?, ?, ?, ?, ?, ?, ?, ?,? ");
			buff.append(") ");
			break;
		}
		
		return buff.toString();
	}
	

}
