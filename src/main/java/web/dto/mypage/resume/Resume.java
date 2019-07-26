package web.dto.mypage.resume;

import java.util.Date;

public class Resume {
	
	private int resume_no;
	private int member_no;
	private int main_resume;
	private String resume_title;
	private String resume_stored_name;
	private String resume_name;
	private String resume_birth;
	private String resume_gender;
	private String resume_email;
	private String resume_phone;
	private String resume_cellphone;
	private String resume_addr;
	private Date resume_writendate;
	
	@Override
	public String toString() {
		return "Resume [resume_no=" + resume_no + ", member_no=" + member_no + ", main_resume=" + main_resume
				+ ", resume_title=" + resume_title + ", resume_stored_name=" + resume_stored_name + ", resume_name="
				+ resume_name + ", resume_birth=" + resume_birth + ", resume_gender=" + resume_gender
				+ ", resume_email=" + resume_email + ", resume_phone=" + resume_phone + ", resume_cellphone="
				+ resume_cellphone + ", resume_addr=" + resume_addr + ", resume_writendate=" + resume_writendate + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getMain_resume() {
		return main_resume;
	}
	public void setMain_resume(int main_resume) {
		this.main_resume = main_resume;
	}
	public String getResume_title() {
		return resume_title;
	}
	public void setResume_title(String resume_title) {
		this.resume_title = resume_title;
	}
	public String getResume_stored_name() {
		return resume_stored_name;
	}
	public void setResume_stored_name(String resume_stored_name) {
		this.resume_stored_name = resume_stored_name;
	}
	public String getResume_name() {
		return resume_name;
	}
	public void setResume_name(String resume_name) {
		this.resume_name = resume_name;
	}
	public String getResume_birth() {
		return resume_birth;
	}
	public void setResume_birth(String resume_birth) {
		this.resume_birth = resume_birth;
	}
	public String getResume_gender() {
		return resume_gender;
	}
	public void setResume_gender(String resume_gender) {
		this.resume_gender = resume_gender;
	}
	public String getResume_email() {
		return resume_email;
	}
	public void setResume_email(String resume_email) {
		this.resume_email = resume_email;
	}
	public String getResume_phone() {
		return resume_phone;
	}
	public void setResume_phone(String resume_phone) {
		this.resume_phone = resume_phone;
	}
	public String getResume_cellphone() {
		return resume_cellphone;
	}
	public void setResume_cellphone(String resume_cellphone) {
		this.resume_cellphone = resume_cellphone;
	}
	public String getResume_addr() {
		return resume_addr;
	}
	public void setResume_addr(String resume_addr) {
		this.resume_addr = resume_addr;
	}
	public Date getResume_writendate() {
		return resume_writendate;
	}
	public void setResume_writendate(Date resume_writendate) {
		this.resume_writendate = resume_writendate;
	}
	
	

}
