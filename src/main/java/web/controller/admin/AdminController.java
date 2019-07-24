package web.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String main(
			Model model,
			@RequestParam(defaultValue = "0") int curPage, 
			Paging search, String select
			) {	
	
		int totalcount = adminService.getTotal(search);

		Paging paging = new Paging(totalcount, curPage);
		
		paging.setSearch(search.getSearch());
		
		model.addAttribute("paging", paging);
		
		List<Member> list = adminService.getSearchPagingList(paging);		

		model.addAttribute("list", list);
		
		return "/admin";
	}
	
	@RequestMapping(value = "/adminCorList", method = RequestMethod.GET)
	public String mainCor(
			Model model, 
			@RequestParam(defaultValue = "0") int curPage,
			Paging search, String select
			) {
		
		int totalcount = adminService.getCorTotal(search);
		
		Paging paging = new Paging(totalcount, curPage);
		paging.setSearch(search.getSearch());
		
		model.addAttribute("paging", paging);
		
		List<Member> list = adminService.getSearchPagingCorList(paging);
		
		model.addAttribute("list", list);
				
		return "/adminCorList";
	}
	
}
