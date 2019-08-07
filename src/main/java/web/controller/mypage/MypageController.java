package web.controller.mypage;


import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import web.dto.Member;
import web.dto.Recruit;
import web.dto.Review;
import web.dto.mypage.introduction.Introduction;
import web.dto.mypage.introduction.Sub_Introduction;
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
import web.service.member.face.MemberService;
import web.service.mypage.face.IntroductionService;
import web.service.mypage.face.MyCommentService;
import web.service.mypage.face.MypageService;
import web.service.mypage.face.ResumeService;
import web.util.mypage.MypagePaging;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired MypageService mypageService;
	@Autowired IntroductionService introductionService;
	@Autowired ResumeService resumeService;
	@Autowired MyCommentService myCommentService;
	@Autowired ServletContext context;
	@Autowired MemberService memberService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET) 
	public void mypage(Authentication auth, Model model) {
		logger.info("마이페이지 메인 접속");

		if(auth == null) {
			return;
		}
		
		Member member = (Member) auth.getDetails();
		model.addAttribute("member_name", member.getMember_name());
		//접속 객체 이름 model값으로 보내기
	}

	@RequestMapping(value="/mypage/introduction/list", method=RequestMethod.GET)
	public void introductionList(HttpServletRequest request, Authentication auth, Model model) {
		
		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();
		
		Boolean checkIntroduction = introductionService.checkIntroduction(member_no);
		
		MypagePaging paging = introductionService.getCurPage(request, member_no);
		
		List<Introduction> list = introductionService.getList(paging);
		
		model.addAttribute("checkIntroduction", checkIntroduction);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		
		
		
	}

	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.GET)
	public void introductionWrite() {

	}
	
	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.POST)
	public void introductionWriteProc(HttpServletResponse response, Introduction introduction, Authentication auth) {
		
		System.out.println(introduction);
		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();
		introduction.setMember_no(member_no);
		introductionService.insertIntroduction(introduction);
		int introduction_no = introduction.getIntroduction_no();
		String data = Integer.toString(introduction_no);
		
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(data); 
			out.flush(); 
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
	
	@RequestMapping(value="/mypage/introduction/writeSub", method=RequestMethod.POST)
	public void writeSub(
			int introduction_no,
			String[] list_numbers,
			String[] list_introduction_question,
			String[] list_introduction_content
			) {
		
		introductionService.insertSub(introduction_no, list_numbers, list_introduction_question, list_introduction_content);
	}	
	@RequestMapping(value="/mypage/introduction/detail", method=RequestMethod.GET)
	public void introductionDetail(int introduction_no, Model model) {
		Boolean checkSub = introductionService.checkSub(introduction_no);
		
		Introduction introduction = introductionService.selelctIntroduction(introduction_no);
		model.addAttribute("introduction", introduction);
		
		model.addAttribute("checkSub", checkSub);		
		
		if(checkSub) {
			List<Sub_Introduction> sub = introductionService.selectSub(introduction_no);
			model.addAttribute("sub", sub);
		}		

	}

	@RequestMapping(value="/mypage/introduction/update", method=RequestMethod.GET)
	public void introductionUpdate(int introduction_no, Model model) {
		
		Boolean checkSub = introductionService.checkSub(introduction_no);
		model.addAttribute("checkSub", checkSub);
		
		Introduction introduction = introductionService.selelctIntroduction(introduction_no);
		model.addAttribute("introduction", introduction);
				
		
		if(checkSub) {
			List<Sub_Introduction> sub = introductionService.selectSub(introduction_no);
			model.addAttribute("sub", sub);
		}		

	}
	
	@RequestMapping(value="/mypage/introduction/update", method=RequestMethod.POST)
	public void introductionUpdateProc(
			Introduction introduction,
			String[] list_numbers,
			String[] list_introduction_question,
			String[] list_introduction_content) {
		
		int introduction_no = introduction.getIntroduction_no();
		
		introductionService.updateIntroduction(introduction);
		
		Boolean checkSub = introductionService.checkSub(introduction_no);
		//sub_introduction이 있을때
		if(checkSub) {
			introductionService.deleteSub(introduction_no);
			introductionService.insertSub(introduction_no, list_numbers, list_introduction_question, list_introduction_content);
		}
		
	}
	
	@RequestMapping(value="/mypage/introduction/updateMain")
	public String introductionUpdateMain(int introduction_no, Authentication auth) {
		
		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();
		
		Boolean checkMainIntroduction = introductionService.checkMainIntroduction(member_no);
		
		//대표 자기소개서가 있을 때
		if(checkMainIntroduction) {
			int mainIntroduction_no =  introductionService.getMainIntroduction_no(member_no);
			introductionService.changeMainIntroduction(mainIntroduction_no);
			introductionService.updateMainIntroduction(introduction_no);
			
		} 
		//대표 자기소개서가 없을 때
		else {
			introductionService.updateMainIntroduction(introduction_no);
		}
		
		
		return "redirect: /mypage/introduction/list";
	}
	
	@RequestMapping(value="/mypage/introduction/unlockMain")
	public String introductionUnlockMain(int introduction_no, Authentication auth) {
		
			introductionService.changeMainIntroduction(introduction_no);
		
		
		return "redirect: /mypage/introduction/list";
	}

	@RequestMapping(value="/mypage/introduction/delete", method=RequestMethod.GET)
	public String introductionDelete(int introduction_no) {
		
		//sub_introduction이 있을때
		if(introductionService.checkSub(introduction_no)) {
			introductionService.deleteSub(introduction_no);
		}
		
		introductionService.deleteIntroduction(introduction_no);
		
		return "redirect: /mypage/introduction/list";
	}

	@RequestMapping(value="/mypage/resume/list", method=RequestMethod.GET)
	public void resumeList(HttpServletRequest request, Authentication auth, Model model) {
		
		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();
		
		Boolean checkResume = resumeService.checkResume(member_no);
		
		MypagePaging paging = resumeService.getCurPage(request, member_no);
		
		List<Resume> list = resumeService.getList(paging);		
		
		model.addAttribute("checkResume", checkResume);
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);

	}

	@RequestMapping(value="/mypage/resume/write", method=RequestMethod.GET)
	public void resumeWrite() {

	}
	
	@RequestMapping(value="/mypage/resume/write", method=RequestMethod.POST)
	public void resumeWriteInfoProc(
			MultipartHttpServletRequest request,
			@RequestParam(value = "upfile") MultipartFile upfile,
			Resume resume,
			FormData formData
			) {
		System.out.println(formData.toString());
		
		String resume_stored_name = resumeService.filesave(upfile, context);
		resume.setResume_stored_name(resume_stored_name);
		logger.info("이력서 정보 : " + resume);
		resumeService.insertResume(resume);
		logger.info("작성 후 이력서 정보 : " + resume);
		int resume_no = resume.getResume_no();
		formData.setResume_no(resume_no);
		logger.info("작성 후 이력서 번호 : " + resume_no);
		
		if(formData.getSchool_numbers() != null) {
			resumeService.insertSchool(formData);
		}

		if(formData.getCareer_numbers() != null) {
			resumeService.insertCareer(formData);
		}


		if(formData.getActivities_numbers() != null) {
			resumeService.insertActivities(formData);
		}


		if(formData.getEducation_numbers() != null) {
			resumeService.insertEducation(formData);
		}


		if(formData.getCertificate_numbers() != null) {
			resumeService.insertCertificate(formData);
		}


		if(formData.getAward_numbers() != null) {
			resumeService.insertAward(formData);
		}


		if(formData.getOverseas_Experience_numbers() != null) {
			resumeService.insertOverseas_Experience(formData);
		}

		if(formData.getLanguage_numbers() != null) {
			resumeService.insertLanguage(formData);
		}


		if(formData.getPreferential() != null) {
			resumeService.insertPreferential(formData);
		}
		
	}
	
	@RequestMapping(value="/mypage/resume/updateMain")
	public String resumeUpdateMain(int resume_no, Authentication auth) {
		
		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();
		
		Boolean checkMainResume = resumeService.checkMainResume(member_no);
		
		//대표 이력서가 있을 때
		if(checkMainResume) {
			int mainResume_no =  resumeService.getMainResume_no(member_no);
			resumeService.changeMainResume(mainResume_no);
			resumeService.updateMainResume(resume_no);
			
		} 
		//대표 이력서가 없을 때
		else {
			resumeService.updateMainResume(resume_no);
		}
		
		return "redirect: /mypage/resume/list";
	}
	
	@RequestMapping(value="/mypage/resume/unlockMain")
	public String resumeUnlockMain(int resume_no, Authentication auth) {
		
			resumeService.changeMainResume(resume_no);
		
		
		return "redirect: /mypage/resume/list";
	}
	

	@RequestMapping(value="/mypage/resume/detail", method=RequestMethod.GET)
	public void resumeDetail(int resume_no, Model model) {
		Boolean checkSchool = resumeService.checkSchool(resume_no);
		Boolean checkCareer = resumeService.checkCareer(resume_no);
		Boolean checkActivities = resumeService.checkActivities(resume_no);
		Boolean checkEducation = resumeService.checkEducation(resume_no);
		Boolean checkCertificate = resumeService.checkCertificate(resume_no);
		Boolean checkAward = resumeService.checkAward(resume_no);
		Boolean checkOverseas_Experience = resumeService.checkOverseas_Experience(resume_no);
		Boolean checkLanguage = resumeService.checkLanguage(resume_no);
		Boolean checkPreferential = resumeService.checkPreferential(resume_no);
		
		Resume resume = resumeService.selectResume(resume_no);
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
			List<School> school = resumeService.selectSchool(resume_no);
			model.addAttribute("school", school);
		}
		if(checkCareer) {
			List<Career> career = resumeService.selectCareer(resume_no);
			model.addAttribute("career", career);
		}
		if(checkActivities) {
			List<Activities> activities = resumeService.selectActivities(resume_no);
			model.addAttribute("activities", activities);

		}
		if(checkEducation) {
			List<Education> education = resumeService.selectEducation(resume_no);
			model.addAttribute("education", education);
		}
		if(checkCertificate) {
			List<Certificate> certificate = resumeService.selectCertificate(resume_no);
			model.addAttribute("certificate", certificate);
		}
		if(checkAward) {
			List<Award> award = resumeService.selectAward(resume_no);
			model.addAttribute("award", award);
		}
		if(checkOverseas_Experience) {
			List<Overseas_Experience> overseas_Experience = resumeService.selectOverseas_Experience(resume_no);
			model.addAttribute("overseas_Experience", overseas_Experience);
		}
		if(checkLanguage) {
			List<Language> language = resumeService.selectLanguage(resume_no);
			model.addAttribute("language", language);
		}
		if(checkPreferential) {
			Preferential preferential = resumeService.selectPreferential(resume_no);
			model.addAttribute("preferential", preferential);
		}
		

	}

	@RequestMapping(value="/mypage/resume/update", method=RequestMethod.GET)
	public void resumeUpdate() {

	}

	@RequestMapping(value="/mypage/resume/delete", method=RequestMethod.GET)
	public String resumeDelete(int resume_no) {
		
		//school이 있을때
		if(resumeService.checkSchool(resume_no)) {
			resumeService.deleteSchool(resume_no);
		}
		if(resumeService.checkCareer(resume_no)) {
			resumeService.deleteCareer(resume_no);
		}
		if(resumeService.checkActivities(resume_no)) {
			resumeService.deleteActivities(resume_no);
		}
		if(resumeService.checkEducation(resume_no)) {
			resumeService.deleteEducation(resume_no);
		}
		if(resumeService.checkCertificate(resume_no)) {
			resumeService.deleteCertificate(resume_no);
		}
		if(resumeService.checkAward(resume_no)) {
			resumeService.deleteAward(resume_no);
		}
		if(resumeService.checkOverseas_Experience(resume_no)) {
			resumeService.deleteOverseas_Experience(resume_no);
		}
		if(resumeService.checkLanguage(resume_no)) {
			resumeService.deleteLanguage(resume_no);
		}
		if(resumeService.checkPreferential(resume_no)) {
			resumeService.deletePreferential(resume_no);
		}
		
		resumeService.deleteResume(resume_no);
		
		return "redirect: /mypage/resume/list";
	}

	//-------------------seonhong------

	@RequestMapping(value="/mypage/withdraw/confirm", method=RequestMethod.GET)
	public void myWithdraw() {
	}


	//withdraw method
	@RequestMapping(value="/mypage/withdrawProc", method=RequestMethod.GET)
	public String myWithdrawProc(Authentication auth, HttpSession session) {

		Member member = (Member) auth.getDetails();

		memberService.withdraw(member.getMember_no());
		session.invalidate();


		return "redirect: /withdrawSuccess";
	}


	@RequestMapping(value="/withdrawSuccess", method=RequestMethod.GET)
	public void withdrawSuccess() {

	}


	@RequestMapping(value="/mypage/info/check", method=RequestMethod.GET)
	public void check(Authentication auth, Model model) {

	}

	@RequestMapping(value="/mypage/info/check", method=RequestMethod.POST)
	public String checkProc(Authentication auth, String member_pw) {

		Member member = (Member) auth.getDetails();

		if( passwordEncoder.matches(member_pw, member.getMember_pw())) {

			return "redirect: /mypage/info/update";			
		}else { 

			return "redirect: /mypage/info/check";
		}


	}



	@RequestMapping(value="/mypage/info/update", method=RequestMethod.GET)
	public void memUpdate(Authentication auth, Model model) {

		Member member = (Member) auth.getDetails();


		Member memberRes = memberService.selectById(member.getMember_id());

		model.addAttribute("member", memberRes);



	}

	@RequestMapping(value="/mypage/info/update", method=RequestMethod.POST)
	public String memUpdateProc(Member member, Model model) {

		logger.info("변경될 회원 정보 : " + member.toString());

		if(member.getMember_pw() != null && !member.getMember_pw().isEmpty()) {
			String incode_pw = passwordEncoder.encode(member.getMember_pw());

			member.setMember_pw(incode_pw);

			memberService.update(member);

		}else {
			memberService.updateMemberInfoExceptPw(member);
		}


		Member memberRes = memberService.selectById(member.getMember_id());

		model.addAttribute("member", memberRes);

		return "redirect: /mypage/info/update";

	}



	@RequestMapping(value="/mypage/myReview", method=RequestMethod.GET)
	public void myReview(Authentication auth, Model model) {

		Member member = (Member) auth.getDetails();

		List<Review> res = memberService.getList(member.getMember_no());

		model.addAttribute("list", res);

	}

	@ResponseBody
	@RequestMapping(value="/mypage/scrabCheck", method=RequestMethod.GET)
	public boolean myScrabCheck(Authentication auth, int recruit_no) {
		//view페이지에서 스크랩버튼을 눌렀을 때 넘어오는 값 

		Member member = (Member) auth.getDetails();

		int member_no = member.getMember_no();

		HashMap map = new HashMap(); 
		map.put("member_no", member_no);
		map.put("recruit_no", recruit_no);

		//스크랩 성공 여부 및 메소드 실행 
		boolean res = mypageService.scrabCheck(map);
		logger.info("scrab Check : "+ res );

		return res;

	}


	@ResponseBody
	@RequestMapping(value="/mypage/scrabInsert", method=RequestMethod.POST)
	public boolean myScrab(Authentication auth, int recruit_no) {
		//view페이지에서 스크랩버튼을 눌렀을 때 넘어오는 값 

		Member member = (Member) auth.getDetails();

		int member_no = member.getMember_no();

		HashMap map = new HashMap(); 
		map.put("member_no", member_no);
		map.put("recruit_no", recruit_no);

		//스크랩 성공 여부 및 메소드 실행 
		boolean res = mypageService.myScrab(map);

		return res;

	}

	@ResponseBody
	@RequestMapping(value="/mypage/scrabCancel", method=RequestMethod.POST) 
	public boolean scrabCancel(Authentication auth, int recruit_no) {

		Member member = (Member) auth.getDetails();

		int member_no = member.getMember_no();

		HashMap map = new HashMap();
		map.put("member_no", member_no);
		map.put("recruit_no", recruit_no);

		boolean res = false;

		res = mypageService.myScrabCancel(map);
		//취소 성공하면 true, 실패하면 false

		return res;

	}


	@RequestMapping(value="/mypage/scrab", method=RequestMethod.GET)
	public void scrab(Authentication auth, Model model) {

		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();

		List<Recruit> list = mypageService.getScrabList(member_no);

		model.addAttribute("list", list);

	}


}
