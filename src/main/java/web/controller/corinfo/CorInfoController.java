package web.controller.corinfo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.cor.face.CorDao;
import web.dto.Cor;
import web.service.corinfo.face.CorInfoService;

@Controller
public class CorInfoController {

	private static final Logger logger = LoggerFactory.getLogger(CorInfoController.class);
	
	@Autowired CorInfoService corinfoService;
	
	@RequestMapping(value = "/cor/info", method = RequestMethod.GET) 
	public void corInfo(int cor_no, String cor_type, Model model) {
		logger.info("湲곗뾽�긽�꽭 �럹�씠吏�");
		
		// �빐�떦湲곗뾽 由ъ뒪�듃
		List<Cor> corlist = corinfoService.getCorinfo(cor_no);
		// �빐�떦湲곗뾽 由ъ뒪�듃 test

//		logger.info(corlist.toString());
		
		// date format
		String formatdate = corinfoService.formatDate(corlist);
		
		// �룞醫낆궛�뾽援� 由ъ뒪�듃
		List<Cor> industrylist = corinfoService.getIndustryinfo(cor_type);
		// �룞醫낆궛�뾽援� 由ъ뒪�듃 test
//		logger.info(industrylist.toString());

		// �룞醫낆궛�뾽援� �룊洹� �씤�썝
		int industrymem = corinfoService.addIndustrymem(industrylist);
//		System.out.println(industrymem);
//		System.out.println(formatdate);
		
		// �룞醫낆궛�뾽援� �룊洹� �엯�궗�쑉
		int newmem = corinfoService.addNewmem(industrylist);
		System.out.println(newmem);
		
		// �룞醫낆궛�뾽援� �룊洹� �눜�궗�쑉
		int levmem = corinfoService.addLevmem(industrylist);
		System.out.println(levmem);
		
		model.addAttribute("list", corlist);
		model.addAttribute("formatdate", formatdate);
		model.addAttribute("idmem", industrymem);
		model.addAttribute("newmem", newmem);
		model.addAttribute("levmem", levmem);
	}
	
	/*
	 * @RequestMapping(value = "/cor/info", method = RequestMethod.GET) public void
	 * corInfoByNo(int cor_no, Model model) {
	 * 
	 * Cor cor = corinfoService.getCorByNo(cor_no); List<Cor> corlist =
	 * corinfoService.getCorinfo(cor_no);
	 * 
	 * // date format String formatdate = corinfoService.formatDate(corlist);
	 * 
	 * List<Cor> industrylist = corinfoService.getIndustryinfo(cor.getCor_type());
	 * 
	 * int industrymem = corinfoService.addIndustrymem(industrylist); int newmem =
	 * corinfoService.addNewmem(industrylist); int levmem =
	 * corinfoService.addLevmem(industrylist);
	 * 
	 * 
	 * model.addAttribute("list", corlist); model.addAttribute("formatdate",
	 * formatdate); model.addAttribute("idmem", industrymem);
	 * model.addAttribute("newmem", newmem); model.addAttribute("levmem", levmem); }
	 */
}
