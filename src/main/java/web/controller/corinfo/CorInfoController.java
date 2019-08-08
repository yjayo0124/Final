package web.controller.corinfo;

import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Cor;
import web.dto.Recruit;
import web.service.corinfo.face.CorInfoService;

@Controller
public class CorInfoController {

	private static final Logger logger = LoggerFactory.getLogger(CorInfoController.class);
	
	@Autowired CorInfoService corinfoService;
	
	
	@RequestMapping(value = "/cor/info", method = RequestMethod.GET) 
	public void corInfo(int cor_no, String cor_type, Model model) {

		// �빐�떦湲곗뾽 由ъ뒪�듃
		List<Cor> corlist = corinfoService.getCorinfo(cor_no);
		System.out.println(corlist);
		// 해당기업 date format
		String formatdate = corinfoService.formatDate(corlist);
		
		// �룞醫낆궛�뾽援� 由ъ뒪�듃
		List<Cor> industrylist = corinfoService.getIndustryinfo(cor_type);

		// 동종산업군 date format
		String idformatdate = corinfoService.idformatDate(industrylist);
		
		// 동종산업군 평균 인원
		int industrymem = corinfoService.addIndustrymem(industrylist);
		
		// �룞醫낆궛�뾽援� �룊洹� �엯�궗�쑉
		int newmem = corinfoService.addNewmem(industrylist);
		
		// �룞醫낆궛�뾽援� �룊洹� �눜�궗�쑉
		int levmem = corinfoService.addLevmem(industrylist);
		System.out.println("levmem : " + levmem);
		// 기업리뷰 리스트
		List<HashMap<String, Object>> corReview = corinfoService.getReview(cor_no);
		
	//	String corname = corinfoService.getCorname(cor_no);
		
		
		// 기업 채용공고 리스트
		List<Recruit> corRecruit = corinfoService.getRecruit(cor_no);
		

	//	System.out.println(corname);
		System.out.println(corRecruit);
		model.addAttribute("list", corlist);
		model.addAttribute("formatdate", formatdate);
		model.addAttribute("idformatdate", idformatdate);
		model.addAttribute("idmem", industrymem);
		model.addAttribute("newmem", newmem);
		model.addAttribute("levmem", levmem);
		model.addAttribute("corReview", corReview);
		model.addAttribute("corRecruit", corRecruit);
	}
	
}
