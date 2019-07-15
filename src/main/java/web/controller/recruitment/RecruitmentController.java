package web.controller.recruitment;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class RecruitmentController {

	private static final Logger logger = LoggerFactory.getLogger(RecruitmentController.class);
	

	@RequestMapping(value = "/recruit/main", method = RequestMethod.GET) 
	public void recruitList() {
		
	}
	
	@RequestMapping(value = "/recruit/detail", method = RequestMethod.GET) 
	public void recruitDetail() {
		
	}
	
	@RequestMapping(value = "/recruit/write", method = RequestMethod.GET) 
	public void recruitWrite() {
		
	}
	
	@RequestMapping(value = "/recruit/delete", method = RequestMethod.GET) 
	public void recruitDelete() {
		
	}
	

}
