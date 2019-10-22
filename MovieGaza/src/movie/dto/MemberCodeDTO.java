package movie.dto;

public class MemberCodeDTO {
	private String mem_userid;
	private String mem_mvcode;
	private String mem_grcode;
	private String mem_pscode;
	public String getMem_userid() {
		return mem_userid;
	}
	public void setMem_userid(String mem_userid) {
		this.mem_userid = mem_userid;
	}
	public String getMem_mvcode() {
		return mem_mvcode;
	}
	public void setMem_mvcode(String mem_mvcode) {
		this.mem_mvcode = mem_mvcode;
	}
	public String getMem_grcode() {
		return mem_grcode;
	}
	public void setMem_grcode(String mem_grcode) {
		this.mem_grcode = mem_grcode;
	}
	public String getMem_pscode() {
		return mem_pscode;
	}
	public void setMem_pscode(String mem_pscode) {
		this.mem_pscode = mem_pscode;
	}
	@Override
	public String toString() {
		return "MemberCodeDTO [mem_userid=" + mem_userid + ", mem_mvcode=" + mem_mvcode + ", mem_grcode=" + mem_grcode
				+ ", mem_pscode=" + mem_pscode + "]";
	}
}
