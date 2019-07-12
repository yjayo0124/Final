package web.dto.mypage.resume;

import java.util.Date;

public class Education {
	
	private int resume_no;
	private String training_title;
	private String education_facilities;
	private Date start_date;
	private Date end_date;
	private String training_content;
	
	@Override
	public String toString() {
		return "Education [resume_no=" + resume_no + ", training_title=" + training_title + ", education_facilities="
				+ education_facilities + ", start_date=" + start_date + ", end_date=" + end_date + ", training_content="
				+ training_content + "]";
	}
	
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getTraining_title() {
		return training_title;
	}
	public void setTraining_title(String training_title) {
		this.training_title = training_title;
	}
	public String getEducation_facilities() {
		return education_facilities;
	}
	public void setEducation_facilities(String education_facilities) {
		this.education_facilities = education_facilities;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getTraining_content() {
		return training_content;
	}
	public void setTraining_content(String training_content) {
		this.training_content = training_content;
	}
	
	

}
