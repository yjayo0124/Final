package web.service.mypage.face;

import web.dto.mypage.resume.Resume;

public interface ResumeService {
	
	public void insertResume(Resume resume);
	
	public void insertSchool(String[] school, int resume_no);
	
	public void insertCareer(String[] career, int resume_no);
	
	public void insertActivities(String[] activities, int resume_no);
	
	public void insertEducation(String[] education, int resume_no);
	
	public void insertCertificate(String[] certificate, int resume_no);
	
	public void insertAward(String[] award, int resume_no);
	
	public void insertOverseas_Experience(String[] overseas_Experience, int resume_no);
	
	public void insertLanguage(String[] language, int resume_no);
	
	public void insertPreferential(String[] preferential, int resume_no);
		

}
