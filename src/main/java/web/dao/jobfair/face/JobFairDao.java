package web.dao.jobfair.face;

import java.util.HashMap;
import java.util.List;

import web.dto.JobFair;
import web.dto.JobFairFile;

public interface JobFairDao {
	
	public List<HashMap<String, Object>> selectAll();
	
	public JobFair selectByJobfairNo(int jobfair_no);
	
	public List<JobFair> selectByJobfairTitle(String search);
	
	public void insert(JobFair jobfair);
	
	public void update(JobFair jobfair);
	
	public void delete(int jobfair_no);
	
	public void insertFile(JobFairFile jobfairfile);
	
	public String selectFilename(int jobfair_no);
	
	public void updateFile(JobFairFile jobfairfile);
	
	public void deleteFile(int jobfair_no);
	
}
