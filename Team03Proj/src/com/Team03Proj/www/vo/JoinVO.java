package com.Team03Proj.www.vo;

import java.sql.Date;
import java.sql.Time;
import java.text.*;

public class JoinVO {
	private int mno;
	private String id, mname, pw, mail, tel, gen, joindate, blood1, blood2, birth, sos;
	private Date joinDate;
	private Time joinTime;
	public int getMno() {
		return mno;
	}
	public void setMno(int mno) {
		this.mno = mno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGen() {
		return gen;
	}
	public void setGen(String gen) {
		this.gen = gen;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate() {
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat form2 = new SimpleDateFormat("HH:mm:ss");
		this.joindate = form1.format(joinDate) + " " + form2.format(joinTime);
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getBlood1() {
		return blood1;
	}
	public void setBlood1(String blood1) {
		this.blood1 = blood1;
	}
	public String getBlood2() {
		return blood2;
	}
	public void setBlood2(String blood2) {
		this.blood2 = blood2;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSos() {
		return sos;
	}
	public void setSos(String sos) {
		this.sos = sos;
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
		setJoindate();

	}
}
