package web.controller.cor;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.controller.main.MainController;
import web.dto.Cor;
import web.dto.Member;
import web.service.cor.face.CorService;
import web.service.member.face.MemberService;

@Controller
public class CorController {

	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	CorService corSerivce;
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/cor/main", method=RequestMethod.GET)
	public void corMain(Authentication auth, Model model) {
	
		if(auth == null) {
			return;
		}else {
			Member member = (Member) auth.getDetails();
			
			model.addAttribute("cor", corSerivce.select(member.getCompany_no()));
		}
			
	}
	
	
	@RequestMapping(value="/cor/infoUpdate", method=RequestMethod.GET)
	public void corInfoUpdate(Authentication auth, Model model) {
		
		Member member = (Member) auth.getDetails();
		Cor cor = (Cor) corSerivce.select(member.getCompany_no());
		
		model.addAttribute("member", member);
		model.addAttribute("cor", cor);
		
	
	}
	
	
	@RequestMapping(value="/cor/infoUpdate", method=RequestMethod.POST)
	public void corInfoUpdateProc(Member member, Cor cor) {
		
		memberService.update(member);
		
		corSerivce.update(cor);

		logger.info(cor.toString());
		
		
	
	}
	
	
}
