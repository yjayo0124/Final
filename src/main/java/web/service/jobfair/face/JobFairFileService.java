package web.service.jobfair.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;

import web.dto.JobFair;
import web.dto.JobFairFile;


public interface JobFairFileService {
	
	public void filesave(int jobfair_no, MultipartFile file, ServletContext context);

	public String getFilename(int jobfair_no);
	
	public void deleteFile(JobFairFile jobfairfile);
	
}
