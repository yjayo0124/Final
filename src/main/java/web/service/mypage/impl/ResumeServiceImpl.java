package web.service.mypage.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.mypage.face.ResumeDao;
import web.dto.mypage.resume.Resume;
import web.service.mypage.face.ResumeService;

@Service
public class ResumeServiceImpl implements ResumeService{

	@Autowired ResumeDao resumeDao;
	
	@Override
	public void insertResume(Resume resume) {
		
		resumeDao.insertResume(resume);
		
	}

}
