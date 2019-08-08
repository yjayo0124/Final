package web.service.mypage.face;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import web.dto.mypage.resume.Activities;
import web.dto.mypage.resume.Award;
import web.dto.mypage.resume.Career;
import web.dto.mypage.resume.Certificate;
import web.dto.mypage.resume.Education;
import web.dto.mypage.resume.FormData;
import web.dto.mypage.resume.Language;
import web.dto.mypage.resume.Overseas_Experience;
import web.dto.mypage.resume.Preferential;
import web.dto.mypage.resume.Resume;
import web.dto.mypage.resume.School;
import web.util.mypage.MypagePaging;


public interface ResumeService {
	
	public void insertResume(Resume resume);
	
	public void insertSchool(FormData formData);
	
	public void insertCareer(FormData formData);
	
	public void insertActivities(FormData formData);
	
	public void insertEducation(FormData formData);
	
	public void insertCertificate(FormData formData);
	
	public void insertAward(FormData formData);
	
	public void insertOverseas_Experience(FormData formData);
	
	public void insertLanguage(FormData formData);
	
	public void insertPreferential(FormData formData);
	
	public String filesave(MultipartFile file, ServletContext context);
	
	public MypagePaging getCurPage(HttpServletRequest request, int member_no);
	
	public List<Resume> getList(MypagePaging paging);
	
	public Boolean checkResume(int member_no);
	
	public Boolean checkMainResume(int member_no);
	
	public int getMainResume_no(int member_no);
	
	public void changeMainResume(int resume_no);
	
	public void updateMainResume(int resume_no);
	
	public Boolean checkSchool(int resume_no);
	
	public Boolean checkCareer(int resume_no);
	
	public Boolean checkActivities(int resume_no);
	
	public Boolean checkEducation(int resume_no);
	
	public Boolean checkCertificate(int resume_no);
	
	public Boolean checkAward(int resume_no);
	
	public Boolean checkOverseas_Experience(int resume_no);
	
	public Boolean checkLanguage(int resume_no);
	
	public Boolean checkPreferential(int resume_no);
	
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
	
	public List<School> selectSchool(int resume_no);
	
	public List<Career> selectCareer(int resume_no);
	
	public List<Activities> selectActivities(int resume_no);
	
	public List<Education> selectEducation(int resume_no);
	
	public List<Certificate> selectCertificate(int resume_no);
	
	public List<Award> selectAward(int resume_no);
	
	public List<Overseas_Experience> selectOverseas_Experience(int resume_no);
	
	public List<Language> selectLanguage(int resume_no);	
	
	public Preferential selectPreferential(int resume_no);	
	
	public void updateResumeNoFile(Resume resume);
	
	public void updateResumeHaveFile(Resume resume);

}
