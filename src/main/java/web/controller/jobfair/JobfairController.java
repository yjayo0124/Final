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
import org.springframework.web.servlet.ModelAndView;

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
//		System.out.println(list);
		
		return list;
	}
	
	@RequestMapping(value="/jobfair/search", method=RequestMethod.GET)
	public void search(
			String search,
			Model model
		) {
		
		logger.info("검색");
		
		List<JobFair> list = jobfairService.jobFairSearch(search);
//		System.out.println(list);
		
		model.addAttribute("list", list);
		
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
			@RequestParam(value="file") MultipartFile fileupload
		) {
		
		if( fileupload.getOriginalFilename().equals("") ) {

			logger.info("등록 처리");
			
			jobfairService.registerFair(jobfair);
			
			return "redirect:/jobfair/main";
			
		} else {

			logger.info("파일업로드 처리");
			
			logger.info("파일 : " + fileupload.getOriginalFilename());
			logger.info(context.getRealPath("upload"));
			
			jobfairService.registerFair(jobfair);
			
			int jobfair_no = jobfair.getJobfair_no();
//			System.out.println(jobfair_no);
			
			fileService.filesave(jobfair_no, fileupload, context);
			
		}
		
		return "redirect:/jobfair/main";
	}
	
	
	@RequestMapping(value="/jobfair/adminview")
	public void adminView(
			Model model,
			int jobfair_no
		) {
		logger.info("adminview 폼");
		
		JobFair viewmap = jobfairService.adminView(jobfair_no);
//		System.out.println("viewmap: " + viewmap);
		
		model.addAttribute("viewmap", viewmap);

		logger.info("view: " + jobfair_no);

		String file_name = fileService.getFilename(jobfair_no);
		model.addAttribute("file", file_name);

	}

	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.GET)
	public ModelAndView update(
			ModelAndView mav,
			int jobfair_no
		) {
		logger.info("업데이트 폼");
		
		JobFair update = jobfairService.adminView(jobfair_no);
//		System.out.println("update: " + update);
		
		mav.addObject("update", update);
		logger.info("update: " + jobfair_no);
		
		String file_name = fileService.getFilename(jobfair_no);
		mav.addObject("file", file_name);
		
		return mav;
		
	}
	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.POST)
	public String updateProc(
			JobFair jobfair,
			@RequestParam(value="file") MultipartFile fileupload
		) {
		
		if( fileupload.getOriginalFilename().equals("") ) {

			logger.info("업데이트 처리");
			
			jobfairService.updateFair(jobfair);
			
			return "redirect:/jobfair/main";
			
		} else {

			logger.info("파일업로드 처리");
			
			logger.info("파일 : " + fileupload.getOriginalFilename());
			logger.info(context.getRealPath("upload"));
			
			jobfairService.updateFair(jobfair);
			
			int jobfair_no = jobfair.getJobfair_no();
			System.out.println(jobfair_no);
			
			fileService.filesave(jobfair_no, fileupload, context);
			
		}
		
		return "redirect:/jobfair/main";
	}
	
	
	@RequestMapping(value="/jobfair/delete", method=RequestMethod.GET)
	public String deleteProc(
			int jobfair_no
		) {
		logger.info("삭제 처리");
		
		fileService.deleteFile(jobfair_no);
		jobfairService.deleteFair(jobfair_no);
		
		return "redirect:"+"/jobfair/main";
	}

}
