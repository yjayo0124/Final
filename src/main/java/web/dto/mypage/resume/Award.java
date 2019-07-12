package web.dto.mypage.resume;

import java.util.Date;

public class Award {
	
	private int resume_no;
	private String award_name;
	private String award_service;
	private Date award_date;
	private String award_content;
	
	@Override
	public String toString() {
		return "Award [resume_no=" + resume_no + ", award_name=" + award_name + ", award_service="
				+ award_service + ", award_date=" + award_date + ", award_content=" + award_content + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getAward_name() {
		return award_name;
	}
	public void setAward_name(String award_name) {
		this.award_name = award_name;
	}
	public String getAward_service() {
		return award_service;
	}
	public void setAward_service(String award_service) {
		this.award_service = award_service;
	}
	public Date getAward_date() {
		return award_date;
	}
	public void setAward_date(Date award_date) {
		this.award_date = award_date;
	}
	public String getAward_content() {
		return award_content;
	}
	public void setAward_content(String award_content) {
		this.award_content = award_content;
	}
	
	
}
