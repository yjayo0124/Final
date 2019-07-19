package web.controller.recruitment;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.dto.Member;
import web.dto.Recruit;
import web.service.recruitment.face.RecruitmentService;
import web.util.Paging;

@Controller
public class RecruitmentController {

	@Autowired ServletContext context;
	@Autowired RecruitmentService recruitmentService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecruitmentController.class);
	
	@RequestMapping(value = "/recruitment/main", method = RequestMethod.GET) 
	public void recruitList(HttpServletRequest req, Model model) {
//		logger.info("채용공고 리스트페이지");
	
		//요청 파라미터에서 curPage 얻어오기
		Paging paging = recruitmentService.getCurPage(req);
		
		//MODEL로 paging 객체 넣기
		req.setAttribute("paging", paging);
	
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getList(paging);
		
		//Model로 조회결과 넣기
		model.addAttribute("recruitList", list);		
		

	}
	
	@RequestMapping(value = "/recruitment/view", method = RequestMethod.GET) 
	public void recruitView(HttpServletRequest req, Model model) {
		
		logger.info("채용공고 상세페이지");
		int recruit_no = recruitmentService.getRecruitno(req);
		model.addAttribute("recruit_no",recruit_no);
		
		Recruit recruit = recruitmentService.view(recruit_no);
		model.addAttribute("viewRecruit", recruit);
		
	}
	
	@RequestMapping(value = "/recruitment/write", method = RequestMethod.GET) 
	public void recruitWriteForm() {
		logger.info("글쓰기 폼");
	}
	
	@RequestMapping(value="/recruitment/write", method= RequestMethod.POST)
	public String recruitWriteProc(
			Recruit recruit,
			Authentication auth,
			@RequestParam(value="file") MultipartFile fileupload
			) {
	
		logger.info("글쓰기");
		Member member = (Member) auth.getDetails();

		
		logger.info("파일업로드 처리");
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("upload"));
		
		//첨부파일 저장
		recruitmentService.filesave( fileupload, context);
	
		//글 저장
		recruitmentService.write(recruit);
		
		return "redirect:/recruitment/main";
	}
	
	@RequestMapping(value = "/recruitment/update", method = RequestMethod.GET) 
	public ModelAndView recruitUpdate(int recruit_no, ModelAndView mav) {
		
		mav.addObject("recruit", recruitmentService.view(recruit_no));
		
		return mav;
		
	}
	
	@RequestMapping(value="/recruitment/update", method=RequestMethod.POST)
	public String updateProc(Recruit recruit) {
		
		//logger.info(board.toString());
		recruitmentService.update(recruit);
		
		return "redirect:"+"/recruitment/view?recruit_no="+recruit.getRecruit_no();
		
	}
	@RequestMapping(value = "/recruitment/delete", method = RequestMethod.GET) 
	public void recruitDelete() {
		logger.info("채용공고 삭제");
	}
	

}
