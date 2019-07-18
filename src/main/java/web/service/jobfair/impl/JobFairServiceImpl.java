package web.service.jobfair.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import web.dao.jobfair.face.JobFairDao;
import web.dto.JobFair;
import web.service.jobfair.face.JobFairService;

@Service
public class JobFairServiceImpl implements JobFairService {
	
	@Autowired JobFairDao jobfairDao;

	@Override
	public List<JobFair> calList() {

		
		
		return null;
	}

	@Override
	public void registerFair(JobFair jobfair) {
		jobfairDao.insert(jobfair);
	}

	@Override
	public JobFair adminView(int jobfair_no) {

		
		
		return null;
	}

	@Override
	public void updateFair(JobFair jobfair) {
		jobfairDao.update(jobfair);
	}

	@Override
	public List<String> jobFairSearch(String title) {

		
		
		return null;
	}
 
}
