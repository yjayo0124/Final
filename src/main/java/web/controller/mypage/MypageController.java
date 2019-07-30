package web.controller.mypage;

import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.ResponseBody;

import web.dto.Member;
import web.dto.Recruit;
import web.dto.Review;
import web.dto.mypage.resume.Resume;
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
	public void introductionWriteProc(
			HttpServletRequest request,
			String[] school,
			String[] career,
			String[] activities,
			String[] education,
			String[] certificate,
			String[] award,
			String[] overseas_Experience,
			String[] language,
			String[] preferential,
			Resume resume
			)
	{		
		System.out.println(resume);
		resumeService.insertResume(resume);
		int num = resume.getResume_no();
		System.out.println(num);
		
		if(school != null) {
			for(int i=1; i<school.length; i++) {
				HashMap<String,String> map = new HashMap<String,String>();
				String splitArr[] = school[i].split(",",-1);	
				System.out.println(school[i]);
				if(splitArr[0].equals("고등학교")) {
					map.put("school_classification", splitArr[0]);
					map.put("school_name", splitArr[1]);
					map.put("graduation_date", splitArr[2]);
					map.put("graduation_status", splitArr[3]);
					map.put("ged_status", splitArr[4]);
					
					System.out.println(map);
					
				} else if(splitArr[0].equals("대학") || splitArr[0].equals("대학교")) {
					map.put("school_classification", splitArr[0]);
					map.put("school_name", splitArr[1]);
					map.put("graduation_date", splitArr[2]);
					map.put("graduation_status", splitArr[3]);
					map.put("admission_date", splitArr[6]);
					map.put("transfer_status", splitArr[7]);
					map.put("major_name", splitArr[8]);
					map.put("credit", splitArr[9]);
					map.put("total_score", splitArr[10]);
					map.put("sub_major_status", splitArr[11]);
					map.put("sub_major_name", splitArr[12]);
					map.put("graduation_thesis_content", splitArr[13]);
					
					System.out.println(map);
					
				} else if(splitArr[0].equals("대학원")) {
					map.put("school_classification", splitArr[0]);
					map.put("school_name", splitArr[1]);
					map.put("graduation_date", splitArr[2]);
					map.put("graduation_status", splitArr[3]);
					map.put("academic_degree", splitArr[5]);
					map.put("admission_date", splitArr[6]);
					map.put("transfer_status", splitArr[7]);
					map.put("major_name", splitArr[8]);
					map.put("credit", splitArr[9]);
					map.put("total_score", splitArr[10]);
					map.put("sub_major_status", splitArr[11]);
					map.put("sub_major_name", splitArr[12]);
					map.put("graduation_thesis_content", splitArr[13]);
					
					System.out.println(map);
				}
			}
		}
		
		if(career != null) {
			for(int i=1; i<career.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = career[i].split(",",-1);
					
					map.put("company_name", splitArr[0]);
					map.put("department_name", splitArr[1]);
					map.put("hire_date", splitArr[2]);
					map.put("retirement_date", splitArr[3]);
					map.put("served_status", splitArr[4]);
					map.put("position", splitArr[5]);
					map.put("job_work", splitArr[6]);
					map.put("salary", splitArr[7]);
					map.put("assigned_task", splitArr[8]);
					
					System.out.println(map);
			}
			
		}
		
		
		if(activities != null) {
			for(int i=1; i<activities.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = activities[i].split(",",-1);
					
					map.put("activity_classification", splitArr[0]);
					map.put("institution_name", splitArr[1]);
					map.put("start_date", splitArr[2]);
					map.put("end_date", splitArr[3]);
					map.put("activity_content", splitArr[4]);
					
					System.out.println(map);
			}
			
		}
		
		
		if(education != null) {
			for(int i=1; i<education.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = education[i].split(",",-1);
					
					map.put("training_title", splitArr[0]);
					map.put("education_facilities", splitArr[1]);
					map.put("start_date", splitArr[2]);
					map.put("end_date", splitArr[3]);
					map.put("training_content", splitArr[4]);
					
					System.out.println(map);
			}
			
		}
		
		
		if(certificate != null) {
			for(int i=1; i<certificate.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = certificate[i].split(",",-1);
					map.put("certificate_name", splitArr[0]);
					map.put("place_issue", splitArr[1]);
					map.put("acquisition_date", splitArr[2]);
					
					System.out.println(map);
			}
			
		}
		
		
		if(award != null) {
			for(int i=1; i<award.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = award[i].split(",",-1);
					
					map.put("award_name", splitArr[0]);
					map.put("award_service", splitArr[1]);
					map.put("award_date", splitArr[2]);
					map.put("award_content", splitArr[3]);
					
					System.out.println(map);
			}
			
		}
		
		
		if(overseas_Experience != null) {
			for(int i=1; i<overseas_Experience.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = overseas_Experience[i].split(",",-1);
					
					map.put("country_name", splitArr[0]);
					map.put("start_date", splitArr[1]);
					map.put("end_date", splitArr[2]);
					map.put("overseas_experience_content", splitArr[3]);
					
					System.out.println(map);
			}
			
		}
		
		if(language != null) {
			for(int i=1; i<language.length; i++) {
				HashMap<String,String> map = new HashMap<String,String>();
				String splitArr[] = language[i].split(",",-1);	
				System.out.println(language[i]);
				if(splitArr[0].equals("회화능력")) {
					map.put("language_classification", splitArr[0]);
					map.put("language_name", splitArr[1]);
					map.put("conversation_ability", splitArr[3]);
					
					System.out.println(map);
					
				} else if(splitArr[0].equals("공인시험")) {
					map.put("language_classification", splitArr[0]);
					map.put("language_name", splitArr[1]);
					map.put("language_score", splitArr[2]);
					map.put("conversation_ability", splitArr[3]);
					map.put("acquisition_date", splitArr[4]);
					
					System.out.println(map);
				}
			}
		}
		
		
		if(preferential != null) {
			for(int i=1; i<preferential.length; i++) {
					HashMap<String,String> map = new HashMap<String,String>();
					String splitArr[] = preferential[i].split(",",-1);
					
					map.put("veterans", splitArr[0]);
					map.put("protect", splitArr[1]);
					map.put("funding", splitArr[2]);
					map.put("disorder", splitArr[3]);
					map.put("military", splitArr[4]);
					
					System.out.println(map);
			}
			
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
