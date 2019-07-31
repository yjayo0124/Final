package web.service.jobfair.impl;

import java.util.HashMap;
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
	public List<HashMap<String, Object>> calList() {
		return jobfairDao.selectAll();
	}
	
	@Override
	public JobFair mapList() {
		return jobfairDao.selectMap();
	}

	@Override
	public void registerFair(JobFair jobfair) {
		jobfairDao.insert(jobfair);
	}

	@Override
	public JobFair adminView(JobFair jobfair) {
		return jobfairDao.selectByJobfairNo(jobfair);
	}

	@Override
	public void updateFair(JobFair jobfair) {
		jobfairDao.update(jobfair);
	}
	
	@Override
	public void deleteFair(JobFair jobfair) {
		jobfairDao.delete(jobfair);
	}

	@Override
	public String jobFairSearch(String title) {
		return jobfairDao.selectByJobfairTitle(title);
	}
 
}
