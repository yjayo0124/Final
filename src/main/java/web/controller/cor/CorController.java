package web.controller.cor;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Cor;
import web.dto.Member;
import web.dto.Recruit;
import web.service.cor.face.CorService;
import web.service.member.face.MemberService;
import web.service.recruitment.face.RecruitmentService;

@Controller
public class CorController {

	private static final Logger logger = LoggerFactory.getLogger(CorController.class);
	
	@Autowired
	CorService corSerivce;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	RecruitmentService recruitmentService;
	
	@Autowired
    private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/cor/main", method=RequestMethod.GET)
	public void corMain(Authentication auth, Model model) {
	
		if(auth == null) {
			return;
		}else {
			Member member = (Member) auth.getDetails();
			
			model.addAttribute("cor", corSerivce.select(member.getCompany_no()));
			
			List<Recruit> list = recruitmentService.getListByMemberNo(member.getMember_no());
			
			model.addAttribute("list", list);
		}
			
	}
	
	@RequestMapping(value="/cor/memCheck", method=RequestMethod.GET)
	public void corInfoCheck(Authentication auth, Model model) {

	}
	
	
	@RequestMapping(value="/cor/memCheck", method=RequestMethod.POST)
	public String corInfoCheckProc(Authentication auth, String member_pw) {
		
		Member member = (Member) auth.getDetails();
		
		if( passwordEncoder.matches(member_pw, member.getMember_pw())) {
			
			return "redirect: /cor/memUpdate";			
		}else { 
			
			return "redirect: /cor/memCheck";
		}
		
		
	}
	
	@RequestMapping(value="/cor/memUpdate", method=RequestMethod.GET)
	public void corInfoUpdate(Authentication auth, Model model) {
		
		Member member = (Member) auth.getDetails();
	
		Member memberRes = memberService.selectById(member.getMember_id());
		
		Cor cor = (Cor) corSerivce.select(member.getCompany_no());
		
		model.addAttribute("member", memberRes);
		model.addAttribute("cor", cor);
		
	
	}
	
	
	@RequestMapping(value="/cor/memUpdate", method=RequestMethod.POST)
	public String corInfoUpdateProc(Member member, Cor cor, Model model) {
		
//		logger.info("member : "+member);
//		logger.info("cor : "+cor);
		
		if( member.getMember_pw() !=null && !member.getMember_pw().isEmpty()){
			
			String incode_pw = passwordEncoder.encode(member.getMember_pw());
			
			member.setMember_pw(incode_pw);
			
			memberService.update(member);
			corSerivce.update(cor);
			
		}else {

			memberService.updateMemberInfoExceptPw(member);
			corSerivce.update(cor);
		}

		Member memberRes = memberService.selectById(member.getMember_id());
		Cor corRes = (Cor) corSerivce.select(member.getCompany_no());
		
		model.addAttribute("member", memberRes);
		model.addAttribute("cor", corRes);
		
		return "redirect: /cor/memUpdate";
	
	}
	
	
}
