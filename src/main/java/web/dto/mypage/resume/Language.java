package web.dto.mypage.resume;

import java.util.Date;

public class Language {
	
	private int resume_no;
	private String language_classification;
	private String language_name;
	private String conversation_ability;
	private String standardized_tests;
	private String language_score;
	private Date acquisition_date;
	
	@Override
	public String toString() {
		return "Language [resume_no=" + resume_no + ", language_classification=" + language_classification
				+ ", language_name=" + language_name + ", conversation_ability=" + conversation_ability
				+ ", standardized_tests=" + standardized_tests + ", language_score=" + language_score
				+ ", acquisition_date=" + acquisition_date + "]";
	}
	public int getResume_no() {
		return resume_no;
	}
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}
	public String getLanguage_classification() {
		return language_classification;
	}
	public void setLanguage_classification(String language_classification) {
		this.language_classification = language_classification;
	}
	public String getLanguage_name() {
		return language_name;
	}
	public void setLanguage_name(String language_name) {
		this.language_name = language_name;
	}
	public String getConversation_ability() {
		return conversation_ability;
	}
	public void setConversation_ability(String conversation_ability) {
		this.conversation_ability = conversation_ability;
	}
	public String getStandardized_tests() {
		return standardized_tests;
	}
	public void setStandardized_tests(String standardized_tests) {
		this.standardized_tests = standardized_tests;
	}
	public String getLanguage_score() {
		return language_score;
	}
	public void setLanguage_score(String language_score) {
		this.language_score = language_score;
	}
	public Date getAcquisition_date() {
		return acquisition_date;
	}
	public void setAcquisition_date(Date acquisition_date) {
		this.acquisition_date = acquisition_date;
	}
	
	

}
