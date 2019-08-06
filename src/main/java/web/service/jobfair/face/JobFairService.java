package web.service.jobfair.face;

import java.util.HashMap;
import java.util.List;

import web.dto.JobFair;

public interface JobFairService {
	
	public List<HashMap<String, Object>> calList();
	
	public void registerFair(JobFair jobfair);
	
	public JobFair adminView(int jobfair_no);
	
	public void updateFair(JobFair jobfair);
	
	public void deleteFair(int jobfair_no);
	
	public List<JobFair> jobFairSearch(String search); 
	
}
