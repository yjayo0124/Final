package web.service.jobfair.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

public interface JobFairFileService {
	
	public void filesave(String title, MultipartFile file, ServletContext context);

}
