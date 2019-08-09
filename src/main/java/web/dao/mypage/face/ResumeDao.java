package web.dao.mypage.face;

import java.util.List;

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
import web.util.mypage.MypagePaging;

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
	
	public int selectCntAll(int member_no);
	
	public int cntMainResume(int member_no);
	
	public List<Resume> getList(MypagePaging paging);
	
	public int getMainResume_no(int member_no);
	
	public void changeMainResume(int resume_no);
	
	public void updateMainResume(int resume_no);
	
	public int checkSchool(int resume_no);
	
	public int checkCareer(int resume_no);
	
	public int checkActivities(int resume_no);
	
	public int checkEducation(int resume_no);
	
	public int checkCertificate(int resume_no);
	
	public int checkAward(int resume_no);
	
	public int checkOverseas_Experience(int resume_no);
	
	public int checkLanguage(int resume_no);
	
	public int checkPreferential(int resume_no);
	
	public void deleteSchool(int resume_no);
	
	public void deleteCareer(int resume_no);
	
	public void deleteActivities(int resume_no);
	
	public void deleteEducation(int resume_no);
	
	public void deleteCertificate(int resume_no);
	
	public void deleteAward(int resume_no);
	
	public void deleteOverseas_Experience(int resume_no);
	
	public void deleteLanguage(int resume_no);
	
	public void deletePreferential(int resume_no);
	
	public void deleteResume(int resume_no);
	
	public Resume selectResume(int resume_no);
	
	public List<School> selelctSchool(int resume_no);
	
	public List<Career> selelctCareer(int resume_no);
	
	public List<Activities> selelctActivities(int resume_no);
	
	public List<Education> selelctEducation(int resume_no);
	
	public List<Certificate> selelctCertificate(int resume_no);
	
	public List<Award> selelctAward(int resume_no);
	
	public List<Overseas_Experience> selelctOverseas_Experience(int resume_no);
	
	public List<Language> selelctLanguage(int resume_no);	
	
	public Preferential selelctPreferential(int resume_no);	
	
	public void updateResumeNoFile(Resume resume);
	
	public void updateResumeHaveFile(Resume resume);
	
	public String selectImgByMainResume(int resume_no);
	
}
