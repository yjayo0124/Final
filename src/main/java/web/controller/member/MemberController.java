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
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.scribejava.core.model.OAuth2AccessToken;

import web.dto.Member;
import web.security.CustomOAuthenticationProvider;
import web.service.member.NaverLoginBO;
import web.service.member.face.MemberService;

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


	@RequestMapping(value="/member/login")
	public String login(Model model, HttpSession session) {
		
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
	
		System.out.println("네이버:" + naverAuthUrl);
		//네이버
		model.addAttribute("url", naverAuthUrl);
		
		return "/member/login";


	
	}
	

	//네이버 로그인 성공시 callback호출 메소드
	@RequestMapping(value = "/member/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String callback(
			Model model, 
			@RequestParam String code, 
			@RequestParam String state, 
			HttpSession session, 
			HttpServletRequest request
			) throws IOException, ParseException {
		
		System.out.println("여기는 callback");
		
		OAuth2AccessToken oauthToken;
		
		oauthToken = naverLoginBO.getAccessToken(session, code, state);
		
		//1. 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken); //String형식의 json데이터
		
		//2. String형식인 apiResult를 json형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		JSONObject jsonObj = (JSONObject) obj;
		
		//3. 데이터 파싱
		//Top레벨 단계 _response 파싱
		JSONObject response_obj = (JSONObject)jsonObj.get("response");
		
		//System.out.println(response_obj);
		//response의 nickname값 파싱
		String social_name = (String)response_obj.get("name");
		String social_id = (String) response_obj.get("id");
		String social_email = (String) response_obj.get("email");
		
		
		String res = null;
		
		if( memberService.memChk(social_id+"@naver") ) {
			//가입한적 있는 사람이면 
			
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
	
	
	
	
	@RequestMapping(value="/member/logout", method=RequestMethod.GET)
	public void logout(HttpSession session) {
		
		session.invalidate();
		
	}
	
	@RequestMapping(value="/member/socialwelcom", method=RequestMethod.GET)
	public void welcom() {
		
		
		
	}
	
	
	
	

	
	
}
