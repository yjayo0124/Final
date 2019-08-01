package web.service.mypage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mypage.face.ResumeDao;
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
import web.service.mypage.face.ResumeService;

@Service
public class ResumeServiceImpl implements ResumeService{

	@Autowired ResumeDao resumeDao;

	@Override
	public void insertResume(Resume resume) {

		if(resume.getMember_no() != 0) {
			if(resume.getResume_title() == "") {
				resume.setResume_title("0");
			}  if (resume.getResume_stored_name() == "") {
				resume.setResume_stored_name("0");
			}  if (resume.getResume_name() == "") {
				resume.setResume_name("0");
			}  if (resume.getResume_birth() == "") {
				resume.setResume_birth("0");
			}  if (resume.getResume_email() == "") {
				resume.setResume_email("0");
			}  if (resume.getResume_phone() == "") {
				resume.setResume_phone("0");
			}  if (resume.getResume_cellphone() == "") {
				resume.setResume_cellphone("0");
			}  if (resume.getResume_addr() == "") {
				resume.setResume_addr("0");
			}  if (resume.getSalary() == "") {
				resume.setSalary("0");
			} 

			resumeDao.insertResume(resume);
		}

	}



	@Override
	public void insertSchool(String[] school, int resume_no) {

		for(int i=1; i<school.length; i++) {
			School sch = new School();
			
			sch.setResume_no(resume_no);
			
			String splitArr[] = school[i].split(",",-1);	
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			
			if(splitArr[1].equals("고등학교")) {
				sch.setNumbers(Integer.parseInt(splitArr[0]));
				sch.setSchool_classification(splitArr[1]);
				sch.setSchool_name(splitArr[2]);
				sch.setGraduation_date(splitArr[3]);
				sch.setGraduation_status(splitArr[4]);
				sch.setGed_status(splitArr[5]);
				
				resumeDao.insertHighSchool(sch);

			} else if(splitArr[1].equals("대학") || splitArr[0].equals("대학교")) {

				sch.setNumbers(Integer.parseInt(splitArr[0]));
				sch.setSchool_classification(splitArr[1]);
				sch.setSchool_name(splitArr[2]);
				sch.setGraduation_date(splitArr[3]);
				sch.setGraduation_status(splitArr[4]);
				sch.setAdmission_date(splitArr[7]);
				sch.setTransfer_status(splitArr[8]);
				sch.setMajor_name(splitArr[9]);	
				if(splitArr[10] == null) {
					sch.setCredit(0);
				} else {
					sch.setCredit(Integer.parseInt(splitArr[10]));
				}

				if(splitArr[11] == null) {
					sch.setTotal_score(0);
				} else {
					sch.setTotal_score(Double.parseDouble(splitArr[11]));
				}
				sch.setSub_major_status(splitArr[12]);
				sch.setSub_major_name(splitArr[13]);
				sch.setGraduation_thesis_content(splitArr[14]);

				resumeDao.insertCollegeSchool(sch);

			} else if(splitArr[1].equals("대학원")) {

				sch.setNumbers(Integer.parseInt(splitArr[0]));
				sch.setSchool_classification(splitArr[1]);
				sch.setSchool_name(splitArr[2]);
				sch.setGraduation_date(splitArr[3]);
				sch.setGraduation_status(splitArr[4]);
				sch.setAcademic_degree(splitArr[6]);
				sch.setAdmission_date(splitArr[7]);
				sch.setTransfer_status(splitArr[8]);
				sch.setMajor_name(splitArr[9]);	
				if(splitArr[10] == null) {
					sch.setCredit(0);
				} else {
					sch.setCredit(Integer.parseInt(splitArr[10]));
				}

				if(splitArr[11] == null) {
					sch.setTotal_score(0);
				} else {
					sch.setTotal_score(Double.parseDouble(splitArr[11]));
				}
				sch.setSub_major_status(splitArr[12]);
				sch.setSub_major_name(splitArr[13]);
				sch.setGraduation_thesis_content(splitArr[14]);
				

				resumeDao.insertGraduSchool(sch);
			}
		}

	}

	@Override
	public void insertCareer(String[] career, int resume_no) {
		for(int i=1; i<career.length; i++) {
			Career car = new Career();
			String splitArr[] = career[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			car.setNumbers(Integer.parseInt(splitArr[0]));
			car.setResume_no(resume_no);
			car.setCompany_name(splitArr[1]);
			car.setDepartment_name(splitArr[2]);
			car.setHire_date(splitArr[3]);
			car.setRetirement_date(splitArr[4]);
			car.setServed_status(splitArr[5]);
			car.setPosition(splitArr[6]);
			car.setJob_work(splitArr[7]);
			if(splitArr[8] == null) {
				car.setSalary(0);
			} else {
				car.setSalary(Integer.parseInt(splitArr[8]));
			}
			car.setAssigned_task(splitArr[9]);

			resumeDao.insertCareer(car);
		}

	}

	@Override
	public void insertActivities(String[] activities, int resume_no) {
		for(int i=1; i<activities.length; i++) {
			Activities act = new Activities();		
			String splitArr[] = activities[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			act.setNumbers(Integer.parseInt(splitArr[0]));
			act.setResume_no(resume_no);
			act.setActivity_classification(splitArr[1]);
			act.setInstitution_name(splitArr[2]);
			act.setStart_date(splitArr[3]);
			act.setEnd_date(splitArr[4]);
			act.setActivity_content(splitArr[5]);

			resumeDao.insertActivities(act);
		}

	}

	@Override
	public void insertEducation(String[] education, int resume_no) {
		for(int i=1; i<education.length; i++) {
			Education edu = new Education();
			String splitArr[] = education[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			edu.setNumbers(Integer.parseInt(splitArr[0]));
			edu.setResume_no(resume_no);
			edu.setTraining_title(splitArr[1]);
			edu.setEducational_facilities(splitArr[2]);
			edu.setStart_date(splitArr[3]);
			edu.setEnd_date(splitArr[4]);
			edu.setTraining_content(splitArr[5]);

			resumeDao.insertEducation(edu);
		}

	}

	@Override
	public void insertCertificate(String[] certificate,  int resume_no) {

		for(int i=1; i<certificate.length; i++) {
			Certificate cer = new Certificate();
			String[] splitArr = certificate[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			cer.setNumbers(Integer.parseInt(splitArr[0]));
			cer.setResume_no(resume_no);
			cer.setCertificate_name(splitArr[1]);
			cer.setPlace_issue(splitArr[2]);
			cer.setAcquisition_date(splitArr[3]);

			resumeDao.insertCertificate(cer);
		}

	}

	@Override
	public void insertAward(String[] award, int resume_no) {
		for(int i=1; i<award.length; i++) {
			Award awa = new Award();
			String splitArr[] = award[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			awa.setNumbers(Integer.parseInt(splitArr[0]));
			awa.setResume_no(resume_no);
			awa.setAward_name(splitArr[1]);
			awa.setAward_service(splitArr[2]);
			awa.setAward_date(splitArr[3]);
			awa.setAward_content(splitArr[4]);

			resumeDao.insertAward(awa);
		}

	}

	@Override
	public void insertOverseas_Experience(String[] overseas_Experience, int resume_no) {
		for(int i=1; i<overseas_Experience.length; i++) {
			Overseas_Experience overseas = new Overseas_Experience();
			String splitArr[] = overseas_Experience[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			
			overseas.setNumbers(Integer.parseInt(splitArr[0]));
			overseas.setResume_no(resume_no);
			overseas.setCountry_name(splitArr[1]);
			overseas.setStart_date(splitArr[2]);
			overseas.setEnd_date(splitArr[3]);
			overseas.setOverseas_experience_content(splitArr[4]);

			resumeDao.insertOverseas_Experience(overseas);
		}

	}

	@Override
	public void insertLanguage(String[] language, int resume_no) {
		for(int i=1; i<language.length; i++) {
			Language lan = new Language();
			lan.setResume_no(resume_no);
			String splitArr[] = language[i].split(",",-1);	
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			if(splitArr[1].equals("회화능력")) {
				lan.setNumbers(Integer.parseInt(splitArr[0]));
				lan.setLanguage_classification(splitArr[1]);
				lan.setLanguage_name(splitArr[2]);
				lan.setConversational_ability(splitArr[4]);

				resumeDao.insertLanguage(lan);

			} else if(splitArr[1].equals("공인시험")) {
				lan.setNumbers(Integer.parseInt(splitArr[0]));
				lan.setLanguage_classification(splitArr[1]);
				lan.setLanguage_name(splitArr[2]);
				lan.setLanguage_score(splitArr[3]);
				lan.setConversational_ability(splitArr[4]);
				lan.setAcquisition_date(splitArr[5]);

				resumeDao.insertCertifiedLanguage(lan);
			}
		}

	}

	@Override
	public void insertPreferential(String[] preferential, int resume_no) {
		for(int i=1; i<preferential.length; i++) {
			Preferential pre = new Preferential();
			String splitArr[] = preferential[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = "0";
				}
			}
			
			pre.setResume_no(resume_no);
			pre.setVeterans(splitArr[0]);
			pre.setProtect(splitArr[1]);
			pre.setFunding(splitArr[2]);
			pre.setDisorder(splitArr[3]);
			pre.setMilitary(splitArr[4]);

			resumeDao.insertPreferential(pre);
		}

	}

}
