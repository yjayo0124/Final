package web.controller.recruitment;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

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

import web.dto.Member;
import web.dto.Recruit;
import web.service.cor.face.CorService;
import web.service.mypage.face.MypageService;
import web.service.recruitment.face.RecruitmentService;
import web.util.Paging;

@Controller
public class RecruitmentController {

	@Autowired ServletContext context;
	@Autowired RecruitmentService recruitmentService;
	@Autowired CorService corService;
	@Autowired MypageService mypageService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecruitmentController.class);
	
	@RequestMapping(value = "/recruitment/main", method = RequestMethod.GET) 
	public void recruitList( HttpServletRequest req, Model model) {
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
	public void recruitView(Recruit recruit, int recruit_no, Model model) {
		
		logger.info("채용공고 상세페이지 :: 조회할 recruit_no --> "+recruit_no);
		
		Recruit res = recruitmentService.view(recruit_no);
		logger.info("조회한 데이터 :" + res.toString());
		model.addAttribute("viewRecruit", res);

		String file_name = recruitmentService.getFilename(recruit_no);
	//	logger.info("db에서 조회한 파일 이름  : "+file_name);
		model.addAttribute("file", file_name);
		
		String cor_no = recruitmentService.getCor_no(recruit_no);
		model.addAttribute("cor", cor_no);	
		
	}


	@RequestMapping(value = "/recruitment/write", method = RequestMethod.GET) 
	public void recruitWriteForm(Authentication auth, Model model) {
		logger.info("글쓰기 폼");
		//인증된 객체의 상세정보 가져오기
		Member member = (Member) auth.getDetails();
		
		model.addAttribute("cor", corService.select(member.getCompany_no()));
		
		
	}
	
	@RequestMapping(value="/recruitment/write", method= RequestMethod.POST)
	public String recruitWriteProc(
			Authentication auth,
			Recruit recruit,
			@RequestParam(value="file") MultipartFile fileupload,
			HttpServletRequest request
			) {
	
		logger.info("글쓰기");
		//인증된 객체의 상세정보 가져오기
		Member member = (Member) auth.getDetails();
				
		//객체에 담겨있는 회원번호 가져오기
		recruit.setMember_no(member.getMember_no());
		logger.info("사용자가 입력한 recruit"+recruit);
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("upload"));
		
		
		//파일 업로드를 하지 않았다면 
		if( fileupload.getOriginalFilename().equals("") ) { 

			recruitmentService.write(recruit);
			
			return "redirect: /recruitment/main";
			
			
		}else {// 파일 업로드가 있다면 
				
			recruitmentService.write(recruit);
			
			int recruit_no = recruit.getRecruit_no();   //write메소드가 리턴해주는 값이 select key에서 추출한 값. 
			
			recruitmentService.filesave(recruit_no, fileupload, context);
		}

		
		return "redirect:/recruitment/main";
	}
	
	@RequestMapping(value = "/recruitment/update", method = RequestMethod.GET) 
	public String recruitUpdate(Recruit recruit, Model model) {
		
		Recruit res = recruitmentService.view(recruit.getRecruit_no());
		model.addAttribute("view", res);
		return "board/update";
		
	}
	
	@RequestMapping(value="/recruitment/update", method=RequestMethod.POST)
	public String updateProc(
			Recruit recruit,
			Authentication auth,
			@RequestParam(value="file") MultipartFile fileupload
			) {
		//인증된 객체의 상세정보 가져오기
		Member member = (Member) auth.getDetails();
						
		//객체에 담겨있는 회원번호 가져오기
		recruit.setMember_no(member.getMember_no());
		
		recruitmentService.update(recruit);
		
		return "redirect:"+"/recruitment/view?recruit_no="+recruit.getRecruit_no();
		
	}
	
	@RequestMapping(value = "/recruitment/delete", method = RequestMethod.GET) 
	public String recruitDelete(Recruit recruit, Model model) {
		logger.info("채용공고 삭제");
		
		recruitmentService.delete(recruit);
		
		return "redirect:"+"/recruitment/main";
	}
	

}
