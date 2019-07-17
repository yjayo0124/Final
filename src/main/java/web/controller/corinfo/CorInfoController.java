package web.controller.corinfo;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Cor;
import web.service.corinfo.face.CorInfoService;

@Controller
public class CorInfoController {

	private static final Logger logger = LoggerFactory.getLogger(CorInfoController.class);
	
	@Autowired CorInfoService corinfoService;
	
	@RequestMapping(value = "/cor/info", method = RequestMethod.GET) 
	public void corInfo(int cor_no, String cor_type, Model model) {
		logger.info("기업상세 페이지");
		
		// 해당기업 리스트
		List<Cor> corlist = corinfoService.getCorinfo(cor_no);
		// 해당기업 리스트 test
//		logger.info(corlist.toString());
		
		// date format
		String formatdate = corinfoService.formatDate(corlist);
		
		// 동종산업군 리스트
		List<Cor> industrylist = corinfoService.getIndustryinfo(cor_type);
		// 동종산업군 리스트 test
//		logger.info(industrylist.toString());

		// 동종산업군 평균 인원
		int industrymem = corinfoService.addIndustrymem(industrylist);
//		System.out.println(industrymem);
//		System.out.println(formatdate);
		
		// 동종산업군 평균 입사율
		int newmem = corinfoService.addNewmem(industrylist);
		System.out.println(newmem);
		
		// 동종산업군 평균 퇴사율
		int levmem = corinfoService.addLevmem(industrylist);
		System.out.println(levmem);
		
		model.addAttribute("list", corlist);
		model.addAttribute("formatdate", formatdate);
		model.addAttribute("idmem", industrymem);
		model.addAttribute("newmem", newmem);
		model.addAttribute("levmem", levmem);
	}
}
