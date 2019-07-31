package web.controller.jobfair;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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
import web.dto.JobFairFile;
import web.dto.Member;
import web.service.jobfair.face.JobFairFileService;
import web.service.jobfair.face.JobFairService;
import web.util.MapUtil;

@Controller
public class JobfairController {
	
	@Autowired JobFairService jobfairService;
	@Autowired MemberDao memberDao;
	@Autowired ServletContext context;
	@Autowired JobFairFileService fileService;
	@Autowired MapUtil maputil;
	
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
	
//	@RequestMapping(value="/jobfair/geocoder", method = RequestMethod.POST, produces = {"application/json"}) 
	@RequestMapping(value="/jobfair/geocoder")
	@ResponseBody
	public Map<String, Object> jobfairgeo(
			JobFair jobfair
		){
		
		logger.info("구글 맵");
		
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		jobfair = jobfairService.mapList();
//		System.out.println("mapList: " + jobfair);
		System.out.println("address: " + jobfair.getJobfair_loc());
		
		Float[] coords = maputil.geoCoding(jobfair);
		System.out.println("maputil: " + maputil.geoCoding(jobfair));
		System.out.println("coords: " + coords);
		
		retVal.put("id", "success");
		retVal.put("latitude", ""+coords[0]);
		retVal.put("longitude", coords[1]);
		System.out.println("geocode: " + retVal);
		
		return retVal;
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
	
	
	@RequestMapping(value="/jobfair/adminview", method=RequestMethod.GET)
	public void adminView(
			JobFair jobfair,
			Model model,
			int jobfair_no
		) {
		logger.info("adminview 폼");
		
		JobFair viewmap = jobfairService.adminView(jobfair);
//		System.out.println("viewmap: " + viewmap);
		
		model.addAttribute("viewmap", viewmap);

		logger.info("view: " + jobfair_no);

		String file_name = fileService.getFilename(jobfair_no);
		model.addAttribute("file", file_name);
		
	}
	
	@RequestMapping(value="/jobfair/adminview", method=RequestMethod.POST)
	public String adminViewProc(JobFair jobfair) {
		logger.info("adminview 처리");
		
		return "redirect:/jobfair/update?jobfair_no=" + jobfair.getJobfair_no();
	}
	
	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.GET)
	public void update(
			JobFair jobfair,
			Model model,
			int jobfair_no
		) {
		logger.info("업데이트 폼");
		
		JobFair update = jobfairService.adminView(jobfair);
//		System.out.println("update: " + update);
		
		model.addAttribute("update", update);
		
		logger.info("update: " + jobfair_no);
		
		String file_name = fileService.getFilename(jobfair_no);
		model.addAttribute("file", file_name);
		
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
			JobFair jobfair, 
			JobFairFile jobfairfile
		) {
		logger.info("삭제 처리");
		
		jobfairService.deleteFair(jobfair);
		fileService.deleteFile(jobfairfile);
		
		return "redirect:/jobfair/main";
	}

}
