package web.controller.recruitment;

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

import web.dto.Cor;
import web.dto.Member;
import web.dto.Recruit;
import web.dto.Recruit_file;
import web.service.cor.face.CorService;
import web.service.corinfo.face.CorInfoService;
import web.service.mypage.face.MypageService;
import web.service.recruitment.face.RecruitmentService;
import web.util.Paging;

@Controller
public class RecruitmentController {

	@Autowired ServletContext context;
	@Autowired RecruitmentService recruitmentService;
	@Autowired CorService corService;
	@Autowired MypageService mypageService;
	@Autowired CorInfoService corinfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(RecruitmentController.class);
	
	@RequestMapping(value = "/recruitment/main", method = RequestMethod.GET) 
	public void recruitList( 
			HttpServletRequest req,
			Model model) {
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
	public void recruitView(
			Recruit recruit,
			int recruit_no,
			Model model) {
		
		logger.info("채용공고 상세페이지 :: 조회할 recruit_no --> "+recruit_no);
		
		Recruit res = recruitmentService.view(recruit_no);
		logger.info("조회한 데이터 :" + res.toString());
		model.addAttribute("viewRecruit", res);

		String file_name = recruitmentService.getFilename(recruit_no);
	//	logger.info("db에서 조회한 파일 이름  : "+file_name);
		model.addAttribute("file", file_name);
		
		
		Cor cor = corinfoService.getCorinfoByCorNo(res.getCor_no());
		
		// 기업 주소, 기업번호, 기업타입 가져오기
//		String corAddr = recruitmentService.getCor_addr(recruit_no);
//		model.addAttribute("cor", corAddr);	
//
//		String corNo = recruitmentService.getCorNo(recruit_no);
//		model.addAttribute("corno",corNo);
//		
//		String corType = recruitmentService.getCorType(recruit_no);
//		model.addAttribute("cortype",corType);

		model.addAttribute("cor", cor);
		
		logger.info("cor 정보 : "+cor);
		
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
		recruit.setCor_no(member.getCompany_no());
		
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
	public String recruitUpdate(
			HttpServletRequest req,
			Authentication auth,
			Recruit recruit, 
			int recruit_no,
			Model model) {
		
		//게시글 번호 파싱
		recruit_no = recruitmentService.getRecruitno(req);
		
		//게시글 상세 정보 전달
		recruit = recruitmentService.view(recruit_no);
		model.addAttribute("viewRecruit", recruit);
		
		//첨부파일 전달
		Recruit_file recruit_file = recruitmentService.viewFile(recruit_no);
		model.addAttribute("file", recruit_file);

		//인증된 객체의 상세정보 가져오기
		Member member = (Member) auth.getDetails();
		model.addAttribute("cor", corService.select(member.getCompany_no()));
		
		return "recruitment/update";
				
	}
	
	@RequestMapping(value="/recruitment/update", method=RequestMethod.POST)
	public String updateProc(
			Recruit recruit,
			Recruit_file recruit_file,
			Authentication auth,
			HttpServletRequest req,
			@RequestParam(value="file") MultipartFile fileupload
		) {
		
		//인증된 객체의 상세정보 가져오기
		Member member = (Member) auth.getDetails();
		
		//객체에 담겨있는 회원번호 가져오기
		recruit.setMember_no(member.getMember_no());
		
		logger.info("사용자가 입력한 recruit"+recruit);
		logger.info("파일 : " + fileupload.getOriginalFilename());
		logger.info(context.getRealPath("upload"));	
					
		//파일 업로드를 하지 않았다면 
			if( fileupload.getOriginalFilename().equals("") ) { 
				recruitmentService.update(recruit);
				return "redirect: /recruitment/main";
				
			}else {// 파일 업로드가 있다면 
				recruitmentService.update(recruit);
				int recruit_no = recruit.getRecruit_no();   //update 메소드가 리턴해주는 값이 select key에서 추출한 값. 
				recruitmentService.delete_File(recruit_file);
				recruitmentService.filesave(recruit_no, fileupload, context);
			}

		return "redirect:"+"/recruitment/view?recruit_no="+recruit.getRecruit_no();
		
	}
	
	@RequestMapping(value = "/recruitment/delete", method = RequestMethod.GET) 
	public String recruitDelete(Recruit recruit, Model model) {
		logger.info("채용공고 삭제");
		
		recruitmentService.delete(recruit);
		
		return "redirect:"+"/recruitment/main";
	}
	
	@RequestMapping(value="/recruitment/category/seoul",method=RequestMethod.GET)
	public void seoul( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	
	@RequestMapping(value="/recruitment/category/busan",method=RequestMethod.GET)
	public void busan( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	
	@RequestMapping(value="/recruitment/category/daegu",method=RequestMethod.GET)
	public void daegu( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	
	@RequestMapping(value="/recruitment/category/incheon",method=RequestMethod.GET)
	public void incheon( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/gwangju",method=RequestMethod.GET)
	public void gwangju( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/daejeon",method=RequestMethod.GET)
	public void daejeon( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/ulsan",method=RequestMethod.GET)
	public void ulsan( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/sejong",method=RequestMethod.GET)
	public void sejong( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/gyeonggi",method=RequestMethod.GET)
	public void gyeonggi( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/gangwon",method=RequestMethod.GET)
	public void gangwon( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/northChungcheong",method=RequestMethod.GET)
	public void northChungcheong( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/northJeonla",method=RequestMethod.GET)
	public void northJeonla( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/southJeonla",method=RequestMethod.GET)
	public void southJeonla( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/southgyeongsang",method=RequestMethod.GET)
	public void southChungcheong( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
	@RequestMapping(value="/recruitment/category/jeju",method=RequestMethod.GET)
	public void jeju( HttpServletRequest req, Model model) {
		//테이블 전체 조회 결과 얻기
		List list = recruitmentService.getListnotpaging();
		
		//Model로 조회결과 넣기
		model.addAttribute("List", list);		
	}
}
