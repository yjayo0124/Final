package web.controller.member;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.scribejava.core.model.OAuth2AccessToken;

import web.dto.Member;
import web.security.CustomOAuthenticationProvider;
import web.service.member.NaverLoginBO;
import web.service.member.face.MemberService;
import web.service.review.face.ReviewService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	
	private String apiResult = null;
	
	@Autowired
	private CustomOAuthenticationProvider cap;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}

	@Autowired MemberService memberService;
	@Autowired ReviewService reviewService;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/member/join", method = RequestMethod.GET) 
	public void join() {
	//	logger.info("join form");
		
	}
	
	@RequestMapping(value = "/member/join", method = RequestMethod.POST) 
	public String joinProc(Member member) {
		
		String pw = passwordEncoder.encode(member.getMember_pw());
		
		member.setMember_pw(pw);
		
		//logger.info(member.toString());
		
		
		memberService.join(member);
		
		
		return "redirect:"+"/main";
	}


	@RequestMapping(value="/member/login")
	public String login(Model model, HttpSession session) {
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	
	//	System.out.println("naver authUrl : " + naverAuthUrl);

		model.addAttribute("url", naverAuthUrl);
		
		return "/member/login";


	
	}

	@RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(
			Model model, 
			@RequestParam String code, 
			@RequestParam String state, 
			HttpSession session, 
			HttpServletRequest request
			) throws IOException, ParseException {
				
		OAuth2AccessToken oauthToken;
		
		oauthToken = naverLoginBO.getAccessToken(session, code, state);

		apiResult = naverLoginBO.getUserProfile(oauthToken);
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		String social_name = (String)response_obj.get("name");
		String social_id = (String) response_obj.get("id");
		String social_email = (String) response_obj.get("email");
		
		
		String res = null;
		
		if( memberService.memChk(social_id+"@naver") ) {

			
			model.addAttribute("member_id", social_id);
			model.addAttribute("token", oauthToken.getAccessToken());
			
			Authentication authentication = cap.authenticate(social_id, oauthToken.getAccessToken());
	
			SecurityContextHolder.getContext().setAuthentication(authentication);
			
			session = request.getSession(true);
			
			session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY,
					SecurityContextHolder.getContext());
			
			return "redirect:"+"/main";
			
		}else {
			
			model.addAttribute("member_id", social_id+"@naver");
			model.addAttribute("member_name", social_name);
			model.addAttribute("member_email", social_email);
			
			return "redirect:"+"/member/socialjoin";
		}
		
		
		

		
		
		
		
	}


	@RequestMapping(value="/member/socialjoin", method=RequestMethod.GET)
	public void socialJoin() {
	}
	
	@RequestMapping(value="/member/socialjoin", method=RequestMethod.POST)
	public String socialJoinProc(Member member) {
		
		memberService.socialJoin(member);

		
		return "redirect: /member/socialwelcom";
	}
	

	
	@RequestMapping(value="/member/corJoin", method=RequestMethod.GET)
	public void corJoin() {		
	
	}

	
	
	@RequestMapping(value="/member/corJoin", method=RequestMethod.POST)
	public String corJoinProc(Member member, String selectCor) {		
		
		int corno = reviewService.getCorno(selectCor);

		member.setCompany_no(corno);
		
		String pw = passwordEncoder.encode(member.getMember_pw());
		
		member.setMember_pw(pw);
		
		
		memberService.corJoin(member);
		
		return "redirect:"+"/main";
		
	}

	
	
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public void logout(HttpSession session) {
		session.invalidate();
	}
	
	@RequestMapping(value="/member/socialwelcom", method=RequestMethod.GET)
	public void welcom() {
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="/member/idCheck")
	public boolean idCheck(String member_id, Model model) {
			
		logger.info(member_id);
		
		boolean check = memberService.memChk(member_id);
		//if false== id create ok , if true == id create false;.
		
	//	logger.info("check: "+check);
		
		return check;
	}
	

	
	
}
