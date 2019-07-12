package web.controller.mypage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.service.mypage.face.IntroductionService;
import web.service.mypage.face.MyCommentService;
import web.service.mypage.face.MyScrapService;
import web.service.mypage.face.MypageService;
import web.service.mypage.face.ResumeService;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Autowired MypageService mypageService;
	@Autowired IntroductionService introductionService;
	@Autowired ResumeService resumeService;
	@Autowired MyCommentService myCommentService;
	@Autowired MyScrapService myScrapService;
	
	@RequestMapping(value = "/mypage/main", method = RequestMethod.GET) 
	public void mypage() {
		logger.info("마이페이지 메인 접속");
		
	}
	
	@RequestMapping(value="/mypage/introduction/list", method=RequestMethod.GET)
	public void introductionList() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/write", method=RequestMethod.GET)
	public void introductionWrite() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/detail", method=RequestMethod.GET)
	public void introductionDetail() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/update", method=RequestMethod.GET)
	public void introductionUpdate() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/delete", method=RequestMethod.GET)
	public void introductionDelete() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/selectMain", method=RequestMethod.GET)
	public void introductionMain() {
		
	}
	
	@RequestMapping(value="/mypage/introduction/releaseMain", method=RequestMethod.GET)
	public void introductionReleaseMain() {
		
	}
	
	@RequestMapping(value="/mypage/resume/list", method=RequestMethod.GET)
	public void resumeList() {
		
	}
	
	@RequestMapping(value="/mypage/resume/write", method=RequestMethod.GET)
	public void resumeWrite() {
		
	}
	
	@RequestMapping(value="/mypage/resume/detail", method=RequestMethod.GET)
	public void resumeDetail() {
		
	}
	
	@RequestMapping(value="/mypage/resume/update", method=RequestMethod.GET)
	public void resumeUpdate() {
		
	}
	
	@RequestMapping(value="/mypage/resume/delete", method=RequestMethod.GET)
	public void resumeDelete() {
		
	}
	
	@RequestMapping(value="/mypage/resume/selectMain", method=RequestMethod.GET)
	public void resumeMain() {
		
	}
	
	@RequestMapping(value="/mypage/resume/releaseMain", method=RequestMethod.GET)
	public void resumeReleaseMain() {
		
	}
	
	@RequestMapping(value="/mypage/mycomment/list", method=RequestMethod.GET)
	public void myCommentList() {
		
	}
	
	@RequestMapping(value="/mypage/mycomment/delete", method=RequestMethod.GET)
	public void myCommentDelete() {
		
	}
	
	@RequestMapping(value="/mypage/myscrap/list", method=RequestMethod.GET)
	public void myScrapList() {
		
	}
	
	@RequestMapping(value="/mypage/myscrap/delete", method=RequestMethod.GET)
	public void myScrapDelete() {
		
	}
	
	
}
