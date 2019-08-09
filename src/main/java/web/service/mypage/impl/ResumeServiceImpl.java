package web.service.mypage.impl;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.mypage.face.ResumeDao;
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
import web.service.mypage.face.ResumeService;
import web.util.mypage.MypagePaging;

@Service
public class ResumeServiceImpl implements ResumeService{

	@Autowired ResumeDao resumeDao;

	@Override
	public void insertResume(Resume resume) {

		if(resume.getMember_no() != 0) {

			resumeDao.insertResume(resume);
		}

	}



	@Override
	public void insertSchool(FormData formData) {

		for(int i=0; i<formData.getSchool_numbers().length; i++) {
			School sch = new School();

			sch.setResume_no(formData.getResume_no());

			if(formData.getSchool_classification()[i].equals("고등학교")) {
				sch.setNumbers(Integer.parseInt(formData.getSchool_numbers()[i]));
				sch.setSchool_classification(formData.getSchool_classification()[i]);
				sch.setSchool_name(formData.getSchool_name()[i]);
				sch.setGraduation_date(formData.getGraduation_date()[i]);
				sch.setGraduation_status(formData.getGraduation_status()[i]);
				sch.setGed_status(formData.getGed_status()[i]);

				resumeDao.insertHighSchool(sch);

			} else if(formData.getSchool_classification()[i].equals("대학") || formData.getSchool_classification()[i].equals("대학교")) {

				sch.setNumbers(Integer.parseInt(formData.getSchool_numbers()[i]));
				sch.setSchool_classification(formData.getSchool_classification()[i]);
				sch.setSchool_name(formData.getSchool_name()[i]);
				sch.setGraduation_date(formData.getGraduation_date()[i]);
				sch.setGraduation_status(formData.getGraduation_status()[i]);
				sch.setAdmission_date(formData.getAdmission_date()[i]);
				sch.setTransfer_status(formData.getTransfer_status()[i]);
				sch.setMajor_name(formData.getMajor_name()[i]);	
				sch.setCredit(formData.getCredit()[i]);
				sch.setTotal_score(formData.getTotal_score()[i]);
				sch.setSub_major_status(formData.getSub_major_status()[i]);
				sch.setSub_major_name(formData.getSub_major_name()[i]);
				sch.setGraduation_thesis_content(formData.getGraduation_thesis_content()[i]);

				resumeDao.insertCollegeSchool(sch);

			} else if(formData.getSchool_classification()[i].equals("대학원")) {

				sch.setNumbers(Integer.parseInt(formData.getSchool_numbers()[i]));
				sch.setSchool_classification(formData.getSchool_classification()[i]);
				sch.setSchool_name(formData.getSchool_name()[i]);
				sch.setGraduation_date(formData.getGraduation_date()[i]);
				sch.setGraduation_status(formData.getGraduation_status()[i]);
				sch.setAcademic_degree(formData.getAcademic_degree()[i]);
				sch.setAdmission_date(formData.getAdmission_date()[i]);
				sch.setTransfer_status(formData.getTransfer_status()[i]);
				sch.setMajor_name(formData.getMajor_name()[i]);	
				sch.setCredit(formData.getCredit()[i]);
				sch.setTotal_score(formData.getTotal_score()[i]);
				sch.setSub_major_status(formData.getSub_major_status()[i]);
				sch.setSub_major_name(formData.getSub_major_name()[i]);
				sch.setGraduation_thesis_content(formData.getGraduation_thesis_content()[i]);


				resumeDao.insertGraduSchool(sch);
			}
		}

	}

	@Override
	public void insertCareer(FormData formData) {
		for(int i=0; i<formData.getCareer_numbers().length; i++) {
			Career car = new Career();
			
			car.setNumbers(Integer.parseInt(formData.getCareer_numbers()[i]));
			car.setResume_no(formData.getResume_no());
			car.setCompany_name(formData.getCompany_name()[i]);
			car.setDepartment_name(formData.getDepartment_name()[i]);
			car.setHire_date(formData.getHire_date()[i]);
			car.setRetirement_date(formData.getRetirement_date()[i]);
			car.setServed_status(formData.getServed_status()[i]);
			car.setPosition(formData.getPosition()[i]);
			car.setJob_work(formData.getJob_work()[i]);
			if(formData.getCareer_salary()[i] == null) {
				car.setSalary(0);
			} else {
				car.setSalary(Integer.parseInt(formData.getCareer_salary()[i]));
			}
			car.setAssigned_task(formData.getAssigned_task()[i]);

			resumeDao.insertCareer(car);
		}

	}

	@Override
	public void insertActivities(FormData formData) {
		for(int i=0; i<formData.getActivities_numbers().length; i++) {
			Activities act = new Activities();		
			
			
			act.setNumbers(Integer.parseInt(formData.getActivities_numbers()[i]));
			act.setResume_no(formData.getResume_no());
			act.setActivity_classification(formData.getActivity_classification()[i]);
			act.setInstitution_name(formData.getInstitution_name()[i]);
			act.setStart_date(formData.getActivity_start_date()[i]);
			act.setEnd_date(formData.getActivity_end_date()[i]);
			act.setActivity_content(formData.getActivity_content()[i]);

			resumeDao.insertActivities(act);
		}

	}

	@Override
	public void insertEducation(FormData formData) {
		for(int i=0; i<formData.getEducation_numbers().length; i++) {
			Education edu = new Education();
			
			edu.setNumbers(Integer.parseInt(formData.getEducation_numbers()[i]));
			edu.setResume_no(formData.getResume_no());
			edu.setTraining_title(formData.getTraining_title()[i]);
			edu.setEducational_facilities(formData.getEducational_facilities()[i]);
			edu.setStart_date(formData.getEducation_start_date()[i]);
			edu.setEnd_date(formData.getEducation_end_date()[i]);
			edu.setTraining_content(formData.getTraining_content()[i]);

			resumeDao.insertEducation(edu);
		}

	}

	@Override
	public void insertCertificate(FormData formData) {

		for(int i=0; i<formData.getCertificate_numbers().length; i++) {
			Certificate cer = new Certificate();
			
			cer.setNumbers(Integer.parseInt(formData.getCertificate_numbers()[i]));
			cer.setResume_no(formData.getResume_no());
			cer.setCertificate_name(formData.getCertificate_name()[i]);
			cer.setPlace_issue(formData.getPlace_issue()[i]);
			cer.setAcquisition_date(formData.getCertificate_acquisition_date()[i]);

			resumeDao.insertCertificate(cer);
		}

	}

	@Override
	public void insertAward(FormData formData) {
		System.out.println(formData.getAward_numbers().length);
		for(int i=0; i<formData.getAward_numbers().length; i++) {
			Award awa = new Award();
			
			awa.setNumbers(Integer.parseInt(formData.getAward_numbers()[i]));
			awa.setResume_no(formData.getResume_no());
			awa.setAward_name(formData.getAward_name()[i]);
			awa.setAward_service(formData.getAward_service()[i]);
			awa.setAward_date(formData.getAward_date()[i]);
			awa.setAward_content(formData.getAward_content()[i]);

			resumeDao.insertAward(awa);
		}

	}

	@Override
	public void insertOverseas_Experience(FormData formData) {
		for(int i=0; i<formData.getOverseas_Experience_numbers().length; i++) {
			Overseas_Experience overseas = new Overseas_Experience();
			

			overseas.setNumbers(Integer.parseInt(formData.getOverseas_Experience_numbers()[i]));
			overseas.setResume_no(formData.getResume_no());
			overseas.setCountry_name(formData.getCountry_name()[i]);
			overseas.setStart_date(formData.getOverseas_Experience_start_date()[i]);
			overseas.setEnd_date(formData.getOverseas_Experience_end_date()[i]);
			overseas.setOverseas_experience_content(formData.getOverseas_experience_content()[i]);

			resumeDao.insertOverseas_Experience(overseas);
		}

	}

	@Override
	public void insertLanguage(FormData formData) {
		for(int i=0; i<formData.getLanguage_numbers().length; i++) {
			Language lan = new Language();
			lan.setResume_no(formData.getResume_no());
			
			if(formData.getLanguage_classification()[i].equals("회화능력")) {
				lan.setNumbers(Integer.parseInt(formData.getLanguage_numbers()[i]));
				lan.setLanguage_classification(formData.getLanguage_classification()[i]);
				lan.setLanguage_name(formData.getLanguage_name()[i]);
				lan.setConversational_ability(formData.getConversational_ability()[i]);

				resumeDao.insertLanguage(lan);

			} else if(formData.getLanguage_classification()[i].equals("공인시험")) {
				lan.setNumbers(Integer.parseInt(formData.getLanguage_numbers()[i]));
				lan.setLanguage_classification(formData.getLanguage_classification()[i]);
				lan.setLanguage_name(formData.getLanguage_name()[i]);
				lan.setLanguage_score(formData.getLanguage_score()[i]);
				lan.setConversational_ability(formData.getConversational_ability()[i]);
				lan.setAcquisition_date(formData.getLanguage_acquisition_date()[i]);

				resumeDao.insertCertifiedLanguage(lan);
			}
		}

	}

	@Override
	public void insertPreferential(FormData formData) {
		
			Preferential pre = new Preferential();
			

			pre.setResume_no(formData.getResume_no());
			pre.setVeterans(formData.getPreferential()[0]);
			pre.setProtect(formData.getPreferential()[1]);
			pre.setFunding(formData.getPreferential()[2]);
			pre.setDisorder(formData.getPreferential()[3]);
			pre.setMilitary(formData.getPreferential()[4]);

			resumeDao.insertPreferential(pre);

	}



	@Override
	public String filesave(MultipartFile file, ServletContext context) {

		String storedPath = context.getRealPath("upload");
		String uId = UUID.randomUUID().toString().split("-")[4];
		String stored_name = uId + "_" + file.getOriginalFilename();
		File dest = new File(storedPath, stored_name);
		try {
			file.transferTo(dest);

		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return stored_name;
	}



	@Override
	public MypagePaging getCurPage(HttpServletRequest request, int member_no) {
		
		//전달파라미터 curPage 파싱
		String param = request.getParameter("curPage");
		int curPage = 0;
		if( param!=null && !"".equals(param) ) {
			curPage = Integer.parseInt(param);
		}

		// 전체 게시글 수
		int totalCount = resumeDao.selectCntAll(member_no);

		// 페이징 객체 생성
		MypagePaging paging = new MypagePaging(totalCount, curPage);
		paging.setMember_no(member_no);

		return paging;
	}

	
	@Override
	public List<Resume> getList(MypagePaging paging) {
	
		return resumeDao.getList(paging);
	}



	@Override
	public Boolean checkResume(int member_no) {
		
		Boolean check = false;
		
		int totalCount = resumeDao.selectCntAll(member_no);
		
		if(totalCount != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkMainResume(int member_no) {
		
		Boolean check = false;
		
		int count = resumeDao.cntMainResume(member_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public int getMainResume_no(int member_no) {
	
		return resumeDao.getMainResume_no(member_no);
	}



	@Override
	public void changeMainResume(int resume_no) {

		resumeDao.changeMainResume(resume_no);
	}



	@Override
	public void updateMainResume(int resume_no) {

		resumeDao.updateMainResume(resume_no);
	}



	@Override
	public Boolean checkSchool(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkSchool(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkCareer(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkCareer(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkActivities(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkActivities(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkEducation(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkEducation(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkCertificate(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkCertificate(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkAward(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkAward(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkOverseas_Experience(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkOverseas_Experience(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkLanguage(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkLanguage(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public Boolean checkPreferential(int resume_no) {
		Boolean check = false;
		
		int count = resumeDao.checkPreferential(resume_no);
		
		if(count != 0) {
			check = true;
		}
		
		return check;
	}



	@Override
	public void deleteSchool(int resume_no) {
		resumeDao.deleteSchool(resume_no);
		
	}



	@Override
	public void deleteCareer(int resume_no) {
		resumeDao.deleteCareer(resume_no);		
	}



	@Override
	public void deleteActivities(int resume_no) {
		resumeDao.deleteActivities(resume_no);		
	}



	@Override
	public void deleteEducation(int resume_no) {
		resumeDao.deleteEducation(resume_no);		
	}



	@Override
	public void deleteCertificate(int resume_no) {
		resumeDao.deleteCertificate(resume_no);		
	}



	@Override
	public void deleteAward(int resume_no) {
		resumeDao.deleteAward(resume_no);		
	}



	@Override
	public void deleteOverseas_Experience(int resume_no) {
		resumeDao.deleteOverseas_Experience(resume_no);		
	}



	@Override
	public void deleteLanguage(int resume_no) {
		resumeDao.deleteLanguage(resume_no);		
	}



	@Override
	public void deletePreferential(int resume_no) {
		resumeDao.deletePreferential(resume_no);		
	}



	@Override
	public void deleteResume(int resume_no) {
		resumeDao.deleteResume(resume_no);		
	}



	@Override
	public Resume selectResume(int resume_no) {
		
		return  resumeDao.selectResume(resume_no);
	}



	@Override
	public List<School> selectSchool(int resume_no) {
		return resumeDao.selelctSchool(resume_no);
	}



	@Override
	public List<Career> selectCareer(int resume_no) {
		return resumeDao.selelctCareer(resume_no);
	}



	@Override
	public List<Activities> selectActivities(int resume_no) {
		return resumeDao.selelctActivities(resume_no);
	}



	@Override
	public List<Education> selectEducation(int resume_no) {
		return resumeDao.selelctEducation(resume_no);
	}



	@Override
	public List<Certificate> selectCertificate(int resume_no) {
		return resumeDao.selelctCertificate(resume_no);
	}



	@Override
	public List<Award> selectAward(int resume_no) {
		return resumeDao.selelctAward(resume_no);
	}



	@Override
	public List<Overseas_Experience> selectOverseas_Experience(int resume_no) {
		return resumeDao.selelctOverseas_Experience(resume_no);
	}



	@Override
	public List<Language> selectLanguage(int resume_no) {
		return resumeDao.selelctLanguage(resume_no);
	}



	@Override
	public Preferential selectPreferential(int resume_no) {
		return resumeDao.selelctPreferential(resume_no);
	}



	@Override
	public void updateResumeNoFile(Resume resume) {
		resumeDao.updateResumeNoFile(resume);
		
	}



	@Override
	public void updateResumeHaveFile(Resume resume) {
		resumeDao.updateResumeHaveFile(resume);
		
	}



	@Override
	public String selectImgByMainResume(int resume_no) {
		
		return resumeDao.selectImgByMainResume(resume_no);
	}



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
