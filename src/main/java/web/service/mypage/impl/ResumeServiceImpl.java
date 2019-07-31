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



	@Override
	public void insertSchool(String[] school, int resume_no) {
		
		for(int i=1; i<school.length; i++) {
			School sch = new School();
			sch.setResume_no(resume_no);
			String splitArr[] = school[i].split(",",-1);	
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = null;
				}
			}

			if(splitArr[0].equals("고등학교")) {
				sch.setSchool_classification(splitArr[0]);
				sch.setSchool_name(splitArr[1]);
				sch.setGraduation_date(splitArr[2]);
				sch.setGraduation_status(splitArr[3]);
				sch.setGed_status(splitArr[4]);

				System.out.println(sch);

			} else if(splitArr[0].equals("대학") || splitArr[0].equals("대학교")) {

				sch.setSchool_classification(splitArr[0]);
				sch.setSchool_name(splitArr[1]);
				sch.setGraduation_date(splitArr[2]);
				sch.setGraduation_status(splitArr[3]);
				sch.setAdmission_date(splitArr[6]);
				sch.setTransfer_status(splitArr[7]);
				sch.setMajor_name(splitArr[8]);	
				if(splitArr[9] == null) {
					sch.setCredit(0);
				} else {
					sch.setCredit(Integer.parseInt(splitArr[9]));
				}

				if(splitArr[10] == null) {
					sch.setTotal_score(0);
				} else {
					sch.setTotal_score(Double.parseDouble(splitArr[10]));
				}
				sch.setSub_major_status(splitArr[11]);
				sch.setSub_major_name(splitArr[12]);
				sch.setGraduation_thesis_content(splitArr[13]);

				System.out.println(sch);

			} else if(splitArr[0].equals("대학원")) {

				sch.setSchool_classification(splitArr[0]);
				sch.setSchool_name(splitArr[1]);
				sch.setGraduation_date(splitArr[2]);
				sch.setGraduation_status(splitArr[3]);
				sch.setAcademic_degree(splitArr[5]);
				sch.setAdmission_date(splitArr[6]);
				sch.setTransfer_status(splitArr[7]);
				sch.setMajor_name(splitArr[8]);					
				if(splitArr[9] == null) {
					sch.setCredit(0);
				} else {
					sch.setCredit(Integer.parseInt(splitArr[9]));
				}

				if(splitArr[10] == null) {
					sch.setTotal_score(0);
				} else {
					sch.setTotal_score(Double.parseDouble(splitArr[10]));
				}
				sch.setSub_major_status(splitArr[11]);
				sch.setSub_major_name(splitArr[12]);
				sch.setGraduation_thesis_content(splitArr[13]);

				System.out.println(sch);
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
					splitArr[j] = null;
				}
			}

			car.setResume_no(resume_no);
			car.setCompany_name(splitArr[0]);
			car.setDepartment_name(splitArr[1]);
			car.setHire_date(splitArr[2]);
			car.setRetirement_date(splitArr[3]);
			car.setServed_status(splitArr[4]);
			car.setPosition(splitArr[5]);
			car.setJob_work(splitArr[6]);
			if(splitArr[7] == null) {
				car.setSalary(0);
			} else {
				car.setSalary(Integer.parseInt(splitArr[7]));
			}
			car.setAssigned_task(splitArr[8]);

			System.out.println(car);
		}
		
	}

	@Override
	public void insertActivities(String[] activities, int resume_no) {
		for(int i=1; i<activities.length; i++) {
			Activities act = new Activities();		
			String splitArr[] = activities[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = null;
				}
			}

			act.setResume_no(resume_no);
			act.setActivity_classification(splitArr[0]);
			act.setInstitution_name(splitArr[1]);
			act.setStart_date(splitArr[2]);
			act.setEnd_date(splitArr[3]);
			act.setActivity_content(splitArr[4]);

			System.out.println(act);
		}
		
	}

	@Override
	public void insertEducation(String[] education, int resume_no) {
		for(int i=1; i<education.length; i++) {
			Education edu = new Education();
			String splitArr[] = education[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = null;
				}
			}

			edu.setResume_no(resume_no);
			edu.setTraining_title(splitArr[0]);
			edu.setEducation_facilities(splitArr[1]);
			edu.setStart_date(splitArr[2]);
			edu.setEnd_date(splitArr[3]);
			edu.setTraining_content(splitArr[4]);

			System.out.println(edu);
		}
		
	}
	
	@Override
	public void insertCertificate(String[] certificate) {
		System.out.println("함수실행됨");

		for(int i=1; i<certificate.length; i++) {
			Certificate cer = new Certificate();
			String[] splitArr = certificate[i].split(",",-1);
			for(int j=0; j<splitArr.length; j++) {
				if(splitArr[j].isEmpty()) {
					splitArr[j] = null;
				}
			}
			
			cer.setResume_no(Integer.parseInt(splitArr[0]));
			cer.setCertificate_name(splitArr[0]);
			cer.setPlace_issue(splitArr[1]);
			cer.setAcquisition_date(splitArr[2]);
			
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
					splitArr[j] = null;
				}
			}

			awa.setResume_no(resume_no);
			awa.setAward_name(splitArr[0]);
			awa.setAward_service(splitArr[1]);
			awa.setAward_date(splitArr[2]);
			awa.setAward_content(splitArr[3]);

			System.out.println(awa);
		}
		
	}

	@Override
	public void insertOverseas_Experience(String[] overseas_Experience, int resume_no) {
		for(int i=1; i<overseas_Experience.length; i++) {
			Overseas_Experience overseas = new Overseas_Experience();
			String splitArr[] = overseas_Experience[i].split(",",-1);

			overseas.setResume_no(resume_no);
			overseas.setCountry_name(splitArr[0]);
			overseas.setStart_date(splitArr[1]);
			overseas.setEnd_date(splitArr[2]);
			overseas.setOverseas_experience_content(splitArr[3]);

			System.out.println(overseas);
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
					splitArr[j] = null;
				}
			}
			if(splitArr[0].equals("회화능력")) {

				lan.setLanguage_classification(splitArr[0]);
				lan.setLanguage_name(splitArr[1]);
				lan.setConversation_ability(splitArr[3]);

				System.out.println(lan);

			} else if(splitArr[0].equals("공인시험")) {

				lan.setLanguage_classification(splitArr[0]);
				lan.setLanguage_name(splitArr[1]);
				lan.setLanguage_score(splitArr[2]);
				lan.setConversation_ability(splitArr[3]);
				lan.setAcquisition_date(splitArr[4]);

				System.out.println(lan);
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
					splitArr[j] = null;
				}
			}

			pre.setVeterans(splitArr[0]);
			pre.setProtect(splitArr[1]);
			pre.setFunding(splitArr[2]);
			pre.setDisorder(splitArr[3]);
			pre.setMilitary(splitArr[4]);

			System.out.println(pre);
		}
		
	}

}
