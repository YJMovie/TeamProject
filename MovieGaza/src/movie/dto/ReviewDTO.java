package movie.dto;

import java.sql.Date;

public class ReviewDTO {
	private int r_num;
	private Date r_date;
	private double r_score;
	private String r_comment;
	private String r_mvcode;
	private String writer;
	public int getR_num() {
		return r_num;
	}
	public void setR_num(int r_num) {
		this.r_num = r_num;
	}
	public Date getR_date() {
		return r_date;
	}
	public void setR_date(Date r_date) {
		this.r_date = r_date;
	}
	public double getR_score() {
		return r_score;
	}
	public void setR_score(double r_score) {
		this.r_score = r_score;
	}
	public String getR_comment() {
		return r_comment;
	}
	public void setR_comment(String r_comment) {
		this.r_comment = r_comment;
	}
	public String getR_mvcode() {
		return r_mvcode;
	}
	public void setR_mvcode(String r_mvcode) {
		this.r_mvcode = r_mvcode;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	@Override
	public String toString() {
		return "ReviewDTO [r_num=" + r_num + ", r_date=" + r_date + ", r_score=" + r_score + ", comment=" + r_comment
				+ ", r_mvcode=" + r_mvcode + ", writer=" + writer + "]";
	}
}
