package movie.dto;

public class MovieCodeDTO {
	private String mvcode;
	private String grcode;
	private String pscode;
	public String getMvcode() {
		return mvcode;
	}
	public void setMvcode(String mvcode) {
		this.mvcode = mvcode;
	}
	public String getGrcode() {
		return grcode;
	}
	public void setGrcode(String grcode) {
		this.grcode = grcode;
	}
	public String getPscode() {
		return pscode;
	}
	public void setPscode(String pscode) {
		this.pscode = pscode;
	}
	@Override
	public String toString() {
		return "MovieCodeDTO [mvcode=" + mvcode + ", grcode=" + grcode + ", pscode=" + pscode + "]";
	}
}
