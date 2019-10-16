package member.dto;

import java.sql.Date;

public class MemberDTO {
	private int inum;
	private String name;
	private String userid;
	private String userpwd;
	private String gender;
	private String phone;
	private String address;
	private String email;
	private Date userdate;
	private int usergrade;
	public int getInum() {
		return inum;
	}
	public void setInum(int inum) {
		this.inum = inum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpwd() {
		return userpwd;
	}
	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getUserdate() {
		return userdate;
	}
	public void setUserdate(Date userdate) {
		this.userdate = userdate;
	}
	public int getUsergrade() {
		return usergrade;
	}
	public void setUsergrade(int usergrade) {
		this.usergrade = usergrade;
	}
	@Override
	public String toString() {
		return "MemberDTO [inum=" + inum + ", name=" + name + ", userid=" + userid + ", userpwd=" + userpwd + ", gender="
				+ gender + ", phone=" + phone + ", address=" + address + ", email=" + email + ", userdate=" + userdate
				+ ", usergrade=" + usergrade + "]";
	}
}
