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
import web.dto.mypage.resume.Resume;
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
	public void introductionList() {
		
	}

	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.GET)
	public void introductionWrite() {

	}
	

	@RequestMapping(value="/mypage/introduction/detail", method=RequestMethod.GET)
	public void introductionDetail() {

	}

	@RequestMapping(value="/mypage/introduction/update", method=RequestMethod.GET)
	public void introductionUpdate() {

	}

	@RequestMapping(value="/mypage/introduction/delete", method=RequestMethod.GET)
	public void introductionDelete() {

	}

	@RequestMapping(value="/mypage/introduction/selectMain", method=RequestMethod.GET)
	public void introductionMain() {

	}

	@RequestMapping(value="/mypage/introduction/releaseMain", method=RequestMethod.GET)
	public void introductionReleaseMain() {

	}

	@RequestMapping(value="/mypage/resume/list", method=RequestMethod.GET)
	public void resumeList(HttpServletRequest request, Authentication auth, Model model) {
		
		Member member = (Member) auth.getDetails();
		int member_no = member.getMember_no();
		
		Boolean checkResume = resumeService.checkResume(member_no);
		
		MypagePaging paging = resumeService.getCurPage(request, member_no);
		
		List<Resume> list = resumeService.getList(paging);
		System.out.println(list.toString());
		
		
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
			HttpServletResponse response
			) {
		String resume_stored_name = resumeService.filesave(upfile, context);
		resume.setResume_stored_name(resume_stored_name);
		logger.info("이력서 정보 : " + resume);
		resumeService.insertResume(resume);
		logger.info("작성 후 이력서 정보 : " + resume);
		int resume_no = resume.getResume_no();
		logger.info("작성 후 이력서 번호 : " + resume_no);
		String data = Integer.toString(resume_no);
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
	
	@RequestMapping(value="/mypage/resume/writeinfo", method=RequestMethod.POST)
	public void resumeWriteProc(
			int resume_no,
			String[] school,
			String[] career,
			String[] activities,
			String[] education,
			String[] certificate,
			String[] award,
			String[] overseas_Experience,
			String[] language,
			String[] preferential) {
		
		logger.info("info 이력서 번호 : "+resume_no);
			
		if(school != null) {
			resumeService.insertSchool(school, resume_no);
		}

		if(career != null) {
			resumeService.insertCareer(career, resume_no);
		}


		if(activities != null) {
			resumeService.insertActivities(activities, resume_no);
		}


		if(education != null) {
			resumeService.insertEducation(education, resume_no);
		}


		if(certificate != null) {
			resumeService.insertCertificate(certificate, resume_no);
		}


		if(award != null) {
			resumeService.insertAward(award, resume_no);
		}


		if(overseas_Experience != null) {
			resumeService.insertOverseas_Experience(overseas_Experience, resume_no);
		}

		if(language != null) {
			resumeService.insertLanguage(language, resume_no);
		}


		if(preferential != null) {
			resumeService.insertPreferential(preferential, resume_no);
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

	@RequestMapping(value="/mypage/resume/selectMain", method=RequestMethod.GET)
	public void resumeMain() {

	}

	@RequestMapping(value="/mypage/resume/releaseMain", method=RequestMethod.GET)
	public void resumeReleaseMain() {

	}

	@RequestMapping(value="/mypage/mycomment/list", method=RequestMethod.GET)
	public void myCommentList() {

	}

	@RequestMapping(value="/mypage/mycomment/delete", method=RequestMethod.GET)
	public void myCommentDelete() {

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
