package web.dto;

public class Recruit_file {
	private int recruit_file_no;
	private String recruit_file_storedname;
	private String recruit_file_originname;
	private int recruit_no;
	
	@Override
	public String toString() {
		return "Recruit_file [recruit_file_no=" + recruit_file_no + ", recruit_file_storedname="
				+ recruit_file_storedname + ", recruit_file_originname=" + recruit_file_originname + ", recruit_no="
				+ recruit_no + "]";
	}
	public int getRecruit_file_no() {
		return recruit_file_no;
	}
	public void setRecruit_file_no(int recruit_file_no) {
		this.recruit_file_no = recruit_file_no;
	}
	public String getRecruit_file_storedname() {
		return recruit_file_storedname;
	}
	public void setRecruit_file_storedname(String recruit_file_storedname) {
		this.recruit_file_storedname = recruit_file_storedname;
	}
	public String getRecruit_file_originname() {
		return recruit_file_originname;
	}
	public void setRecruit_file_originname(String recruit_file_originname) {
		this.recruit_file_originname = recruit_file_originname;
	}
	public int getRecruit_no() {
		return recruit_no;
	}
	public void setRecruit_no(int recruit_no) {
		this.recruit_no = recruit_no;
	}

	
}