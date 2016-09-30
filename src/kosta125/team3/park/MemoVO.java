package kosta125.team3.park;

import java.sql.Timestamp;

public class MemoVO {

	private int memoNum;
	private String subject, content, pass;
	private Timestamp memoTime;
	
	public int getMemoNum() {
		return memoNum;
	}
	public void setMemoNum(int memoNum) {
		this.memoNum = memoNum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public Timestamp getMemoTime() {
		return memoTime;
	}
	public void setMemoTime(Timestamp memoTime) {
		this.memoTime = memoTime;
	}
	
}
