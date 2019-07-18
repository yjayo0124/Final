package web.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Member;
import web.service.admin.face.AdminService;
import web.util.admin.Paging;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView main(
			ModelAndView mav, 
			@RequestParam(defaultValue = "1") int curPage
			) {
		Paging paging = adminService.getCurPage(curPage);
		mav.addObject("paging", paging);
		
		List<Member> list = adminService.getList(paging);
	
		logger.info(list.toString());
		mav.addObject("list", list);
				
		return mav;
	}
	
	@RequestMapping(value = "/adminCorList", method = RequestMethod.GET)
	public ModelAndView mainCor(
			ModelAndView mav, 
			@RequestParam(defaultValue = "1") int curPage
			) {
		Paging paging = adminService.getCurPage(curPage);
		mav.addObject("paging", paging);
		
		List<Member> list = adminService.getCorList(paging);
	
		logger.info(list.toString());
		mav.addObject("list", list);
				
		return mav;
	}
	
}
