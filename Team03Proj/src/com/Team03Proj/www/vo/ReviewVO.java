package com.Team03Proj.www.vo;

import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ReviewVO {
	 private int ano, rpno, rhit, rtno, rgrade, rno;
	 private String review, rtitle, rbody, rdate, id;
	 private Date joinDate;
	 private Time joinTime;
	 private ArrayList<RphotoVO> rphotovoList;
	 
	 
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRgrade() {
		return rgrade;
	}
	public void setRgrade(int rgrade) {
		this.rgrade = rgrade;
	}
	public int getAno() {
		return ano;
	}
	public void setAno(int ano) {
		this.ano = ano;
	}
	public int getRpno() {
		return rpno;
	}
	public void setRpno(int rpno) {
		this.rpno = rpno;
	}
	public int getRhit() {
		return rhit;
	}
	public void setRhit(int rhit) {
		this.rhit = rhit;
	}
	public int getRtno() {
		return rtno;
	}
	public void setRtno(int rtno) {
		this.rtno = rtno;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRbody() {
		return rbody;
	}
	public void setRbody(String rbody) {
		this.rbody = rbody;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat("hh:mm:ss");
		rdate = form1.format(joinDate)+" "+form2.format(joinTime);
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Time getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Time joinTime) {
		this.joinTime = joinTime;
		setRdate();
	}
	public ArrayList<RphotoVO> getRphotovoList() {
		return rphotovoList;
	}
	public void setRphotovoList(ArrayList<RphotoVO> rphotovoList) {
		this.rphotovoList = rphotovoList;
	}
	
	 
}
