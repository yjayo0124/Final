package web.controller.recruitment;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.Recruit;
import web.service.recruitment.face.RecruitmentService;
import web.util.Paging;

@Controller
public class RecruitmentController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitmentController.class);
	
	@Autowired RecruitmentService recruitmentService;

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
		
//		recruitmentService.getList(paging);
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
	}
	
	@RequestMapping(value="/recruitment/write", method= RequestMethod.POST)
	public void recruitWriteProc(Recruit recruit, HttpSession session) {
		
	}
	@RequestMapping(value = "/recruitment/update", method = RequestMethod.GET) 
	public void recruitUpdate() {
		
	}
	
	@RequestMapping(value = "/recruitment/delete", method = RequestMethod.GET) 
	public void recruitDelete() {
		logger.info("채용공고 삭제");
	}
	

}
