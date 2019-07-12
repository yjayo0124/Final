package web.dto.mypage.resume;

import java.util.Date;

public class High_School {
	
	private int resume_no;
	private String less_than_high;
	private String school_calssification;
	private String school_name;
	private Date graduation_date;
	private Date graduation_status;
	private String ged_status;
	
	@Override
	public String toString() {
		return "High_School [resume_no=" + resume_no + ", less_than_high=" + less_than_high
				+ ", school_calssification=" + school_calssification + ", school_name=" + school_name
				+ ", graduation_date=" + graduation_date + ", graduation_status=" + graduation_status + ", ged_status="
				+ ged_status + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getLess_than_high() {
		return less_than_high;
	}
	public void setLess_than_high(String less_than_high) {
		this.less_than_high = less_than_high;
	}
	public String getSchool_calssification() {
		return school_calssification;
	}
	public void setSchool_calssification(String school_calssification) {
		this.school_calssification = school_calssification;
	}
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public Date getGraduation_date() {
		return graduation_date;
	}
	public void setGraduation_date(Date graduation_date) {
		this.graduation_date = graduation_date;
	}
	public Date getGraduation_status() {
		return graduation_status;
	}
	public void setGraduation_status(Date graduation_status) {
		this.graduation_status = graduation_status;
	}
	public String getGed_status() {
		return ged_status;
	}
	public void setGed_status(String ged_status) {
		this.ged_status = ged_status;
	}
	
	

}
