package web.service.jobfair.impl;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import web.dao.jobfair.face.JobFairDao;
import web.dto.JobFair;
import web.dto.JobFairFile;
import web.service.jobfair.face.JobFairFileService;

@Service
public class JobFairFileServiceImpl implements JobFairFileService {
	
	@Autowired JobFairDao jobfairDao;

	@Override
	public void filesave(int jobfair_no, MultipartFile file, ServletContext context) {
		
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
		jobfairfile.setJobfair_no(jobfair_no);
		
		jobfairDao.insertFile(jobfairfile);
		
	}
	
	@Override
	public String getFilename(int jobfair_no) {
		return jobfairDao.selectFilename(jobfair_no);
	}
	
	@Override
	public void updateFile(int jobfair_no, MultipartFile file, ServletContext context) {

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
		jobfairfile.setJobfair_no(jobfair_no);
		
//		System.out.println("service.update: " + jobfairfile);
		jobfairDao.updateFile(jobfairfile);
		
	}
	
	@Override
	public void deleteFile(int jobfair_no) {
		jobfairDao.deleteFile(jobfair_no);
	}

}
