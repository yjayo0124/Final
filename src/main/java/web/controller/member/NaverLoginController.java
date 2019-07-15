package web.controller.member;

import org.json.simple.parser.JSONParser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Member;

@Controller
public class NaverLoginController {

	private static final Logger logger = LoggerFactory.getLogger(NaverLoginController.class);
	
	
	@RequestMapping(value="/member/callback", method=RequestMethod.GET)
	public void callback() {
		
	}
	
	@RequestMapping(value="/member/callback", method=RequestMethod.POST)
	public String callbackProc(@RequestBody Member member) {
		
		logger.info(member.toString());
		

		
		return "redirect:/main";
		
	}

	
	
	
}
