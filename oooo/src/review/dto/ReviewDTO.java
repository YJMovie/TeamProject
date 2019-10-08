package review.dto;

import java.sql.Date;

public class ReviewDTO {
	private int rnum;
	private String writer;
	private Date rtime;
	private double rmark;
	private String rcomment;
	private int ref;
	private int movie_num;
	public int getMovie_num() {
		return movie_num;
	}
	public void setMovie_num(int movie_num) {
		this.movie_num = movie_num;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRtime() {
		return rtime;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
	public double getRmark() {
		return rmark;
	}
	public void setRmark(double rmark) {
		this.rmark = rmark;
	}
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
	}
	@Override
	public String toString() {
		return "ReviewDTO [rnum=" + rnum + ", writer=" + writer + ", rtime=" + rtime + ", rmark=" + rmark
				+ ", rcomment=" + rcomment + ", ref=" + ref + ", movie_num=" + movie_num + "]";
	}
}
