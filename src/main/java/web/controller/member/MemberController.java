package web.controller.member;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;
import web.service.member.face.MemberService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired MemberService memberService;
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET) 
	public void join() {
		logger.info("회원가입폼");
		
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.POST) 
	public String joinProc(Member member) {
		
		logger.info(member.toString());
		memberService.join(member);
		
		return "redirect:"+"/main";
	}


	@RequestMapping(value="/member/login", method=RequestMethod.GET)
	public void login() {
		logger.info("로그인 폼 check");
	
	}
	
	
	
	@RequestMapping(value="/member/login", method=RequestMethod.POST)
	public void loginProc() {
		logger.info("네아로 확인");

		
	}
	
	
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public void logout(HttpSession session) {
		
		session.invalidate();
		
	}
	

	
	
}
