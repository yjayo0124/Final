package web.dto.mypage.resume;

import java.util.Arrays;

public class FormData {
	
	private int resume_no;
	
	private String[] school_numbers;
	private String[] school_classification;
	private String[] school_name;
	private String[] graduation_date;
	private String[] graduation_status;
	private String[] ged_status;
	private String[] academic_degree;
	private String[] admission_date;
	private String[] transfer_status;
	private String[] major_name;
	private String[] credit;
	private String[] total_score;
	private String[] sub_major_status;
	private String[] sub_major_name;
	private String[] graduation_thesis_content;
	
	private String[] career_numbers;
	private String[] company_name;
	private String[] department_name;
	private String[] hire_date;
	private String[] retirement_date;
	private String[] served_status;
	private String[] position;
	private String[] job_work;
	private String[] career_salary;
	private String[] assigned_task;
	
	private String[] activities_numbers;
	private String[] activity_classification;
	private String[] institution_name;
	private String[] activity_start_date;
	private String[] activity_end_date;
	private String[] activity_content;

	private String[] education_numbers;
	private String[] training_title;
	private String[] educational_facilities;
	private String[] education_start_date;
	private String[] education_end_date;
	private String[] training_content;

	private String[] certificate_numbers;
	private String[] certificate_name;
	private String[] place_issue;
	private String[] certificate_acquisition_date;

	private String[] award_numbers;
	private String[] award_name;
	private String[] award_service;
	private String[] award_date;
	private String[] award_content;

	private String[] overseas_Experience_numbers;
	private String[] country_name;
	private String[] overseas_Experience_start_date;
	private String[] overseas_Experience_end_date;
	private String[] overseas_experience_content;

	private String[] language_numbers;
	private String[] language_classification;
	private String[] language_name;
	private String[] language_score;
	private String[] conversational_ability;
	private String[] language_acquisition_date;

	private String[] Preferential;

	@Override
	public String toString() {
		return "FormData [resume_no=" + resume_no + ", school_numbers=" + Arrays.toString(school_numbers)
				+ ", school_classification=" + Arrays.toString(school_classification) + ", school_name="
				+ Arrays.toString(school_name) + ", graduation_date=" + Arrays.toString(graduation_date)
				+ ", graduation_status=" + Arrays.toString(graduation_status) + ", ged_status="
				+ Arrays.toString(ged_status) + ", academic_degree=" + Arrays.toString(academic_degree)
				+ ", admission_date=" + Arrays.toString(admission_date) + ", transfer_status="
				+ Arrays.toString(transfer_status) + ", major_name=" + Arrays.toString(major_name) + ", credit="
				+ Arrays.toString(credit) + ", total_score=" + Arrays.toString(total_score) + ", sub_major_status="
				+ Arrays.toString(sub_major_status) + ", sub_major_name=" + Arrays.toString(sub_major_name)
				+ ", graduation_thesis_content=" + Arrays.toString(graduation_thesis_content) + ", career_numbers="
				+ Arrays.toString(career_numbers) + ", company_name=" + Arrays.toString(company_name)
				+ ", department_name=" + Arrays.toString(department_name) + ", hire_date=" + Arrays.toString(hire_date)
				+ ", retirement_date=" + Arrays.toString(retirement_date) + ", served_status="
				+ Arrays.toString(served_status) + ", position=" + Arrays.toString(position) + ", job_work="
				+ Arrays.toString(job_work) + ", career_salary=" + Arrays.toString(career_salary) + ", assigned_task="
				+ Arrays.toString(assigned_task) + ", activities_numbers=" + Arrays.toString(activities_numbers)
				+ ", activity_classification=" + Arrays.toString(activity_classification) + ", institution_name="
				+ Arrays.toString(institution_name) + ", activity_start_date=" + Arrays.toString(activity_start_date)
				+ ", activity_end_date=" + Arrays.toString(activity_end_date) + ", activity_content="
				+ Arrays.toString(activity_content) + ", education_numbers=" + Arrays.toString(education_numbers)
				+ ", training_title=" + Arrays.toString(training_title) + ", educational_facilities="
				+ Arrays.toString(educational_facilities) + ", education_start_date="
				+ Arrays.toString(education_start_date) + ", education_end_date=" + Arrays.toString(education_end_date)
				+ ", training_content=" + Arrays.toString(training_content) + ", certificate_numbers="
				+ Arrays.toString(certificate_numbers) + ", certificate_name=" + Arrays.toString(certificate_name)
				+ ", place_issue=" + Arrays.toString(place_issue) + ", certificate_acquisition_date="
				+ Arrays.toString(certificate_acquisition_date) + ", award_numbers=" + Arrays.toString(award_numbers)
				+ ", award_name=" + Arrays.toString(award_name) + ", award_service=" + Arrays.toString(award_service)
				+ ", award_date=" + Arrays.toString(award_date) + ", award_content=" + Arrays.toString(award_content)
				+ ", overseas_Experience_numbers=" + Arrays.toString(overseas_Experience_numbers) + ", country_name="
				+ Arrays.toString(country_name) + ", overseas_Experience_start_date="
				+ Arrays.toString(overseas_Experience_start_date) + ", overseas_Experience_end_date="
				+ Arrays.toString(overseas_Experience_end_date) + ", overseas_experience_content="
				+ Arrays.toString(overseas_experience_content) + ", language_numbers="
				+ Arrays.toString(language_numbers) + ", language_classification="
				+ Arrays.toString(language_classification) + ", language_name=" + Arrays.toString(language_name)
				+ ", language_score=" + Arrays.toString(language_score) + ", conversational_ability="
				+ Arrays.toString(conversational_ability) + ", language_acquisition_date="
				+ Arrays.toString(language_acquisition_date) + ", Preferential=" + Arrays.toString(Preferential) + "]";
	}

	public int getResume_no() {
		return resume_no;
	}
	
	public void setResume_no(int resume_no) {
		this.resume_no = resume_no;
	}

	public String[] getSchool_numbers() {
		return school_numbers;
	}

	public void setSchool_numbers(String[] school_numbers) {
		this.school_numbers = school_numbers;
	}

	public String[] getSchool_classification() {
		return school_classification;
	}

	public void setSchool_classification(String[] school_classification) {
		this.school_classification = school_classification;
	}

	public String[] getSchool_name() {
		return school_name;
	}

	public void setSchool_name(String[] school_name) {
		this.school_name = school_name;
	}

	public String[] getGraduation_date() {
		return graduation_date;
	}

	public void setGraduation_date(String[] graduation_date) {
		this.graduation_date = graduation_date;
	}

	public String[] getGraduation_status() {
		return graduation_status;
	}

	public void setGraduation_status(String[] graduation_status) {
		this.graduation_status = graduation_status;
	}

	public String[] getGed_status() {
		return ged_status;
	}

	public void setGed_status(String[] ged_status) {
		this.ged_status = ged_status;
	}

	public String[] getAcademic_degree() {
		return academic_degree;
	}

	public void setAcademic_degree(String[] academic_degree) {
		this.academic_degree = academic_degree;
	}

	public String[] getAdmission_date() {
		return admission_date;
	}

	public void setAdmission_date(String[] admission_date) {
		this.admission_date = admission_date;
	}

	public String[] getTransfer_status() {
		return transfer_status;
	}

	public void setTransfer_status(String[] transfer_status) {
		this.transfer_status = transfer_status;
	}

	public String[] getMajor_name() {
		return major_name;
	}

	public void setMajor_name(String[] major_name) {
		this.major_name = major_name;
	}

	public String[] getCredit() {
		return credit;
	}

	public void setCredit(String[] credit) {
		this.credit = credit;
	}

	public String[] getTotal_score() {
		return total_score;
	}

	public void setTotal_score(String[] total_score) {
		this.total_score = total_score;
	}

	public String[] getSub_major_status() {
		return sub_major_status;
	}

	public void setSub_major_status(String[] sub_major_status) {
		this.sub_major_status = sub_major_status;
	}

	public String[] getSub_major_name() {
		return sub_major_name;
	}

	public void setSub_major_name(String[] sub_major_name) {
		this.sub_major_name = sub_major_name;
	}

	public String[] getGraduation_thesis_content() {
		return graduation_thesis_content;
	}

	public void setGraduation_thesis_content(String[] graduation_thesis_content) {
		this.graduation_thesis_content = graduation_thesis_content;
	}

	public String[] getCareer_numbers() {
		return career_numbers;
	}

	public void setCareer_numbers(String[] career_numbers) {
		this.career_numbers = career_numbers;
	}

	public String[] getCompany_name() {
		return company_name;
	}

	public void setCompany_name(String[] company_name) {
		this.company_name = company_name;
	}

	public String[] getDepartment_name() {
		return department_name;
	}

	public void setDepartment_name(String[] department_name) {
		this.department_name = department_name;
	}

	public String[] getHire_date() {
		return hire_date;
	}

	public void setHire_date(String[] hire_date) {
		this.hire_date = hire_date;
	}

	public String[] getRetirement_date() {
		return retirement_date;
	}

	public void setRetirement_date(String[] retirement_date) {
		this.retirement_date = retirement_date;
	}

	public String[] getServed_status() {
		return served_status;
	}

	public void setServed_status(String[] served_status) {
		this.served_status = served_status;
	}

	public String[] getPosition() {
		return position;
	}

	public void setPosition(String[] position) {
		this.position = position;
	}

	public String[] getJob_work() {
		return job_work;
	}

	public void setJob_work(String[] job_work) {
		this.job_work = job_work;
	}

	public String[] getCareer_salary() {
		return career_salary;
	}

	public void setCareer_salary(String[] career_salary) {
		this.career_salary = career_salary;
	}

	public String[] getAssigned_task() {
		return assigned_task;
	}

	public void setAssigned_task(String[] assigned_task) {
		this.assigned_task = assigned_task;
	}

	public String[] getActivities_numbers() {
		return activities_numbers;
	}

	public void setActivities_numbers(String[] activities_numbers) {
		this.activities_numbers = activities_numbers;
	}

	public String[] getActivity_classification() {
		return activity_classification;
	}

	public void setActivity_classification(String[] activity_classification) {
		this.activity_classification = activity_classification;
	}

	public String[] getInstitution_name() {
		return institution_name;
	}

	public void setInstitution_name(String[] institution_name) {
		this.institution_name = institution_name;
	}

	public String[] getActivity_start_date() {
		return activity_start_date;
	}

	public void setActivity_start_date(String[] activity_start_date) {
		this.activity_start_date = activity_start_date;
	}

	public String[] getActivity_end_date() {
		return activity_end_date;
	}

	public void setActivity_end_date(String[] activity_end_date) {
		this.activity_end_date = activity_end_date;
	}

	public String[] getActivity_content() {
		return activity_content;
	}

	public void setActivity_content(String[] activity_content) {
		this.activity_content = activity_content;
	}

	public String[] getEducation_numbers() {
		return education_numbers;
	}

	public void setEducation_numbers(String[] education_numbers) {
		this.education_numbers = education_numbers;
	}

	public String[] getTraining_title() {
		return training_title;
	}

	public void setTraining_title(String[] training_title) {
		this.training_title = training_title;
	}

	public String[] getEducational_facilities() {
		return educational_facilities;
	}

	public void setEducational_facilities(String[] educational_facilities) {
		this.educational_facilities = educational_facilities;
	}

	public String[] getEducation_start_date() {
		return education_start_date;
	}

	public void setEducation_start_date(String[] education_start_date) {
		this.education_start_date = education_start_date;
	}

	public String[] getEducation_end_date() {
		return education_end_date;
	}

	public void setEducation_end_date(String[] education_end_date) {
		this.education_end_date = education_end_date;
	}

	public String[] getTraining_content() {
		return training_content;
	}

	public void setTraining_content(String[] training_content) {
		this.training_content = training_content;
	}

	public String[] getCertificate_numbers() {
		return certificate_numbers;
	}

	public void setCertificate_numbers(String[] certificate_numbers) {
		this.certificate_numbers = certificate_numbers;
	}

	public String[] getCertificate_name() {
		return certificate_name;
	}

	public void setCertificate_name(String[] certificate_name) {
		this.certificate_name = certificate_name;
	}

	public String[] getPlace_issue() {
		return place_issue;
	}

	public void setPlace_issue(String[] place_issue) {
		this.place_issue = place_issue;
	}

	public String[] getCertificate_acquisition_date() {
		return certificate_acquisition_date;
	}

	public void setCertificate_acquisition_date(String[] certificate_acquisition_date) {
		this.certificate_acquisition_date = certificate_acquisition_date;
	}

	public String[] getAward_numbers() {
		return award_numbers;
	}

	public void setAward_numbers(String[] award_numbers) {
		this.award_numbers = award_numbers;
	}

	public String[] getAward_name() {
		return award_name;
	}

	public void setAward_name(String[] award_name) {
		this.award_name = award_name;
	}

	public String[] getAward_service() {
		return award_service;
	}

	public void setAward_service(String[] award_service) {
		this.award_service = award_service;
	}

	public String[] getAward_date() {
		return award_date;
	}

	public void setAward_date(String[] award_date) {
		this.award_date = award_date;
	}

	public String[] getAward_content() {
		return award_content;
	}

	public void setAward_content(String[] award_content) {
		this.award_content = award_content;
	}

	public String[] getOverseas_Experience_numbers() {
		return overseas_Experience_numbers;
	}

	public void setOverseas_Experience_numbers(String[] overseas_Experience_numbers) {
		this.overseas_Experience_numbers = overseas_Experience_numbers;
	}

	public String[] getCountry_name() {
		return country_name;
	}

	public void setCountry_name(String[] country_name) {
		this.country_name = country_name;
	}

	public String[] getOverseas_Experience_start_date() {
		return overseas_Experience_start_date;
	}

	public void setOverseas_Experience_start_date(String[] overseas_Experience_start_date) {
		this.overseas_Experience_start_date = overseas_Experience_start_date;
	}

	public String[] getOverseas_Experience_end_date() {
		return overseas_Experience_end_date;
	}

	public void setOverseas_Experience_end_date(String[] overseas_Experience_end_date) {
		this.overseas_Experience_end_date = overseas_Experience_end_date;
	}

	public String[] getOverseas_experience_content() {
		return overseas_experience_content;
	}

	public void setOverseas_experience_content(String[] overseas_experience_content) {
		this.overseas_experience_content = overseas_experience_content;
	}

	public String[] getLanguage_numbers() {
		return language_numbers;
	}

	public void setLanguage_numbers(String[] language_numbers) {
		this.language_numbers = language_numbers;
	}

	public String[] getLanguage_classification() {
		return language_classification;
	}

	public void setLanguage_classification(String[] language_classification) {
		this.language_classification = language_classification;
	}

	public String[] getLanguage_name() {
		return language_name;
	}

	public void setLanguage_name(String[] language_name) {
		this.language_name = language_name;
	}

	public String[] getLanguage_score() {
		return language_score;
	}

	public void setLanguage_score(String[] language_score) {
		this.language_score = language_score;
	}

	public String[] getConversational_ability() {
		return conversational_ability;
	}

	public void setConversational_ability(String[] conversational_ability) {
		this.conversational_ability = conversational_ability;
	}

	public String[] getLanguage_acquisition_date() {
		return language_acquisition_date;
	}

	public void setLanguage_acquisition_date(String[] language_acquisition_date) {
		this.language_acquisition_date = language_acquisition_date;
	}

	public String[] getPreferential() {
		return Preferential;
	}

	public void setPreferential(String[] preferential) {
		Preferential = preferential;
	}
	
}
