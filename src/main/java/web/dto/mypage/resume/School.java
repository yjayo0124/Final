package web.dto.mypage.resume;

public class School {
	
	private int resume_no;
	private String less_than_high;
	
	private String school_classification;
	private String school_name;
	private String graduation_date;
	private String graduation_status;
	private String ged_status;
	
	private String academic_degree;
	private String admission_date;
	private String transfer_status;
	private String major_name;
	private int credit;
	private int total_score;
	private String sub_major_status;
	private String sub_major;
	private String sub_major_name;
	private String graduation_thesis_status;
	private String graduation_thesis_content;
	
	@Override
	public String toString() {
		return "High_School [resume_no=" + resume_no + ", less_than_high=" + less_than_high + ", school_calssification="
				+ school_classification + ", school_name=" + school_name + ", graduation_date=" + graduation_date
				+ ", graduation_status=" + graduation_status + ", ged_status=" + ged_status + ", academic_degree=" + academic_degree + ", admission_date=" + admission_date
				+ ", transfer_status=" + transfer_status + ", major_name=" + major_name + ", credit=" + credit
				+ ", total_score=" + total_score + ", sub_major_status=" + sub_major_status + ", sub_major=" + sub_major
				+ ", sub_major_name=" + sub_major_name + ", graduation_thesis_status=" + graduation_thesis_status
				+ ", graduation_thesis_content=" + graduation_thesis_content + "]";
	}
	
	public String getSchool_classification() {
		return school_classification;
	}
	public void setSchool_classification(String school_classification) {
		this.school_classification = school_classification;
	}
	public String getAcademic_degree() {
		return academic_degree;
	}
	public void setAcademic_degree(String academic_degree) {
		this.academic_degree = academic_degree;
	}
	public String getAdmission_date() {
		return admission_date;
	}
	public void setAdmission_date(String admission_date) {
		this.admission_date = admission_date;
	}
	public String getTransfer_status() {
		return transfer_status;
	}
	public void setTransfer_status(String transfer_status) {
		this.transfer_status = transfer_status;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getTotal_score() {
		return total_score;
	}
	public void setTotal_score(int total_score) {
		this.total_score = total_score;
	}
	public String getSub_major_status() {
		return sub_major_status;
	}
	public void setSub_major_status(String sub_major_status) {
		this.sub_major_status = sub_major_status;
	}
	public String getSub_major() {
		return sub_major;
	}
	public void setSub_major(String sub_major) {
		this.sub_major = sub_major;
	}
	public String getSub_major_name() {
		return sub_major_name;
	}
	public void setSub_major_name(String sub_major_name) {
		this.sub_major_name = sub_major_name;
	}
	public String getGraduation_thesis_status() {
		return graduation_thesis_status;
	}
	public void setGraduation_thesis_status(String graduation_thesis_status) {
		this.graduation_thesis_status = graduation_thesis_status;
	}
	public String getGraduation_thesis_content() {
		return graduation_thesis_content;
	}
	public void setGraduation_thesis_content(String graduation_thesis_content) {
		this.graduation_thesis_content = graduation_thesis_content;
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
	public String getSchool_name() {
		return school_name;
	}
	public void setSchool_name(String school_name) {
		this.school_name = school_name;
	}
	public String getGraduation_date() {
		return graduation_date;
	}
	public void setGraduation_date(String graduation_date) {
		this.graduation_date = graduation_date;
	}
	public String getGraduation_status() {
		return graduation_status;
	}
	public void setGraduation_status(String graduation_status) {
		this.graduation_status = graduation_status;
	}
	public String getGed_status() {
		return ged_status;
	}
	public void setGed_status(String ged_status) {
		this.ged_status = ged_status;
	}
	
	

}