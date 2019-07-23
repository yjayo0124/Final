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
	public List<HashMap<String, Object>> adminView(int jobfair_no) {
		return jobfairDao.selectByJobfairNo(jobfair_no);
	}

	@Override
	public void updateFair(JobFair jobfair) {
		jobfairDao.update(jobfair);
	}

	@Override
	public String jobFairSearch(String title) {
		return jobfairDao.selectByJobfairTitle(title);
	}
 
}
