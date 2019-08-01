package web.dto.mypage.resume;

import java.util.Date;

public class Language {
	
	private int resume_no;
	private int numbers;
	private String language_classification;
	private String language_name;
	private String standardized_tests;
	private String language_score;
	private String conversational_ability;
	private String acquisition_date;
	
	@Override
	public String toString() {
		return "Language [resume_no=" + resume_no + ", language_classification=" + language_classification
				+ ", language_name=" + language_name + ", conversational_ability=" + conversational_ability
				+ ", standardized_tests=" + standardized_tests + ", language_score=" + language_score
				+ ", acquisition_date=" + acquisition_date + "]";
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
	
	public String getConversational_ability() {
		return conversational_ability;
	}
	public void setConversational_ability(String conversational_ability) {
		this.conversational_ability = conversational_ability;
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
	public String getAcquisition_date() {
		return acquisition_date;
	}
	public void setAcquisition_date(String acquisition_date) {
		this.acquisition_date = acquisition_date;
	}
	
	

}
