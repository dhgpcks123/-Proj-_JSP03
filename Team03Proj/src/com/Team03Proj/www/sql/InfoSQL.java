package com.Team03Proj.www.sql;

public class InfoSQL {
	public final int SEL_STORE	=	1001;
	public final int SEL_REVIEW	=	1002;
	public final int SEL_REVIEW_PHOTO	=	1003;
	
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
		   buff.append(" 	id, rno, review.rpno, rtitle, rbody, rdate, rhit, rgrade   ");
		   buff.append("     FROM   ");
		   buff.append(" review, member ");
		   buff.append("     WHERE   ");
		   buff.append("         rx=?  ");
		   buff.append("         AND review.mno = member.mno ");
		   buff.append("         AND ry=? ");
		   buff.append("         AND review.isshow='Y' ");
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
		}
		
		return buff.toString();
	}
}
