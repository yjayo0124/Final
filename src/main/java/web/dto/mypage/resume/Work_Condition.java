package web.dto.mypage.resume;

public class Work_Condition {
	
	private int resume_no;
	private String forms_employment;
	private int salary;
	private String desired_work_place;
	private String job_keywords;
	
	@Override
	public String toString() {
		return "Work_Condition [resume_no=" + resume_no + ", forms_employment=" + forms_employment + ", salary="
				+ salary + ", desired_work_place=" + desired_work_place + ", job_keywords=" + job_keywords + "]";
	}
	
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getForms_employment() {
		return forms_employment;
	}
	public void setForms_employment(String forms_employment) {
		this.forms_employment = forms_employment;
	}
	public int getSalary() {
		return salary;
	}
	public void setSalary(int salary) {
		this.salary = salary;
	}
	public String getDesired_work_place() {
		return desired_work_place;
	}
	public void setDesired_work_place(String desired_work_place) {
		this.desired_work_place = desired_work_place;
	}
	public String getJob_keywords() {
		return job_keywords;
	}
	public void setJob_keywords(String job_keywords) {
		this.job_keywords = job_keywords;
	}
	
	
	

}
