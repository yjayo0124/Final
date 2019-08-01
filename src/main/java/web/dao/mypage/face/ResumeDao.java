package web.dao.mypage.face;

import web.dto.mypage.resume.Activities;
import web.dto.mypage.resume.Award;
import web.dto.mypage.resume.Career;
import web.dto.mypage.resume.Certificate;
import web.dto.mypage.resume.Education;
import web.dto.mypage.resume.Language;
import web.dto.mypage.resume.Overseas_Experience;
import web.dto.mypage.resume.Preferential;
import web.dto.mypage.resume.Resume;
import web.dto.mypage.resume.School;

public interface ResumeDao {

	public int insertResume(Resume resume);
	
	public void insertHighSchool(School school);
	
	public void insertCollegeSchool(School school);
	
	public void insertGraduSchool(School school);
	
	public void insertCareer(Career career);
	
	public void insertActivities(Activities activities);
	
	public void insertEducation(Education education);
	
	public void insertCertificate(Certificate certificate);
	
	public void insertAward(Award award);
	
	public void insertOverseas_Experience(Overseas_Experience overseas_Experience);
	
	public void insertLanguage(Language language);
	
	public void insertCertifiedLanguage(Language language);
	
	public void insertPreferential(Preferential preferential);
	
}
