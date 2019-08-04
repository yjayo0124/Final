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
	public void registerFair(JobFair jobfair) {
		jobfairDao.insert(jobfair);
	}

	@Override
	public JobFair adminView(int jobfair_no) {
		return jobfairDao.selectByJobfairNo(jobfair_no);
	}

	@Override
	public void updateFair(JobFair jobfair) {
		jobfairDao.update(jobfair);
	}
	
	@Override
	public void deleteFair(int jobfair_no) {
		jobfairDao.delete(jobfair_no);
	}

	@Override
	public List<JobFair> jobFairSearch(String title) {
		System.out.println(jobfairDao.selectByJobfairTitle(title));
		return jobfairDao.selectByJobfairTitle(title);
	}
 
}
