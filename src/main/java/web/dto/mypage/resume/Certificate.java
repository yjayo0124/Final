package web.dto.mypage.resume;


public class Certificate {

	private int resume_no;
	private String certificate_name;
	private String place_issue;
	private String acquisition_date;
	
	@Override
	public String toString() {
		return "Certificate [resume_no=" + resume_no + ", certificate_name=" + certificate_name + ", place_issue="
				+ place_issue + ", acquisition_date=" + acquisition_date + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getCertificate_name() {
		return certificate_name;
	}
	public void setCertificate_name(String certificate_name) {
		this.certificate_name = certificate_name;
	}
	public String getPlace_issue() {
		return place_issue;
	}
	public void setPlace_issue(String place_issue) {
		this.place_issue = place_issue;
	}
	public String getAcquisition_date() {
		return acquisition_date;
	}
	public void setAcquisition_date(String acquisition_date) {
		this.acquisition_date = acquisition_date;
	}
	
	
	
	
	
}
