package web.dao.jobfair.face;

import java.util.HashMap;
import java.util.List;

import web.dto.JobFair;
import web.dto.JobFairFile;

public interface JobFairDao {
	
	public List<HashMap<String, Object>> selectAll();
	
	public JobFair selectMap();
	
	public JobFair selectByJobfairNo(JobFair jobfair);
	
	public String selectByJobfairTitle(String title);
	
	public void insert(JobFair jobfair);
	
	public void update(JobFair jobfair);
	
	public void delete(JobFair jobfair);
	
	public void insertFile(JobFairFile jobfairfile);
	
	public String selectFilename(int jobfair_no);
	
	public void deleteFile(JobFairFile jobfairfile);
	
}
