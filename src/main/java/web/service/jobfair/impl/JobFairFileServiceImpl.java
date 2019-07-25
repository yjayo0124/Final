package web.service.jobfair.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.jobfair.face.JobFairFileDao;
import web.dto.JobFairFile;
import web.service.jobfair.face.JobFairFileService;

@Service
public class JobFairFileServiceImpl implements JobFairFileService {
	
	@Autowired JobFairFileDao jobfairfileDao;

	@Override
	public void filesave(String title, MultipartFile file, ServletContext context) {
		
		String storedPath = context.getRealPath("upload");
		
		String uId = UUID.randomUUID().toString().split("-")[4];
		
		String name = file.getOriginalFilename() + "_" + uId;
		
		File dest = new File(storedPath, name);
		
		try {
			file.transferTo(dest);
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		JobFairFile jobfairfile = new JobFairFile();
		
		jobfairfile.setJobfair_file_storedname(name);
		jobfairfile.setJobfair_file_originname(file.getOriginalFilename());
		
		jobfairfileDao.insertFile(jobfairfile);
		
		
	}

}
