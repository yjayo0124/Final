package web.controller.cor;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
import web.service.cor.face.CorService;
import web.service.mypage.face.ResumeService;
import web.util.resume.Paging;

@Controller
public class ResumeController {

	private static final Logger logger = LoggerFactory.getLogger(ResumeController.class);

	
	@Autowired CorService corService;
	@Autowired ResumeService resumeService;
	
	@RequestMapping(value="/resume/list", method= RequestMethod.GET)
	public void list(
			Model model,
			@RequestParam(defaultValue = "0") int curPage, 
			Paging search) {
	
		int totalcount = corService.getTotal(search);

		Paging paging = new Paging(totalcount, curPage);
		
		paging.setSearch(search.getSearch());
		
		model.addAttribute("paging", paging);
		
		//해쉬맵으로 받음
		List list =corService.getResumeList(paging);
	//	logger.info("list : " + list);
		
		model.addAttribute("list", list);
		
	}
	
	
	@RequestMapping(value="/resume/view", method=RequestMethod.GET)
	public void view(
			Model model,
			@RequestParam int resume_no
			) {
		
		Boolean checkSchool = resumeService.checkSchool(resume_no);
		Boolean checkCareer = resumeService.checkCareer(resume_no);
		Boolean checkActivities = resumeService.checkActivities(resume_no);
		Boolean checkEducation = resumeService.checkEducation(resume_no);
		Boolean checkCertificate = resumeService.checkCertificate(resume_no);
		Boolean checkAward = resumeService.checkAward(resume_no);
		Boolean checkOverseas_Experience = resumeService.checkOverseas_Experience(resume_no);
		Boolean checkLanguage = resumeService.checkLanguage(resume_no);
		Boolean checkPreferential = resumeService.checkPreferential(resume_no);
		
		Resume resume = resumeService.selelctResume(resume_no);
		model.addAttribute("resume", resume);
		
		model.addAttribute("checkSchool", checkSchool);
		model.addAttribute("checkCareer", checkCareer);
		model.addAttribute("checkActivities", checkActivities);
		model.addAttribute("checkEducation", checkEducation);
		model.addAttribute("checkCertificate", checkCertificate);
		model.addAttribute("checkAward", checkAward);
		model.addAttribute("checkOverseas_Experience", checkOverseas_Experience);
		model.addAttribute("checkLanguage", checkLanguage);
		model.addAttribute("checkPreferential", checkPreferential);
		
		
		if(checkSchool) {
			List<School> school = resumeService.selelctSchool(resume_no);
			model.addAttribute("school", school);
		}
		if(checkCareer) {
			List<Career> career = resumeService.selelctCareer(resume_no);
			model.addAttribute("career", career);
		}
		if(checkActivities) {
			List<Activities> activities = resumeService.selelctActivities(resume_no);
			model.addAttribute("activities", activities);

		}
		if(checkEducation) {
			List<Education> education = resumeService.selelctEducation(resume_no);
			model.addAttribute("education", education);
		}
		if(checkCertificate) {
			List<Certificate> certificate = resumeService.selelctCertificate(resume_no);
			model.addAttribute("certificate", certificate);
		}
		if(checkAward) {
			List<Award> award = resumeService.selelctAward(resume_no);
			model.addAttribute("award", award);
		}
		if(checkOverseas_Experience) {
			List<Overseas_Experience> overseas_Experience = resumeService.selelctOverseas_Experience(resume_no);
			model.addAttribute("overseas_Experience", overseas_Experience);
		}
		if(checkLanguage) {
			List<Language> language = resumeService.selelctLanguage(resume_no);
			model.addAttribute("language", language);
		}
		if(checkPreferential) {
			Preferential preferential = resumeService.selelctPreferential(resume_no);
			model.addAttribute("preferential", preferential);
		}
		
		
	}
	
	
}
