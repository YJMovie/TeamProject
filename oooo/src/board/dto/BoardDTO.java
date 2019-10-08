package board.dto;

import java.sql.Date;

public class BoardDTO {
	private int num;
	private String title;
	private String genre;
	private String postfname;
	private String photofname;
	private double mark;
	private String review;
	private String actor;
	private String director;
	private String lines;
	private Date open;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getPostfname() {
		return postfname;
	}
	public void setPostfname(String postfname) {
		this.postfname = postfname;
	}
	public String getPhotofname() {
		return photofname;
	}
	public void setPhotofname(String photofname) {
		this.photofname = photofname;
	}
	public double getMark() {
		return mark;
	}
	public void setMark(double mark) {
		this.mark = mark;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public String getActor() {
		return actor;
	}
	public void setActor(String actor) {
		this.actor = actor;
	}
	public String getDirector() {
		return director;
	}
	public void setDirector(String director) {
		this.director = director;
	}
	public String getLines() {
		return lines;
	}
	public void setLines(String lines) {
		this.lines = lines;
	}
	public Date getOpen() {
		return open;
	}
	public void setOpen(Date open) {
		this.open = open;
	}
	@Override
	public String toString() {
		return "BoardDTO [num=" + num + ", title=" + title + ", genre=" + genre + ", postfname=" + postfname
				+ ", photofname=" + photofname + ", mark=" + mark + ", review=" + review + ", actor=" + actor
				+ ", director=" + director + ", lines=" + lines + ", open=" + open + "]";
	}
}
