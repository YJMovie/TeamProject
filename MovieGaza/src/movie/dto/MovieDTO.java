package movie.dto;

import java.sql.Date;

public class MovieDTO {
	private String moviecode;
	private String title;
	private double score;
	private Date open;
	private String lines;
	public String getMoviecode() {
		return moviecode;
	}
	public void setMoviecode(String moviecode) {
		this.moviecode = moviecode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	public Date getOpen() {
		return open;
	}
	public void setOpen(Date open) {
		this.open = open;
	}
	public String getLines() {
		return lines;
	}
	public void setLines(String lines) {
		this.lines = lines;
	}
	@Override
	public String toString() {
		return "MovieDTO [moviecode=" + moviecode + ", title=" + title + ", score=" + score + ", open=" + open
				+ ", lines=" + lines + "]";
	}
	
}
