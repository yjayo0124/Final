package web.dto.mypage.resume;

public class Preferential {
	
	private int resume_no;
	private String veterans;
	private String protect;
	private String funding;
	private String disorder;
	private String military;
	
	@Override
	public String toString() {
		return "Preferential [resume_no=" + resume_no + ", veterans=" + veterans + ", protect=" + protect + ", funding="
				+ funding + ", disorder=" + disorder + ", military=" + military + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getVeterans() {
		return veterans;
	}
	public void setVeterans(String veterans) {
		this.veterans = veterans;
	}
	public String getProtect() {
		return protect;
	}
	public void setProtect(String protect) {
		this.protect = protect;
	}
	public String getFunding() {
		return funding;
	}
	public void setFunding(String funding) {
		this.funding = funding;
	}
	public String getDisorder() {
		return disorder;
	}
	public void setDisorder(String disorder) {
		this.disorder = disorder;
	}
	public String getMilitary() {
		return military;
	}
	public void setMilitary(String military) {
		this.military = military;
	}
	
	

}
