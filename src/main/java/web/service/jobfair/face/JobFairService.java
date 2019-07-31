package web.service.jobfair.face;

import java.util.HashMap;
import java.util.List;

import web.dto.JobFair;

public interface JobFairService {
	
	public List<HashMap<String, Object>> calList();
	
	public JobFair mapList();
	
	public void registerFair(JobFair jobfair);
	
	public JobFair adminView(JobFair jobfair);
	
	public void updateFair(JobFair jobfair);
	
	public void deleteFair(JobFair jobfair);
	
	public String jobFairSearch(String title); 
	
}
