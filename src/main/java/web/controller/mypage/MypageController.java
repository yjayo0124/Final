package web.controller.mypage;

import java.util.List;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

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

import web.dto.Member;

import web.dto.Review;
import web.dto.mypage.resume.Resume;
import web.dto.mypage.resume.University;
import web.service.member.face.MemberService;
import web.service.mypage.face.IntroductionService;
import web.service.mypage.face.MyCommentService;
import web.service.mypage.face.MyScrapService;
import web.service.mypage.face.MypageService;
import web.service.mypage.face.ResumeService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired MypageService mypageService;
	@Autowired IntroductionService introductionService;
	@Autowired ResumeService resumeService;
	@Autowired MyCommentService myCommentService;
	@Autowired MyScrapService myScrapService;
	
	@Autowired MemberService memberService;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET) 
	public void mypage() {
		logger.info("마이페이지 메인 접속");
		
	}
	
	@RequestMapping(value="/mypage/introduction/list", method=RequestMethod.GET)
	public void introductionList() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.GET)
	public void introductionWrite() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.POST)
	public void introductionWriteProc(HttpServletRequest request) {
		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		System.out.println("----------------------------");

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
	public void resumeList() {
		
	}
	
	@RequestMapping(value="/mypage/resume/write", method=RequestMethod.GET)
	public void resumeWrite() {
		
	}
	
	@RequestMapping(value="/mypage/resume/detail", method=RequestMethod.GET)
	public void resumeDetail() {
		
	}
	
	@RequestMapping(value="/mypage/resume/update", method=RequestMethod.GET)
	public void resumeUpdate() {
		
	}
	
	@RequestMapping(value="/mypage/resume/delete", method=RequestMethod.GET)
	public void resumeDelete() {
		
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
	
	@RequestMapping(value="/mypage/myscrap/list", method=RequestMethod.GET)
	public void myScrapList() {
		
	}
	
	@RequestMapping(value="/mypage/myscrap/delete", method=RequestMethod.GET)
	public void myScrapDelete() {
		
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
		
		String incode_pw = passwordEncoder.encode(member.getMember_pw());
		
		member.setMember_pw(incode_pw);
		
		memberService.update(member);
		
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
	
	
	@RequestMapping(value="/mypage/scrab", method=RequestMethod.GET)
	public void myScrab(Authentication auth, Model model) {
		
		
	}
	
}
