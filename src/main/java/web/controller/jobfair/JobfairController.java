package web.controller.jobfair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import web.dao.member.face.MemberDao;
import web.dto.JobFair;
import web.dto.Member;
import web.service.jobfair.face.JobFairFileService;
import web.service.jobfair.face.JobFairService;

@Controller
public class JobfairController {
	
	@Autowired JobFairService jobfairService;
	@Autowired MemberDao memberDao;
	@Autowired ServletContext context;
	@Autowired JobFairFileService fileService;
	
	private static final Logger logger = LoggerFactory.getLogger(JobfairController.class);
	
	@RequestMapping(value="/jobfair/main")
	public void jobfair() {
		logger.info("메인");
	}

	@RequestMapping(value="/jobfair/list") 
	@ResponseBody
	public ArrayList<HashMap<String, Object>> jobfairlist(
			Model model
			, ArrayList<HashMap<String, Object>> list
		) {
		logger.info("리스트");
		
		list = (ArrayList<HashMap<String, Object>>) jobfairService.calList();
		System.out.println(list);
		
		return list;
	}

	@RequestMapping(value="/jobfair/register", method=RequestMethod.GET)
	public void register(
			Model model,
			Member member
		) {
		logger.info("등록 폼");
		
		//member_id 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String member_id = auth.getName();
//		System.out.println("member_id : " + member_id);
		
		member = memberDao.getUserDetails(member_id);
//		System.out.println("member : " + member);
		
		model.addAttribute("member_id", member_id);
		model.addAttribute("member", member);
		
	}
	
	@RequestMapping(value="/jobfair/register", method=RequestMethod.POST)
	public String registerProc(
			JobFair jobfair,
			String jobfair_name,
			@RequestParam(value="file") MultipartFile fileupload
		) {
		logger.info("등록 처리");
		
		jobfairService.registerFair(jobfair);
				
		logger.info("파일업로드 처리");
		
		logger.info("제목 : " + jobfair_name);
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("upload"));
		
		fileService.filesave(jobfair_name, fileupload, context);
		
		return "redirect:/jobfair/main";
		
	}
	
	@RequestMapping(value="/jobfair/adminview", method=RequestMethod.GET)
	public void adminView(
			JobFair jobfair,
			Model model
		) {
		logger.info("adminview 폼");
		
		List<HashMap<String, Object>> viewmap = jobfairService.adminView(jobfair);
		System.out.println("viewmap: " + viewmap);
		
		model.addAttribute("viewmap", viewmap);
		
	}
	
	@RequestMapping(value="/jobfair/adminview", method=RequestMethod.POST)
	public void adminViewProc(JobFair jobfair) {
		logger.info("adminview 처리");
	}
	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.GET)
	public void update() {
		logger.info("업데이트 폼");
	}
	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.POST)
	public void updateProc(JobFair jobfair) {
		logger.info("업데이트 처리");
	}

}
