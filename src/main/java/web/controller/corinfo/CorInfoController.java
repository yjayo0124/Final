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
	public void corInfo(int cor_no, Model model) {

		List<Cor> corlist = corinfoService.getCorinfo(cor_no);
		

//		logger.info(corlist.toString());
		
		model.addAttribute("list", corlist);
	}
}
