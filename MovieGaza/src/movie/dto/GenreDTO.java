package movie.dto;

public class GenreDTO {
	private String genrecode;
	private String genrename;
	public String getGenrecode() {
		return genrecode;
	}
	public void setGenrecode(String genrecode) {
		this.genrecode = genrecode;
	}
	public String getGenrename() {
		return genrename;
	}
	public void setGenrename(String genrename) {
		this.genrename = genrename;
	}
	@Override
	public String toString() {
		return "GenreDTO [genrecode=" + genrecode + ", genrename=" + genrename + "]";
	}
}
