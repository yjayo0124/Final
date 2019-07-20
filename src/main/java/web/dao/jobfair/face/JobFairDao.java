package web.dao.jobfair.face;

import java.util.List;

import web.dto.JobFair;

public interface JobFairDao {
	
	public List<JobFair> selectAll();
	
	public List<JobFair> selectByJobfairNo(int jobfair_no);
	
	public String selectByJobfairTitle(String title);
	
	public void insert(JobFair jobfair);
	
	public void update(JobFair jobfair);
	
	public void delete(JobFair jobfair);
 
}
