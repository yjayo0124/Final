package web.dao.jobfair.face;

import java.util.HashMap;
import java.util.List;

import web.dto.JobFair;

public interface JobFairDao {
	
	public List<HashMap<String, Object>> selectAll();
	
	public List<HashMap<String, Object>> selectByJobfairNo(JobFair jobfair);
	
	public String selectByJobfairTitle(String title);
	
	public void insert(JobFair jobfair);
	
	public void update(JobFair jobfair);
	
	public void delete(JobFair jobfair);
 
}
