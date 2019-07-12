package web.dto.mypage.resume;

import java.util.Date;

public class Activities {
	
	private int resume_no;
	private String activity_classification;
	private String institution_name;
	private Date start_date;
	private Date end_date;
	private String activity_content;
	
	@Override
	public String toString() {
		return "Activities [resume_no=" + resume_no + ", activity_classification=" + activity_classification
				+ ", institution_name=" + institution_name + ", start_date=" + start_date + ", end_date=" + end_date
				+ ", activity_content=" + activity_content + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getActivity_classification() {
		return activity_classification;
	}
	public void setActivity_classification(String activity_classification) {
		this.activity_classification = activity_classification;
	}
	public String getInstitution_name() {
		return institution_name;
	}
	public void setInstitution_name(String institution_name) {
		this.institution_name = institution_name;
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
	public String getActivity_content() {
		return activity_content;
	}
	public void setActivity_content(String activity_content) {
		this.activity_content = activity_content;
	}
	
	

}
