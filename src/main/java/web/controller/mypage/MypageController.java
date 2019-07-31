package web.controller.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Member;
import web.dto.Recruit;
import web.dto.Review;
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
import web.service.member.face.MemberService;
import web.service.mypage.face.IntroductionService;
import web.service.mypage.face.MyCommentService;
import web.service.mypage.face.MypageService;
import web.service.mypage.face.ResumeService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired MypageService mypageService;
	@Autowired IntroductionService introductionService;
	@Autowired ResumeService resumeService;
	@Autowired MyCommentService myCommentService;

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

	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.POST)
	public void introductionWriteProc(
			Resume resume,
			HttpServletRequest request,
			HttpServletResponse response
			)
	{		
			System.out.println("이력서 정보 : " + resume);
			resumeService.insertResume(resume);
			System.out.println("이력서 정보 : " + resume);
			PrintWriter out;
			try {
				out = response.getWriter();
				int number = resume.getResume_no();
				System.out.println(number);
				out.write(number); 
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 

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
