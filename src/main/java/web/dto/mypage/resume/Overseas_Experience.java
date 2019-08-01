package web.dto.mypage.resume;

import java.util.Date;

public class Overseas_Experience {
	
	private int resume_no;
	private int numbers;
	private String country_name;
	private String start_date;
	private String end_date;
	private String overseas_experience_content;
	
	@Override
	public String toString() {
		return "Overseas_Experience [resume_no=" + resume_no + ", country_name=" + country_name + ", start_date="
				+ start_date + ", end_date=" + end_date + ", overseas_experience_content=" + overseas_experience_content
				+ "]";
	}

	public int getNumbers() {
		return numbers;
	}
	public void setNumbers(int numbers) {
		this.numbers = numbers;
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getCountry_name() {
		return country_name;
	}
	public void setCountry_name(String country_name) {
		this.country_name = country_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public String getOverseas_experience_content() {
		return overseas_experience_content;
	}
	public void setOverseas_experience_content(String overseas_experience_content) {
		this.overseas_experience_content = overseas_experience_content;
	}
	
	

}
