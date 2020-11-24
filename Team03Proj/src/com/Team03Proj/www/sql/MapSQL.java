package com.Team03Proj.www.sql;

public class MapSQL {
	public final int SEL_MAPINFO_ALL	=	1001;
	
	public String getSQL(int code) {
		StringBuffer buff = new StringBuffer();
		switch(code) {
		case SEL_MAPINFO_ALL:
			buff.append("SELECT ");
			buff.append("	ano, aname, ax, ay ");
			buff.append("FROM ");
			buff.append("	areainfo ");
		break;
		}
		return buff.toString();
	}
}
