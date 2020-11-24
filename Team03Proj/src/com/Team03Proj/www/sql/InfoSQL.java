package com.Team03Proj.www.sql;

public class InfoSQL {
	public final int SEL_STORE	=	1001;
	public final int SEL_REVIEW	=	1002;
	public final int SEL_REVIEW_PHOTO	=	1003;
	
	public final int ADD_REVIEW = 2001;
	public final int ADD_REVIEW_FILE = 2002;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_STORE:
			buff.append("SELECT "); 
			buff.append("    * "); 
			buff.append("FROM "); 
			buff.append("    areainfo, aphoto "); 
			buff.append("WHERE "); 
			buff.append("   areainfo.apno = aphoto.apno "); 
			buff.append("    AND ax=? "); 
			buff.append("    AND ay=? "); 
			buff.append("    AND isshow='Y' "); 
			break;
		case SEL_REVIEW:
		   buff.append(" SELECT  ");
		   buff.append(" 	id, rno, review.rpno rpno, rtitle, rbody, rdate, rhit, rgrade, rx, ry   ");
		   buff.append("     FROM   ");
		   buff.append(" review, member ");
		   buff.append("     WHERE   ");
		   buff.append("         rx=?  ");
		   buff.append("         AND review.mno = member.mno ");
		   buff.append("         AND ry=? ");
		   buff.append("         AND review.isshow='Y' ");
		   buff.append("ORDER BY ");
		   buff.append("	 rdate DESC ");
		   break;
		case SEL_REVIEW_PHOTO:
			buff.append(" SELECT "); 
			buff.append("  rno, rponame, rpsname, rpdir "); 
			buff.append(" FROM "); 
			buff.append("      review, rphoto"); 
			buff.append(" WHERE "); 
			buff.append("     rphoto.rpno = review.rpno "); 
			buff.append("     AND rx=? "); 
			buff.append("     AND ry=? "); 
			buff.append("     AND review.isshow='Y' ");
			break;
		case ADD_REVIEW:
			buff.append(" INSERT INTO review ");
			buff.append(" VALUES(  ");
			buff.append("     (SELECT (MAX(NVL(rno+1, 1))) FROM review), ");
			buff.append("     (SELECT mno FROM member WHERE id = ? ), ");
			buff.append("     ?, ?, ");
			buff.append("     (SELECT (MAX(NVL(rpno+1, 1))) FROM review), ");
			buff.append("     sysdate, ?, 0, 'Y', ?, ? ");
			buff.append(" ) ");
			break;
		case ADD_REVIEW_FILE:
			buff.append(" INSERT INTO rphoto(rpno, rponame, rpsname, rpsize, rpdir, rtno) ");
			buff.append(" VALUES( ");
			buff.append("    ?, ?, ?, ?, ?, ?) ");
		}
		
		return buff.toString();
	}
}
