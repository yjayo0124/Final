package web.service.jobfair.face;

import javax.servlet.ServletContext;

import org.springframework.web.multipart.MultipartFile;


public interface JobFairFileService {
	
	public void filesave(int jobfair_no, MultipartFile file, ServletContext context);

	public String getFilename(int jobfair_no);
	
	public void updateFile(int jobfair_no, MultipartFile file, ServletContext context);
	
	public void deleteFile(int jobfair_no);
	
}
