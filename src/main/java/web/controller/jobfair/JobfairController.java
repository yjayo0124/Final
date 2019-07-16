package web.controller.jobfair;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dto.JobFair;

@Controller
public class JobfairController {
	
	private static final Logger logger = LoggerFactory.getLogger(JobfairController.class);
	
	@RequestMapping(value="/jobfair/main", method=RequestMethod.GET)
	public void jobfair() {
		
	}
	
	@RequestMapping(value="/jobfair/register", method=RequestMethod.GET)
	public void register() {
		
	}
	
	@RequestMapping(value="/jobfair/register", method=RequestMethod.GET)
	public void registerProc(JobFair jobfair) {
		
	}
	
	@RequestMapping(value="/jobfair/adminview", method=RequestMethod.GET)
	public void adminView() {
		
	}
	
	@RequestMapping(value="/jobfair/adminview", method=RequestMethod.GET)
	public void adminViewProc(JobFair jobfair) {
		
	}
	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.GET)
	public void update() {
		
	}
	
	@RequestMapping(value="/jobfair/update", method=RequestMethod.GET)
	public void updateProc(JobFair jobfair) {
		
	}

}
