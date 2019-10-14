package movie.dto;

import java.sql.Date;

public class MovieDTO {
	private int movienum; 
	private String moviecode;
	private int moviestep;
	private int movielevel;
	private String title; 
	private String grcode;
	private double score;
	private String pscode;
	private String lines; 
	private Date open;
	public int getMovienum() {
		return movienum;
	}
	public void setMovienum(int movienum) {
		this.movienum = movienum;
	}
	public String getMoviecode() {
		return moviecode;
	}
	public void setMoviecode(String moviecode) {
		this.moviecode = moviecode;
	}
	public int getMoviestep() {
		return moviestep;
	}
	public void setMoviestep(int moviestep) {
		this.moviestep = moviestep;
	}
	public int getMovielevel() {
		return movielevel;
	}
	public void setMovielevel(int movielevel) {
		this.movielevel = movielevel;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getGrcode() {
		return grcode;
	}
	public void setGrcode(String grcode) {
		this.grcode = grcode;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public String getPscode() {
		return pscode;
	}
	public void setPscode(String pscode) {
		this.pscode = pscode;
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
		return "MovieDTO [movienum=" + movienum + ", moviecode=" + moviecode + ", moviestep=" + moviestep
				+ ", movielevel=" + movielevel + ", title=" + title + ", grcode=" + grcode + ", score=" + score
				+ ", pscode=" + pscode + ", lines=" + lines + ", open=" + open + "]";
	}
}
